Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31DD286B6
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nirVSEQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700082312; x=1731618312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6U6D2mErq8dln3Y4MhY2NRRJ+cyEGpXbnQnI1u41Ys=;
  b=nirVSEQSYw1zicshazRJYBD1btpS4RaqwHxAoYgJNJ4JxkiIKIEERUSn
   6/rjr5RnvHEFOx/qaZtBu6DuSwI+CJwbXtsuTikYvsaAb6Fmqn5OlwqcM
   D9m1TmYyBhJvzsSVRlZ3/VNT2FgVl7Y6VR+lkkD43kNzAsUU9JONbEcpc
   Pe26O+o28DzNMxY+YaKlakvlQYpnv/mPi2m7J28gBe6wHHSsxeiRBj/rq
   QU8eYZr+1shYPe8tF+nDGlxZrIgYLdBIucrAOL1rVUxIyoXyINs4mXFkl
   e3+uiWfHe85i9K2zuH580AMuRnzsw1djLHvUZOPwPdgDz2LCVKynuKsNd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4032582"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="4032582"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 13:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="888699490"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="888699490"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2023 13:05:08 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3N4M-0000p8-1p;
	Wed, 15 Nov 2023 21:05:06 +0000
Date: Thu, 16 Nov 2023 05:04:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: cast
 from unknown type
Message-ID: <202311160457.NfusOqs6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "fbc c1fc48aad14dbe7654f5986afb906332b528d54b and parent 39fdf4be72f2b81238acbd4da48c75c135a6f1e0 have different kconfig"
:::::: Manual check reason: "low confidence static check first_new_problem: arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tianrui Zhao <zhaotianrui@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>
CC: Bibo Mao <maobibo@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: c1fc48aad14dbe7654f5986afb906332b528d54b LoongArch: KVM: Enable kvm config and add the makefile
date:   6 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-r133-20231107 (https://download.01.org/0day-ci/archive/20231116/202311160457.NfusOqs6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160457.NfusOqs6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160457.NfusOqs6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kvm/interrupt.c: note: in included file:
   arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
>> arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
>> arch/loongarch/include/asm/kvm_csr.h:169:1: sparse: sparse: cast from unknown type
--
   arch/loongarch/kvm/tlb.c:30:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kvm/tlb.c:30:33: sparse: sparse: cast from unknown type
--
   arch/loongarch/kvm/timer.c:75:15: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kvm/timer.c:75:15: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/timer.c:80:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/timer.c:80:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/timer.c:175:15: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/timer.c:175:15: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/timer.c:178:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/timer.c:178:17: sparse: sparse: cast from unknown type
--
   arch/loongarch/kvm/main.c:267:15: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kvm/main.c:267:15: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:270:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/main.c:270:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:271:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/main.c:271:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:272:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/main.c:272:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:291:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/main.c:291:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:297:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/main.c:297:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:297:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/main.c:297:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:297:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/main.c:297:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:297:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/main.c:297:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:305:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/main.c:305:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:306:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/main.c:306:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:307:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/main.c:307:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c:358:21: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/main.c:358:21: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/main.c: note: in included file:
   arch/loongarch/include/asm/kvm_csr.h:167:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/include/asm/kvm_csr.h:167:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:167:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/kvm_csr.h:167:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:168:1: sparse: sparse: cast from unknown type
--
   arch/loongarch/kvm/vcpu.c:16:49: sparse: sparse: array of flexible structures
   arch/loongarch/kvm/vcpu.c: note: in included file:
   include/linux/kvm_host.h:1948:56: sparse: sparse: array of flexible structures
   arch/loongarch/kvm/vcpu.c:104:42: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
>> arch/loongarch/kvm/vcpu.c:104:42: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c:644:33: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/kvm/vcpu.c:644:33: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c:723:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:723:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c:772:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/kvm/vcpu.c:772:9: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c:876:42: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/kvm/vcpu.c:876:42: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c: note: in included file:
>> include/linux/entry-kvm.h:94:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-kvm.h:94:9: sparse:     expected void *ptr
   include/linux/entry-kvm.h:94:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-kvm.h:94:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-kvm.h:94:9: sparse:     expected void *ptr
   include/linux/entry-kvm.h:94:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-kvm.h:94:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-kvm.h:94:9: sparse:     expected void *ptr
   include/linux/entry-kvm.h:94:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-kvm.h:94:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-kvm.h:94:9: sparse:     expected void *ptr
   include/linux/entry-kvm.h:94:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-kvm.h:94:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-kvm.h:94:9: sparse:     expected void *ptr
   include/linux/entry-kvm.h:94:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-kvm.h:94:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-kvm.h:94:9: sparse:     expected void *ptr
   include/linux/entry-kvm.h:94:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-kvm.h:94:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-kvm.h:94:9: sparse:     expected void *ptr
   include/linux/entry-kvm.h:94:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-kvm.h:94:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-kvm.h:94:9: sparse:     expected void *ptr
   include/linux/entry-kvm.h:94:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/vcpu.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:25: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c: note: in included file (through arch/loongarch/kvm/trace.h):
   arch/loongarch/include/asm/kvm_csr.h:166:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_d'
   arch/loongarch/include/asm/kvm_csr.h:166:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/kvm_csr.h:166:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/kvm_csr.h:166:1: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:72:17: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:81:17: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:1251:1: sparse: sparse: cast from unknown type
   arch/loongarch/kvm/vcpu.c: note: in included file:
   arch/loongarch/include/asm/fpu.h:218:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   arch/loongarch/include/asm/fpu.h:218:17: sparse: sparse: cast from unknown type
--
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: note: in included file:
   include/linux/kvm_host.h:1946:54: sparse: sparse: array of flexible structures
   include/linux/kvm_host.h:1948:56: sparse: sparse: array of flexible structures
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5332:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5342:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_change_pte' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_start' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_end' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_flush_young' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_young' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_test_young' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: note: in included file (through include/linux/mutex.h, include/linux/kvm_types.h, include/kvm/iodev.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1969:49: sparse: sparse: self-comparison always evaluates to false
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1975:37: sparse: sparse: self-comparison always evaluates to false
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:2674:9: sparse: sparse: context imbalance in 'hva_to_pfn_remapped' - unexpected unlock
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +169 arch/loongarch/include/asm/kvm_csr.h

dfe3dc07fa68f2 Tianrui Zhao 2023-10-02  165  
dfe3dc07fa68f2 Tianrui Zhao 2023-10-02  166  __BUILD_CSR_OP(gcfg)
dfe3dc07fa68f2 Tianrui Zhao 2023-10-02  167  __BUILD_CSR_OP(gstat)
dfe3dc07fa68f2 Tianrui Zhao 2023-10-02  168  __BUILD_CSR_OP(gtlbc)
dfe3dc07fa68f2 Tianrui Zhao 2023-10-02 @169  __BUILD_CSR_OP(gintc)
dfe3dc07fa68f2 Tianrui Zhao 2023-10-02  170  __BUILD_GCSR_OP(llbctl)
dfe3dc07fa68f2 Tianrui Zhao 2023-10-02  171  __BUILD_GCSR_OP(tlbidx)
dfe3dc07fa68f2 Tianrui Zhao 2023-10-02  172  

:::::: The code at line 169 was first introduced by commit
:::::: dfe3dc07fa68f2be1bf8af98656e674e9636d965 LoongArch: KVM: Add vcpu related header files

:::::: TO: Tianrui Zhao <zhaotianrui@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
