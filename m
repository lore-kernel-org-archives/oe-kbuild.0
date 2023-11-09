Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADA71A5AB
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Nov 2023 11:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIPA+AWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699529183; x=1731065183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ERlLqk5o6L/7+1b9Pp3Jn7TfdtdfiVbw4PnCEgFHv38=;
  b=UIPA+AWl7fPm7rIUEQ0+VwrgScBbBMstW2GoFYpFgaZ2xL9mkzLBCoKp
   4imuP7Sf4SqmOd98ty1/ZY5TQHXeWxSyjBn9Ai6D2jWeTWRt4HUJWA4nO
   +8IoWVxARIWBVT5I0XWLXIdbihBrKnjQlN+jZGToIzCTKf4lH7+YNpGCc
   j7rha14njiOPcwOi1awdLdzHh8mKhYF3UmzDPi4+JQkXl9t80L+T5JcBI
   XCUP7RHtrpUNAdlBiRDX2St+LCxQWiOlljrGdH3de+GtkP17RNqy14GPg
   mCvMVYQ2nlm3euVM+0ARray8QqML5EN5/DZqXaMQui/vZ3VbJaxs8CbRe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370168239"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="370168239"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 03:26:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="11507687"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2023 03:26:22 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r13Ax-0008ge-2q;
	Thu, 09 Nov 2023 11:26:20 +0000
Date: Thu, 9 Nov 2023 19:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/mm/kasan_init.c:200:9: sparse: sparse: cast from
 unknown type
Message-ID: <202311091942.N9dtvzM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/loongarch/mm/kasan_init.c:200:9: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qing Zhang <zhangqing@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc986ab839c844e78a2333a02e55f02c9e57935
commit: 5aa4ac64e6add3e40d5049e31275b2822daf885d LoongArch: Add KASAN (Kernel Address Sanitizer) support
date:   9 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231109/202311091942.N9dtvzM4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311091942.N9dtvzM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311091942.N9dtvzM4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/mm/kasan_init.c:200:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
>> arch/loongarch/mm/kasan_init.c:200:9: sparse: sparse: cast from unknown type
   arch/loongarch/mm/kasan_init.c:237:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/mm/kasan_init.c:237:9: sparse: sparse: cast from unknown type

vim +200 arch/loongarch/mm/kasan_init.c

5aa4ac64e6add3 Qing Zhang 2023-09-06  185  
5aa4ac64e6add3 Qing Zhang 2023-09-06  186  void __init kasan_init(void)
5aa4ac64e6add3 Qing Zhang 2023-09-06  187  {
5aa4ac64e6add3 Qing Zhang 2023-09-06  188  	u64 i;
5aa4ac64e6add3 Qing Zhang 2023-09-06  189  	phys_addr_t pa_start, pa_end;
5aa4ac64e6add3 Qing Zhang 2023-09-06  190  
5aa4ac64e6add3 Qing Zhang 2023-09-06  191  	/*
5aa4ac64e6add3 Qing Zhang 2023-09-06  192  	 * PGD was populated as invalid_pmd_table or invalid_pud_table
5aa4ac64e6add3 Qing Zhang 2023-09-06  193  	 * in pagetable_init() which depends on how many levels of page
5aa4ac64e6add3 Qing Zhang 2023-09-06  194  	 * table you are using, but we had to clean the gpd of kasan
5aa4ac64e6add3 Qing Zhang 2023-09-06  195  	 * shadow memory, as the pgd value is none-zero.
5aa4ac64e6add3 Qing Zhang 2023-09-06  196  	 * The assertion pgd_none is going to be false and the formal populate
5aa4ac64e6add3 Qing Zhang 2023-09-06  197  	 * afterwards is not going to create any new pgd at all.
5aa4ac64e6add3 Qing Zhang 2023-09-06  198  	 */
5aa4ac64e6add3 Qing Zhang 2023-09-06  199  	memcpy(kasan_pg_dir, swapper_pg_dir, sizeof(kasan_pg_dir));
5aa4ac64e6add3 Qing Zhang 2023-09-06 @200  	csr_write64(__pa_symbol(kasan_pg_dir), LOONGARCH_CSR_PGDH);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
