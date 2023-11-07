Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F70236AF0
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 19:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bq3pMYMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699385757; x=1730921757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1F2DQEAPDiv4iF9hL76D/zv0VUMd9wY0yvWGQgfNBHI=;
  b=bq3pMYMinPD9vM0dXfFievRc55NgIBhmHc6j4FCRrzQTGcsvxAAkxAkc
   xwgq9mtOhG+M7LD0GphvJdCsr7GiyencQPooVMe2K4i6C78zmSmK3Mmcr
   DQuf1HaBGbaLdioD0FXAHzfMUce+XBqsEkdAIUI9K9raSKBzJUsIhLoAa
   swQn9xcSe4+A/env2UZX0f9aptvcec3XwoCkn16wP1OKhkKJCtuxSylfA
   K7rdXMhWTPH+is0KtL+Cxmd4R9Vf6mMrlnYhRYmACjcRWr7mhsKZ7lfn0
   l2il3UECIL2pmty4r/OYKihICmYSPYDnTo1BBppgOM4hSQlQcBEs9TAQY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2615854"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="2615854"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 11:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="791939656"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="791939656"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Nov 2023 11:35:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Rrd-0007MG-0a;
	Tue, 07 Nov 2023 19:35:53 +0000
Date: Wed, 8 Nov 2023 03:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/mm/kasan_init.c:200:9: sparse: sparse: cast from
 unknown type
Message-ID: <202311080315.mOccV9mP-lkp@intel.com>
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
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: 5aa4ac64e6add3e40d5049e31275b2822daf885d LoongArch: Add KASAN (Kernel Address Sanitizer) support
date:   9 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231108/202311080315.mOccV9mP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080315.mOccV9mP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311080315.mOccV9mP-lkp@intel.com/

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
