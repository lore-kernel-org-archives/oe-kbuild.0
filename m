Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE9B1878
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676971736; x=1708507736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5/fkoqTgy3RiXNVk+h/izsnLMIidMSGP158VjqzUB8=;
  b=KoYx7laRf8A6hk2/u5IA1o6HtnCCjn70cplFEMWdr4xDQl8aEtNGkIoo
   Yohj2IoxBCDQAotSA7Df0rSW1eLbBaskSibpIToxVqCAGUzGsSA2LAE9f
   jEWO0Fzs1ajrSWcVm0uJGsVFxqJnenfSrpSs8xgMwvnYwWUhPtXtFX12G
   T4Hc6CZIBNO02C4g/sER0P+3NgP3EXOEewRXnku/7yXsonX0ZTqzNIaC1
   yiT9+vXBjTafO1Sg924cvS0akdqCphOXX72wQx4UDlgMLxxRUYw1wXYhg
   afFEFDHCfzYg34qsNLY+mB/u7xNwNyUKtdaj4KmdvRLeNgvSaQuFdjHn0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="320717343"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="320717343"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 01:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="814440715"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814440715"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 01:28:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUOxB-000EcX-21;
	Tue, 21 Feb 2023 09:28:53 +0000
Date: Tue, 21 Feb 2023 17:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/hashtab.c:94:8: warning: Excessive padding in 'struct
 bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map,
 pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd,
 lockdep_key, map_locked, ma, pcpu_ma, ...
Message-ID: <202302211711.HaT7It39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/bpf/hashtab.c:94:8: warning: Excessive padding in 'struct bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map, pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd, lockdep_key, map_locked, ma, pcpu_ma, , use_percpu_counter, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89f5349e0673322857bd432fa23113af56673739
commit: 9f2c6e96c65e6fa1aebef546be0c30a5895fcb37 bpf: Optimize rcu_barrier usage between hash map and bpf_mem_alloc.
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-c004-20230219 (https://download.01.org/0day-ci/archive/20230221/202302211711.HaT7It39-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f2c6e96c65e6fa1aebef546be0c30a5895fcb37
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9f2c6e96c65e6fa1aebef546be0c30a5895fcb37
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302211711.HaT7It39-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   arch/mips/include/asm/cpu-features.h:384:25: note: expanded from macro 'cpu_has_clo_clz'
   #define cpu_has_clo_clz cpu_has_mips_r
                           ^
   arch/mips/include/asm/cpu-features.h:336:5: note: expanded from macro 'cpu_has_mips_r'
                            cpu_has_mips64r5 | cpu_has_mips64r6)
                            ^
   arch/mips/include/asm/cpu-features.h:299:43: note: expanded from macro 'cpu_has_mips64r5'
   # define cpu_has_mips64r5       (cpu_has_64bits && \
                                                   ^
   arch/mips/include/asm/bitops.h:390:27: note: 2 is < 6
               __builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
                                    ^
   arch/mips/include/asm/cpu-features.h:384:25: note: expanded from macro 'cpu_has_clo_clz'
   #define cpu_has_clo_clz cpu_has_mips_r
                           ^~~~~~~~~~~~~~
   arch/mips/include/asm/cpu-features.h:336:24: note: expanded from macro 'cpu_has_mips_r'
                            cpu_has_mips64r5 | cpu_has_mips64r6)
                                               ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/cpu-features.h:303:27: note: expanded from macro 'cpu_has_mips64r6'
   # define cpu_has_mips64r6       __isa_ge_and_flag(6, MIPS_CPU_ISA_M64R6)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/cpu-features.h:60:40: note: expanded from macro '__isa_ge_and_flag'
   #define __isa_ge_and_flag(isa, flag)    ((MIPS_ISA_REV >= (isa)) && __isa(flag))
                                             ^~~~~~~~~~~~
   arch/mips/include/asm/isa-rev.h:17:22: note: expanded from macro 'MIPS_ISA_REV'
   #define MIPS_ISA_REV __mips_isa_rev
                        ^~~~~~~~~~~~~~
   note: expanded from macro '__mips_isa_rev'
   arch/mips/include/asm/bitops.h:390:27: note: Left side of '&&' is false
               __builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
                                    ^
   arch/mips/include/asm/cpu-features.h:384:25: note: expanded from macro 'cpu_has_clo_clz'
   #define cpu_has_clo_clz cpu_has_mips_r
                           ^
   arch/mips/include/asm/cpu-features.h:336:24: note: expanded from macro 'cpu_has_mips_r'
                            cpu_has_mips64r5 | cpu_has_mips64r6)
                                               ^
   arch/mips/include/asm/cpu-features.h:303:27: note: expanded from macro 'cpu_has_mips64r6'
   # define cpu_has_mips64r6       __isa_ge_and_flag(6, MIPS_CPU_ISA_M64R6)
                                   ^
   arch/mips/include/asm/cpu-features.h:60:63: note: expanded from macro '__isa_ge_and_flag'
   #define __isa_ge_and_flag(isa, flag)    ((MIPS_ISA_REV >= (isa)) && __isa(flag))
                                                                    ^
   arch/mips/include/asm/bitops.h:390:44: note: Left side of '&&' is false
               __builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
                                                     ^
   arch/mips/include/asm/bitops.h:402:2: note: The value 32 is assigned to 'r'
           r = 32;
           ^~~~~~
   arch/mips/include/asm/bitops.h:403:6: note: Assuming 'x' is not equal to 0, which participates in a condition later
           if (!x)
               ^~
   arch/mips/include/asm/bitops.h:403:2: note: Taking false branch
           if (!x)
           ^
   arch/mips/include/asm/bitops.h:405:6: note: Assuming the condition is false
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:405:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   arch/mips/include/asm/bitops.h:409:6: note: Assuming the condition is false
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:409:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   arch/mips/include/asm/bitops.h:413:6: note: Assuming the condition is false
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:413:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:417:6: note: Assuming the condition is false
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:417:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   arch/mips/include/asm/bitops.h:421:6: note: Assuming the condition is false
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bitops.h:421:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   arch/mips/include/asm/bitops.h:425:2: note: Returning the value 32 (loaded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:205:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:205:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
>> kernel/bpf/hashtab.c:94:8: warning: Excessive padding in 'struct bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map, pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd, lockdep_key, map_locked, ma, pcpu_ma, , use_percpu_counter, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct bpf_htab {
   ~~~~~~~^~~~~~~~~~
   kernel/bpf/hashtab.c:94:8: note: Excessive padding in 'struct bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map, pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd, lockdep_key, map_locked, ma, pcpu_ma, , use_percpu_counter, consider reordering the fields or adding explicit padding members
   struct bpf_htab {
   ~~~~~~~^~~~~~~~~~
   kernel/bpf/hashtab.c:336:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(l->key, key, htab->map.key_size);
                   ^~~~~~
   kernel/bpf/hashtab.c:336:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(l->key, key, htab->map.key_size);
                   ^~~~~~
   kernel/bpf/hashtab.c:874:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(next_key, next_l->key, key_size);
                   ^~~~~~
   kernel/bpf/hashtab.c:874:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(next_key, next_l->key, key_size);
                   ^~~~~~
   kernel/bpf/hashtab.c:892:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(next_key, next_l->key, key_size);
                           ^~~~~~
   kernel/bpf/hashtab.c:892:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(next_key, next_l->key, key_size);
                           ^~~~~~
   kernel/bpf/hashtab.c:963:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(this_cpu_ptr(pptr), value, htab->map.value_size);
                   ^~~~~~
   kernel/bpf/hashtab.c:963:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(this_cpu_ptr(pptr), value, htab->map.value_size);
                   ^~~~~~
   kernel/bpf/hashtab.c:994:5: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(per_cpu_ptr(pptr, cpu), 0, size);
                                   ^~~~~~
   kernel/bpf/hashtab.c:994:5: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                                   memset(per_cpu_ptr(pptr, cpu), 0, size);
                                   ^~~~~~
   kernel/bpf/hashtab.c:1053:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(l_new->key, key, key_size);
           ^~~~~~
   kernel/bpf/hashtab.c:1053:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(l_new->key, key, key_size);
           ^~~~~~
   kernel/bpf/hashtab.c:1075:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(l_new->key + round_up(key_size, 8), value, size);
                   ^~~~~~
   kernel/bpf/hashtab.c:1075:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(l_new->key + round_up(key_size, 8), value, size);
                   ^~~~~~
   kernel/bpf/hashtab.c:1815:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst_key, l->key, key_size);
                   ^~~~~~
   kernel/bpf/hashtab.c:1815:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst_key, l->key, key_size);
                   ^~~~~~
   kernel/bpf/hashtab.c:2019:3: warning: Value stored to 'b' is never read [clang-analyzer-deadcode.DeadStores]
                   b = &htab->buckets[bucket_id++];
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/hashtab.c:2019:3: note: Value stored to 'b' is never read
                   b = &htab->buckets[bucket_id++];
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   33 warnings generated.
   security/keys/user_defined.c:75:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(upayload->data, prep->data, datalen);
           ^~~~~~
   security/keys/user_defined.c:75:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(upayload->data, prep->data, datalen);
           ^~~~~~
   security/keys/user_defined.c:184:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer, upayload->data, buflen);
                   ^~~~~~
   security/keys/user_defined.c:184:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buffer, upayload->data, buflen);
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   40 warnings generated.
   lib/buildid.c:31:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(build_id,
                           ^~~~~~
   lib/buildid.c:31:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(build_id,
                           ^~~~~~
   lib/buildid.c:35:4: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(build_id + nhdr->n_descsz, 0,
                           ^~~~~~
   lib/buildid.c:35:4: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                           memset(build_id + nhdr->n_descsz, 0,
                           ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   lib/debugobjects.c:499:9: warning: Value stored to 'hint' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                   void *hint = descr->debug_hint ?
                         ^~~~   ~~~~~~~~~~~~~~~~~~~

vim +94 kernel/bpf/hashtab.c

20b6cc34ea74b6 Song Liu              2020-10-29   93  
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  @94  struct bpf_htab {
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13   95  	struct bpf_map map;
fba1a1c6c912b3 Alexei Starovoitov    2022-09-02   96  	struct bpf_mem_alloc ma;
ee4ed53c5eb62f Alexei Starovoitov    2022-09-02   97  	struct bpf_mem_alloc pcpu_ma;
688ecfe6022051 tom.leiming@gmail.com 2015-12-29   98  	struct bucket *buckets;
6c90598174322b Alexei Starovoitov    2016-03-07   99  	void *elems;
29ba732acbeece Martin KaFai Lau      2016-11-11  100  	union {
6c90598174322b Alexei Starovoitov    2016-03-07  101  		struct pcpu_freelist freelist;
29ba732acbeece Martin KaFai Lau      2016-11-11  102  		struct bpf_lru lru;
29ba732acbeece Martin KaFai Lau      2016-11-11  103  	};
8c290e60fa2a51 Alexei Starovoitov    2017-03-21  104  	struct htab_elem *__percpu *extra_elems;
86fe28f7692d96 Alexei Starovoitov    2022-09-02  105  	/* number of elements in non-preallocated hashtable are kept
86fe28f7692d96 Alexei Starovoitov    2022-09-02  106  	 * in either pcount or count
86fe28f7692d96 Alexei Starovoitov    2022-09-02  107  	 */
86fe28f7692d96 Alexei Starovoitov    2022-09-02  108  	struct percpu_counter pcount;
86fe28f7692d96 Alexei Starovoitov    2022-09-02  109  	atomic_t count;
86fe28f7692d96 Alexei Starovoitov    2022-09-02  110  	bool use_percpu_counter;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  111  	u32 n_buckets;	/* number of hash buckets */
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  112  	u32 elem_size;	/* size of each element in bytes */
c0203475765f82 Daniel Borkmann       2018-08-22  113  	u32 hashrnd;
c50eb518e262fa Song Liu              2020-10-29  114  	struct lock_class_key lockdep_key;
20b6cc34ea74b6 Song Liu              2020-10-29  115  	int __percpu *map_locked[HASHTAB_MAP_LOCK_COUNT];
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  116  };
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  117  

:::::: The code at line 94 was first introduced by commit
:::::: 0f8e4bd8a1fc8c4185f1630061d0a1f2d197a475 bpf: add hashtable type of eBPF maps

:::::: TO: Alexei Starovoitov <ast@plumgrid.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
