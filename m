Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5F77474
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jan 2023 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673358857; x=1704894857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TeAsJp9R8CBXZjujfM38mm/H3fBtXoXQ+RZk0s528Tc=;
  b=gYfBdda9R1icN99pSMEyFIMz4knec9VX08loxizhnnFcw6K9MCMRAWd6
   +15+Ai+mVXF7cATwzpz0VEfusMEwamK8WN0nuoXX0VwHjRXawe7/m1rlN
   2O/Hvk1tvO9SGdfV5+vZ4gg7iM0oi0nbSvROfexCrs4lPqY9XjyM0yq1V
   5hI3HsXs5JBL2KdqCG7MPeM1G04xXaYqNg0lcSfSyI8/ManevkJ7o8p+J
   s/BnZSaMaLTmgQvG6cMivbHTwHkLY1ODsm/PfmVL4YbLBnLeNuqNcEfRs
   zDQDANLi3uaCV2kzkuHLto5tegjyC0R2qyRHgjxsVRQZoOj9yi2ZcFyH9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="387599574"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="387599574"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 05:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="830996220"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="830996220"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Jan 2023 05:54:15 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFF4w-00084h-1Q;
	Tue, 10 Jan 2023 13:54:14 +0000
Date: Tue, 10 Jan 2023 21:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
Message-ID: <202301102152.PY5cx3qW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/riscv/mm/pageattr.c:224:16: warning: Uninitialized variable: pud [legacyUninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230109062407.3235-3-jeeheng.sia@starfivetech.com>
References: <20230109062407.3235-3-jeeheng.sia@starfivetech.com>
TO: Sia Jee Heng <jeeheng.sia@starfivetech.com>
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: jeeheng.sia@starfivetech.com
CC: leyfoon.tan@starfivetech.com
CC: mason.huo@starfivetech.com

Hi Sia,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1fe4fd6f5cad346e598593af36caeadc4f5d4fa9]

url:    https://github.com/intel-lab-lkp/linux/commits/Sia-Jee-Heng/RISC-V-Change-suspend_save_csrs-and-suspend_restore_csrs-to-public-function/20230109-142710
base:   1fe4fd6f5cad346e598593af36caeadc4f5d4fa9
patch link:    https://lore.kernel.org/r/20230109062407.3235-3-jeeheng.sia%40starfivetech.com
patch subject: [PATCH v2 2/3] RISC-V: mm: Enable huge page support to kernel_page_present() function
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 06219fe9529392096c2df31ceec83bce8f6c001b
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/mm/pageattr.c:224:16: warning: Uninitialized variable: pud [legacyUninitvar]
    if (p4d_leaf(*pud))
                  ^
--
>> drivers/firmware/efi/efi.c:125:44: warning: Parameter 'kobj' can be declared as pointer to const [constParameter]
   static ssize_t systab_show(struct kobject *kobj,
                                              ^

vim +224 arch/riscv/mm/pageattr.c

32a0de886eb3cb7 Mike Rapoport 2020-12-14  207  
32a0de886eb3cb7 Mike Rapoport 2020-12-14  208  bool kernel_page_present(struct page *page)
32a0de886eb3cb7 Mike Rapoport 2020-12-14  209  {
32a0de886eb3cb7 Mike Rapoport 2020-12-14  210  	unsigned long addr = (unsigned long)page_address(page);
32a0de886eb3cb7 Mike Rapoport 2020-12-14  211  	pgd_t *pgd;
32a0de886eb3cb7 Mike Rapoport 2020-12-14  212  	pud_t *pud;
32a0de886eb3cb7 Mike Rapoport 2020-12-14  213  	p4d_t *p4d;
32a0de886eb3cb7 Mike Rapoport 2020-12-14  214  	pmd_t *pmd;
32a0de886eb3cb7 Mike Rapoport 2020-12-14  215  	pte_t *pte;
32a0de886eb3cb7 Mike Rapoport 2020-12-14  216  
32a0de886eb3cb7 Mike Rapoport 2020-12-14  217  	pgd = pgd_offset_k(addr);
32a0de886eb3cb7 Mike Rapoport 2020-12-14  218  	if (!pgd_present(*pgd))
32a0de886eb3cb7 Mike Rapoport 2020-12-14  219  		return false;
32a0de886eb3cb7 Mike Rapoport 2020-12-14  220  
32a0de886eb3cb7 Mike Rapoport 2020-12-14  221  	p4d = p4d_offset(pgd, addr);
32a0de886eb3cb7 Mike Rapoport 2020-12-14  222  	if (!p4d_present(*p4d))
32a0de886eb3cb7 Mike Rapoport 2020-12-14  223  		return false;
06219fe95293920 Sia Jee Heng  2023-01-09 @224  	if (p4d_leaf(*pud))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
