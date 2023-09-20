Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB301865A
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Sep 2023 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695210517; x=1726746517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=76EY39ne2UB9biiuK68W8w/is7Wo2FZBCnwnwPZVKTw=;
  b=QJXchmuu0Sz4j8vN2ndy9mTRNfI4EPRIX0KeesysOamA6/zL2YQBkfWK
   qbs+E/WEShtcEfXRC1GN98QOLSxYtOSzsYSnSDdpBN22+JVTZ64RxjZvR
   QB/bzebEodbOfkzKVOrx9P3d8ujmZmFSHNL/ksA/uwgTVgeyYyRVxugYT
   RxKZPLGB65Cn41g28FAgfxeEVeZBj+jMlvn7jnJ22ZHrNzeK5Y/sspqye
   X3TD9zveTT5ezZKYUF8QY/KYXo8VGUpEVSute+m6MJT2gQRig6pLbmqqH
   9JSAvqui17o7+avWFC52AtbOirmmv9/rcYSvxkW4ewmn3Nb1p1LB/oKL8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382944590"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="382944590"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 04:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836812756"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="836812756"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Sep 2023 04:48:33 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qivh1-0008hs-1g;
	Wed, 20 Sep 2023 11:48:31 +0000
Date: Wed, 20 Sep 2023 19:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] riscv: Rearrange hwcap.h and cpufeature.h
Message-ID: <202309201921.GvBmYK5q-lkp@intel.com>
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
In-Reply-To: <20230920074653.2509631-2-xiao.w.wang@intel.com>
References: <20230920074653.2509631-2-xiao.w.wang@intel.com>
TO: Xiao Wang <xiao.w.wang@intel.com>
TO: paul.walmsley@sifive.com
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: ardb@kernel.org
CC: anup@brainfault.org
CC: haicheng.li@intel.com
CC: ajones@ventanamicro.com
CC: linux-riscv@lists.infradead.org
CC: linux-efi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Xiao Wang <xiao.w.wang@intel.com>

Hi Xiao,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc2 next-20230920]
[cannot apply to efi/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiao-Wang/riscv-Rearrange-hwcap-h-and-cpufeature-h/20230920-154024
base:   linus/master
patch link:    https://lore.kernel.org/r/20230920074653.2509631-2-xiao.w.wang%40intel.com
patch subject: [PATCH v2 1/2] riscv: Rearrange hwcap.h and cpufeature.h
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230920/202309201921.GvBmYK5q-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201921.GvBmYK5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309201921.GvBmYK5q-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'create_elf_tables':
>> arch/riscv/include/asm/elf.h:70:25: error: implicit declaration of function 'riscv_get_elf_hwcap'; did you mean 'riscv_fill_hwcap'? [-Werror=implicit-function-declaration]
      70 | #define ELF_HWCAP       riscv_get_elf_hwcap()
         |                         ^~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:248:31: note: in definition of macro 'NEW_AUX_ENT'
     248 |                 *elf_info++ = val; \
         |                               ^~~
   fs/binfmt_elf.c:260:31: note: in expansion of macro 'ELF_HWCAP'
     260 |         NEW_AUX_ENT(AT_HWCAP, ELF_HWCAP);
         |                               ^~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/riscv/kvm/main.c: In function 'riscv_kvm_init':
>> arch/riscv/kvm/main.c:73:14: error: implicit declaration of function 'riscv_isa_extension_available' [-Werror=implicit-function-declaration]
      73 |         if (!riscv_isa_extension_available(NULL, h)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/main.c:73:50: error: 'h' undeclared (first use in this function)
      73 |         if (!riscv_isa_extension_available(NULL, h)) {
         |                                                  ^
   arch/riscv/kvm/main.c:73:50: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   arch/riscv/kvm/tlb.c: In function 'kvm_riscv_local_hfence_gvma_vmid_gpa':
>> arch/riscv/kvm/tlb.c:18:25: error: implicit declaration of function 'riscv_has_extension_unlikely' [-Werror=implicit-function-declaration]
      18 | #define has_svinval()   riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/tlb.c:31:13: note: in expansion of macro 'has_svinval'
      31 |         if (has_svinval()) {
         |             ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/riscv/kvm/vcpu_fp.c: In function 'kvm_riscv_vcpu_fp_reset':
>> arch/riscv/kvm/vcpu_fp.c:22:13: error: implicit declaration of function 'riscv_isa_extension_available' [-Werror=implicit-function-declaration]
      22 |         if (riscv_isa_extension_available(vcpu->arch.isa, f) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_fp.c:22:59: error: 'f' undeclared (first use in this function); did you mean 'fd'?
      22 |         if (riscv_isa_extension_available(vcpu->arch.isa, f) ||
         |                                                           ^
         |                                                           fd
   arch/riscv/kvm/vcpu_fp.c:22:59: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/kvm/vcpu_fp.c:23:59: error: 'd' undeclared (first use in this function); did you mean 'fd'?
      23 |             riscv_isa_extension_available(vcpu->arch.isa, d))
         |                                                           ^
         |                                                           fd
   arch/riscv/kvm/vcpu_fp.c: In function 'kvm_riscv_vcpu_guest_fp_save':
   arch/riscv/kvm/vcpu_fp.c:39:56: error: 'd' undeclared (first use in this function); did you mean 'fd'?
      39 |                 if (riscv_isa_extension_available(isa, d))
         |                                                        ^
         |                                                        fd
   arch/riscv/kvm/vcpu_fp.c:41:61: error: 'f' undeclared (first use in this function); did you mean 'fd'?
      41 |                 else if (riscv_isa_extension_available(isa, f))
         |                                                             ^
         |                                                             fd
   arch/riscv/kvm/vcpu_fp.c: In function 'kvm_riscv_vcpu_guest_fp_restore':
   arch/riscv/kvm/vcpu_fp.c:51:56: error: 'd' undeclared (first use in this function); did you mean 'fd'?
      51 |                 if (riscv_isa_extension_available(isa, d))
         |                                                        ^
         |                                                        fd
   arch/riscv/kvm/vcpu_fp.c:53:61: error: 'f' undeclared (first use in this function); did you mean 'fd'?
      53 |                 else if (riscv_isa_extension_available(isa, f))
         |                                                             ^
         |                                                             fd
   arch/riscv/kvm/vcpu_fp.c: In function 'kvm_riscv_vcpu_host_fp_save':
   arch/riscv/kvm/vcpu_fp.c:62:49: error: 'd' undeclared (first use in this function); did you mean 'fd'?
      62 |         if (riscv_isa_extension_available(NULL, d))
         |                                                 ^
         |                                                 fd
   arch/riscv/kvm/vcpu_fp.c:64:54: error: 'f' undeclared (first use in this function); did you mean 'fd'?
      64 |         else if (riscv_isa_extension_available(NULL, f))
         |                                                      ^
         |                                                      fd
   arch/riscv/kvm/vcpu_fp.c: In function 'kvm_riscv_vcpu_host_fp_restore':
   arch/riscv/kvm/vcpu_fp.c:70:49: error: 'd' undeclared (first use in this function); did you mean 'fd'?
      70 |         if (riscv_isa_extension_available(NULL, d))
         |                                                 ^
         |                                                 fd
   arch/riscv/kvm/vcpu_fp.c:72:54: error: 'f' undeclared (first use in this function); did you mean 'fd'?
      72 |         else if (riscv_isa_extension_available(NULL, f))
         |                                                      ^
         |                                                      fd
   arch/riscv/kvm/vcpu_fp.c: In function 'kvm_riscv_vcpu_get_reg_fp':
   arch/riscv/kvm/vcpu_fp.c:90:59: error: 'f' undeclared (first use in this function); did you mean 'fd'?
      90 |             riscv_isa_extension_available(vcpu->arch.isa, f)) {
         |                                                           ^
         |                                                           fd
   arch/riscv/kvm/vcpu_fp.c:101:66: error: 'd' undeclared (first use in this function); did you mean 'fd'?
     101 |                    riscv_isa_extension_available(vcpu->arch.isa, d)) {
         |                                                                  ^
         |                                                                  fd
   arch/riscv/kvm/vcpu_fp.c: In function 'kvm_riscv_vcpu_set_reg_fp':
   arch/riscv/kvm/vcpu_fp.c:135:59: error: 'f' undeclared (first use in this function); did you mean 'fd'?
     135 |             riscv_isa_extension_available(vcpu->arch.isa, f)) {
         |                                                           ^
         |                                                           fd
   arch/riscv/kvm/vcpu_fp.c:146:66: error: 'd' undeclared (first use in this function); did you mean 'fd'?
     146 |                    riscv_isa_extension_available(vcpu->arch.isa, d)) {
         |                                                                  ^
         |                                                                  fd
   cc1: some warnings being treated as errors
--
   arch/riscv/kvm/vcpu_timer.c: In function 'kvm_riscv_vcpu_timer_init':
>> arch/riscv/kvm/vcpu_timer.c:256:13: error: implicit declaration of function 'riscv_isa_extension_available' [-Werror=implicit-function-declaration]
     256 |         if (riscv_isa_extension_available(NULL, SSTC)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_timer.c:256:49: error: 'SSTC' undeclared (first use in this function)
     256 |         if (riscv_isa_extension_available(NULL, SSTC)) {
         |                                                 ^~~~
   arch/riscv/kvm/vcpu_timer.c:256:49: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   arch/riscv/kvm/vcpu_pmu.c: In function 'kvm_riscv_vcpu_pmu_init':
>> arch/riscv/kvm/vcpu_pmu.c:556:14: error: implicit declaration of function 'riscv_isa_extension_available' [-Werror=implicit-function-declaration]
     556 |         if (!riscv_isa_extension_available(NULL, SSCOFPMF))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu_pmu.c:556:50: error: 'SSCOFPMF' undeclared (first use in this function)
     556 |         if (!riscv_isa_extension_available(NULL, SSCOFPMF))
         |                                                  ^~~~~~~~
   arch/riscv/kvm/vcpu_pmu.c:556:50: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   arch/riscv/kvm/aia.c: In function 'kvm_riscv_aia_init':
>> arch/riscv/kvm/aia.c:604:14: error: implicit declaration of function 'riscv_isa_extension_available' [-Werror=implicit-function-declaration]
     604 |         if (!riscv_isa_extension_available(NULL, SxAIA))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/aia.c:604:50: error: 'SxAIA' undeclared (first use in this function)
     604 |         if (!riscv_isa_extension_available(NULL, SxAIA))
         |                                                  ^~~~~
   arch/riscv/kvm/aia.c:604:50: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   drivers/perf/riscv_pmu_sbi.c: In function 'pmu_sbi_setup_irqs':
>> drivers/perf/riscv_pmu_sbi.c:803:13: error: implicit declaration of function 'riscv_isa_extension_available' [-Werror=implicit-function-declaration]
     803 |         if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/perf/riscv_pmu_sbi.c:803:49: error: 'SSCOFPMF' undeclared (first use in this function)
     803 |         if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
         |                                                 ^~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:803:49: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +70 arch/riscv/include/asm/elf.h

2350bd192fa2d9 Palmer Dabbelt 2023-02-02  64  
2129a235c09896 Palmer Dabbelt 2017-07-10  65  /*
2350bd192fa2d9 Palmer Dabbelt 2023-02-02  66   * Provides information on the availiable set of ISA extensions to userspace,
2350bd192fa2d9 Palmer Dabbelt 2023-02-02  67   * via a bitmap that coorespends to each single-letter ISA extension.  This is
2350bd192fa2d9 Palmer Dabbelt 2023-02-02  68   * essentially defunct, but will remain for compatibility with userspace.
2129a235c09896 Palmer Dabbelt 2017-07-10  69   */
50724efcb370c6 Andy Chiu      2023-06-05 @70  #define ELF_HWCAP	riscv_get_elf_hwcap()
2129a235c09896 Palmer Dabbelt 2017-07-10  71  extern unsigned long elf_hwcap;
2129a235c09896 Palmer Dabbelt 2017-07-10  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
