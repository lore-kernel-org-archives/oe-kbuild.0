Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2B31D6A4
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZevehSvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701423314; x=1732959314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbexxHSI84s63c/JJfj0Ac3kJNVaxgTEDHfrZ7Qr//k=;
  b=ZevehSvP6oWDsSDMUGKw9n+q3ojNZ/GpClzHdsb0aIl1SKIEOB4GZOv7
   mmn0ZzXPnArwsTEDPYa6Xe37Q94EicOod56KPzx7FP2hLPKl9/XYMAaBW
   AMFZtpQ9Vxg9cC8a+3hylcV7WeqW36qOp4dDWNsnKSAMQKYDovT2Y32Bu
   2Sp0KUDUSjO+2QBk0dAOVgjiRdE3B+EmpMZlchVqoz2EprDm6v9F8c+r+
   n5KMYYM0/8aZj6QHOljt7Lt0cAjdbN6umqfzqOgjG654L0jn+2eUE8lkT
   J+AiFI8J0OYtrjwdQ8AgNqOiLVODT4+uaFFXK7mKxlyxmUqD3eadmcaab
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="457796715"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="457796715"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 01:35:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1101248263"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="1101248263"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 01 Dec 2023 01:35:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8zvR-0003Qe-1G;
	Fri, 01 Dec 2023 09:35:09 +0000
Date: Fri, 1 Dec 2023 17:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/kernel/kfpu.c:32:22: sparse: sparse: cast from
 unknown type
Message-ID: <202312011734.RNkCQNWZ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: WANG Xuerui <git@xen0n.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: 2478e4b7593a2a55073a4a6bf23dc885c19befd8 LoongArch: Allow usage of LSX/LASX in the kernel
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r034-20230511 (https://download.01.org/0day-ci/archive/20231201/202312011734.RNkCQNWZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011734.RNkCQNWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011734.RNkCQNWZ-lkp@intel.com/

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
2478e4b7593a2a Huacai Chen 2023-09-06  23  	unsigned int *euen_curr;
2478e4b7593a2a Huacai Chen 2023-09-06  24  
2b3bd32ea3a22e Huacai Chen 2023-05-01  25  	preempt_disable();
2b3bd32ea3a22e Huacai Chen 2023-05-01  26  
2b3bd32ea3a22e Huacai Chen 2023-05-01  27  	WARN_ON(this_cpu_read(in_kernel_fpu));
2b3bd32ea3a22e Huacai Chen 2023-05-01  28  
2b3bd32ea3a22e Huacai Chen 2023-05-01  29  	this_cpu_write(in_kernel_fpu, true);
2478e4b7593a2a Huacai Chen 2023-09-06  30  	euen_curr = this_cpu_ptr(&euen_current);
2b3bd32ea3a22e Huacai Chen 2023-05-01  31  
2478e4b7593a2a Huacai Chen 2023-09-06 @32  	*euen_curr = csr_xchg32(euen_mask, euen_mask, LOONGARCH_CSR_EUEN);
2478e4b7593a2a Huacai Chen 2023-09-06  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
