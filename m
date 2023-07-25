Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228F07C
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Jul 2023 01:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690249093; x=1721785093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MThJVTLRi641PVtD/kZnfsEm9lYrddNlDR3S3j+Vi4M=;
  b=CAD4gJNNjGIADYDbn4ne1DNtKTjJJgVssZ6pG6lNJ97JLDesuytmBJai
   46rc3CQh678WJUvoiBpDg66QUN89O/RPkMsbqZACdklf1mkgGeohbizxg
   ZbDJGAU48ZPUc0PO55zxlmP0uDmbEVyy+UtT1W6kZAcphTW2+vL1ZQ0RF
   /UyAaIZrdoZfLJWzVore4z1pk0corUOxxTlGjntybgJQGTwBhCLVZztp2
   2A5EXPFG/WcChumARQNcXAk3hNA6hns08pR7NvjDnQOu5UkObAY8uCQ4V
   bgAPVE5zHWKcXuZogQplgZK7MptbDr3OJnolreZZxNR7VJ5U/YVx8twaL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="371198841"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="371198841"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 18:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="703111286"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="703111286"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Jul 2023 18:38:11 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO706-000ABs-2e;
	Tue, 25 Jul 2023 01:38:10 +0000
Date: Tue, 25 Jul 2023 09:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] LoongArch: Allow usage of LSX/LASX in the kernel
Message-ID: <202307250910.vLcq0NZd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/loongarch/kernel/kfpu.c:32:22: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230722072201.2677516-1-chenhuacai@loongson.cn>
References: <20230722072201.2677516-1-chenhuacai@loongson.cn>
TO: Huacai Chen <chenhuacai@loongson.cn>

Hi Huacai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc3 next-20230724]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/LoongArch-Allow-usage-of-LSX-LASX-in-the-kernel/20230722-152324
base:   linus/master
patch link:    https://lore.kernel.org/r/20230722072201.2677516-1-chenhuacai%40loongson.cn
patch subject: [PATCH] LoongArch: Allow usage of LSX/LASX in the kernel
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-r091-20230723 (https://download.01.org/0day-ci/archive/20230725/202307250910.vLcq0NZd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250910.vLcq0NZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307250910.vLcq0NZd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kernel/kfpu.c:27:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:27:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:27:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:27:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:27:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:27:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:27:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:27:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:27:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:27:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:27:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:27:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:29:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:29:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:29:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:29:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:29:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:29:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:29:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:29:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:29:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:29:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:29:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:29:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:32:22: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
>> arch/loongarch/kernel/kfpu.c:32:22: sparse: sparse: cast from unknown type
   arch/loongarch/kernel/kfpu.c:55:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:55:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:55:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:55:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:55:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:55:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:55:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:55:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:55:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:55:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:55:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:55:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:72:22: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/kernel/kfpu.c:72:22: sparse: sparse: cast from unknown type

vim +32 arch/loongarch/kernel/kfpu.c

2b3bd32ea3a22e Huacai Chen 2023-05-01  20  
2b3bd32ea3a22e Huacai Chen 2023-05-01  21  void kernel_fpu_begin(void)
2b3bd32ea3a22e Huacai Chen 2023-05-01  22  {
17e80bad8a19c8 Huacai Chen 2023-07-22  23  	unsigned int *euen_curr;
17e80bad8a19c8 Huacai Chen 2023-07-22  24  
2b3bd32ea3a22e Huacai Chen 2023-05-01  25  	preempt_disable();
2b3bd32ea3a22e Huacai Chen 2023-05-01  26  
2b3bd32ea3a22e Huacai Chen 2023-05-01  27  	WARN_ON(this_cpu_read(in_kernel_fpu));
2b3bd32ea3a22e Huacai Chen 2023-05-01  28  
2b3bd32ea3a22e Huacai Chen 2023-05-01  29  	this_cpu_write(in_kernel_fpu, true);
17e80bad8a19c8 Huacai Chen 2023-07-22  30  	euen_curr = this_cpu_ptr(&euen_current);
2b3bd32ea3a22e Huacai Chen 2023-05-01  31  
17e80bad8a19c8 Huacai Chen 2023-07-22 @32  	*euen_curr = csr_xchg32(euen_mask, euen_mask, LOONGARCH_CSR_EUEN);
17e80bad8a19c8 Huacai Chen 2023-07-22  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
