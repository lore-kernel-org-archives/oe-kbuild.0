Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C363C5
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Dec 2022 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670604694; x=1702140694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kn+RZlTBzkmQvNbYLbYgyGarv7oggAVIJ/Ox/5+15UE=;
  b=Ugk0sC0UV9rdgWnaFPAV/A6AsWGUP4PFOwLRdSQJZK937/uufRUBxzl1
   /oo8OxN82qXN58kvFjxq56jprExH/fVUuCm0GAwCRoHdG0ecbvWNFi9pK
   N0lpuSQcUpqr6z06BFeeXspFQmTjM9Zo4eIl0oe2aMTlomzrV258WGsRM
   i1MgKgyAYjrzqqh1lAxP7lQ2XWBeu368C+LsocsRcnQsod4tXNkDk71SD
   S8y7aZaS+136hPbO1O6jUY3vlSKqFBMG63xq5W9XL9zfe4zedJdfBzwkp
   wwDs4+Zu8ow0sstTa39GX/56kbLhrn1ynKrU77Op/VAGjKz2EV8fJJ2sR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="319359496"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="319359496"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 08:51:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="892728588"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="892728588"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Dec 2022 08:51:17 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3gai-0001yB-1D;
	Fri, 09 Dec 2022 16:51:16 +0000
Date: Sat, 10 Dec 2022 00:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10715/14039] arch/arm64/kernel/fpsimd.c:1741:52:
 warning: Parameter 'state' can be declared as pointer to const
 [constParameter]
Message-ID: <202212100000.We5D6iot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/kernel/fpsimd.c:1741:52: warning: Parameter 'state' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mark Brown <broonie@kernel.org>
CC: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f925116b24c0c42dc6d5ab5111c55fd7f74e8dc7
commit: 1192b93ba3528feaf37dc4b5d8d6bdbb475791ad [10715/14039] arm64/fp: Use a struct to pass data to fpsimd_bind_state_to_cpu()
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 1192b93ba3528feaf37dc4b5d8d6bdbb475791ad
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/vdso.c:303:36: warning: Subtracting pointers that point to different objects [comparePointers]
    int kuser_sz = __kuser_helper_end - __kuser_helper_start;
                                      ^
   arch/arm64/kernel/vdso.c:302:38: note: Variable declared here.
    extern char __kuser_helper_start[], __kuser_helper_end[];
                                        ^
   arch/arm64/kernel/vdso.c:303:17: note: Array decayed to pointer here.
    int kuser_sz = __kuser_helper_end - __kuser_helper_start;
                   ^
   arch/arm64/kernel/vdso.c:302:14: note: Variable declared here.
    extern char __kuser_helper_start[], __kuser_helper_end[];
                ^
   arch/arm64/kernel/vdso.c:303:38: note: Array decayed to pointer here.
    int kuser_sz = __kuser_helper_end - __kuser_helper_start;
                                        ^
   arch/arm64/kernel/vdso.c:303:36: note: Subtracting pointers that point to different objects
    int kuser_sz = __kuser_helper_end - __kuser_helper_start;
                                      ^
   arch/arm64/kernel/vdso.c:323:44: warning: Subtracting pointers that point to different objects [comparePointers]
    int sigret_sz = __aarch32_sigret_code_end - __aarch32_sigret_code_start;
                                              ^
   arch/arm64/kernel/vdso.c:322:45: note: Variable declared here.
    extern char __aarch32_sigret_code_start[], __aarch32_sigret_code_end[];
                                               ^
   arch/arm64/kernel/vdso.c:323:18: note: Array decayed to pointer here.
    int sigret_sz = __aarch32_sigret_code_end - __aarch32_sigret_code_start;
                    ^
   arch/arm64/kernel/vdso.c:322:14: note: Variable declared here.
    extern char __aarch32_sigret_code_start[], __aarch32_sigret_code_end[];
                ^
   arch/arm64/kernel/vdso.c:323:46: note: Array decayed to pointer here.
    int sigret_sz = __aarch32_sigret_code_end - __aarch32_sigret_code_start;
                                                ^
   arch/arm64/kernel/vdso.c:323:44: note: Subtracting pointers that point to different objects
    int sigret_sz = __aarch32_sigret_code_end - __aarch32_sigret_code_start;
                                              ^
--
>> arch/arm64/kernel/fpsimd.c:1741:52: warning: Parameter 'state' can be declared as pointer to const [constParameter]
   void fpsimd_bind_state_to_cpu(struct cpu_fp_state *state)
                                                      ^
--
>> arch/arm64/kernel/proton-pack.c:300:5: warning: Redundant assignment of 'cb' to itself. [selfAssignment]
    cb = spectre_v2_get_sw_mitigation_cb() ?: cb;
       ^
--
>> arch/arm64/mm/mmu.c:624:74: warning: Parameter 'va_end' can be declared as pointer to const [constParameter]
   static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
                                                                            ^
>> arch/arm64/mm/mmu.c:1499:41: warning: Parameter 'pgdir' can be declared as pointer to const [constParameter]
   static void __remove_pgd_mapping(pgd_t *pgdir, unsigned long start, u64 size)
                                           ^
--
>> arch/arm64/kernel/ptrace.c:1906:11: warning: Parameter 'kdata' can be declared as pointer to const [constParameter]
        u32 *kdata)
             ^

vim +/state +1741 arch/arm64/kernel/fpsimd.c

8884b7bd7e52de Dave Martin      2017-12-06  1740  
1192b93ba3528f Mark Brown       2022-11-15 @1741  void fpsimd_bind_state_to_cpu(struct cpu_fp_state *state)
e6b673b741ea0d Dave Martin      2018-04-06  1742  {
1192b93ba3528f Mark Brown       2022-11-15  1743  	struct cpu_fp_state *last = this_cpu_ptr(&fpsimd_last_state);
e6b673b741ea0d Dave Martin      2018-04-06  1744  
52f73c383b2418 Suzuki K Poulose 2020-01-13  1745  	WARN_ON(!system_supports_fpsimd());
e6b673b741ea0d Dave Martin      2018-04-06  1746  	WARN_ON(!in_softirq() && !irqs_disabled());
e6b673b741ea0d Dave Martin      2018-04-06  1747  
1192b93ba3528f Mark Brown       2022-11-15  1748  	*last = *state;
8884b7bd7e52de Dave Martin      2017-12-06  1749  }
8884b7bd7e52de Dave Martin      2017-12-06  1750  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
