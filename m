Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5317C3
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674960006; x=1706496006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lkmUNvBW+flXuvq3goEEVDEaLi7Yed4mwrZdMHRozVQ=;
  b=R+qvI/J/SdZI7SGXr6uNOE3c2wkM3dJxY5p73++/sZ2EvHW9Gz5zqyFc
   w9p/WiiFcZOsIbHiUz35cQ0cGJj1lK9a2CX3LRZuQTtAnPNAy7Cu9O2m6
   Wt1BWhXa+4bwosGRd43AilptgqbUJdcK3QV1JV3FD4sFUcYfSzJxPpoMk
   ojJsgr2sVMix5agdhuAw+dAxB6l46t3Ox2vPFyk6DSWX6DRuXPzt+7Fgo
   VFA7pUQq7kvWN6s8RHV2bOJME2LTV37xTmByF80H7JK+5y8RQsKoBD761
   QPeWmDgR35GvPEO8ulR41d8h1mD+4e9AZH8yLl0E6LGO6MBBpWn/jIR0K
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="315312331"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="315312331"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 18:40:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="695983867"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="695983867"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jan 2023 18:40:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLxbv-0001Mu-14;
	Sun, 29 Jan 2023 02:40:03 +0000
Date: Sun, 29 Jan 2023 10:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/hashtab.c:86:8: warning: Excessive padding in 'struct
 bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map,
 pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd,
 lockdep_key, map_locked, ma, pcpu_ma, ...
Message-ID: <202301291052.VcdsjYU8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/bpf/hashtab.c:86:8: warning: Excessive padding in 'struct bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map, pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd, lockdep_key, map_locked, ma, pcpu_ma, , use_percpu_counter, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rongwei Zhang <pudh4418@gmail.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Rongwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c96618275234ad03d44eafe9f8844305bb44fda4
commit: 612d80784fdc0c2e2ee2e2d901a55ef2f72ebf4b MIPS: fix duplicate definitions for exported symbols
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-c004-20230123 (https://download.01.org/0day-ci/archive/20230129/202301291052.VcdsjYU8-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=612d80784fdc0c2e2ee2e2d901a55ef2f72ebf4b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 612d80784fdc0c2e2ee2e2d901a55ef2f72ebf4b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
   arch/mips/include/asm/bitops.h:390:27: note: 1 is < 6
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
   include/linux/bitops.h:206:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:206:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
>> kernel/bpf/hashtab.c:86:8: warning: Excessive padding in 'struct bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map, pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd, lockdep_key, map_locked, ma, pcpu_ma, , use_percpu_counter, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct bpf_htab {
   ~~~~~~~^~~~~~~~~~
   kernel/bpf/hashtab.c:86:8: note: Excessive padding in 'struct bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map, pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd, lockdep_key, map_locked, ma, pcpu_ma, , use_percpu_counter, consider reordering the fields or adding explicit padding members
   struct bpf_htab {
   ~~~~~~~^~~~~~~~~~
   kernel/bpf/hashtab.c:1983:3: warning: Value stored to 'b' is never read [clang-analyzer-deadcode.DeadStores]
                   b = &htab->buckets[bucket_id++];
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/hashtab.c:1983:3: note: Value stored to 'b' is never read
                   b = &htab->buckets[bucket_id++];
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/char/tpm/tpm1-cmd.c:440:29: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   chip->duration[TPM_SHORT] = durations[0];
                                             ^ ~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:349:7: note: Calling 'tpm1_getcap'
           rc = tpm1_getcap(chip, TPM_CAP_PROP_TIS_TIMEOUT, &cap, NULL,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:488:7: note: Calling 'tpm_buf_init'
           rc = tpm_buf_init(&buf, TPM_TAG_RQU_COMMAND, TPM_ORD_GET_CAP);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tpm.h:337:6: note: Assuming field 'data' is non-null
           if (!buf->data)
               ^~~~~~~~~~
   include/linux/tpm.h:337:2: note: Taking false branch
           if (!buf->data)
           ^
   include/linux/tpm.h:342:2: note: Returning zero, which participates in a condition later
           return 0;
           ^~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:488:7: note: Returning from 'tpm_buf_init'
           rc = tpm_buf_init(&buf, TPM_TAG_RQU_COMMAND, TPM_ORD_GET_CAP);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:489:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/char/tpm/tpm1-cmd.c:489:2: note: Taking false branch
           if (rc)
           ^
   drivers/char/tpm/tpm1-cmd.c:492:6: note: 'subcap_id' is not equal to TPM_CAP_VERSION_1_1
           if (subcap_id == TPM_CAP_VERSION_1_1 ||
               ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:492:6: note: Left side of '||' is false
   drivers/char/tpm/tpm1-cmd.c:493:6: note: 'subcap_id' is not equal to TPM_CAP_VERSION_1_2
               subcap_id == TPM_CAP_VERSION_1_2) {
               ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:492:2: note: Taking false branch
           if (subcap_id == TPM_CAP_VERSION_1_1 ||
           ^
   drivers/char/tpm/tpm1-cmd.c:497:7: note: 'subcap_id' is not equal to TPM_CAP_FLAG_PERM
                   if (subcap_id == TPM_CAP_FLAG_PERM ||
                       ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:497:7: note: Left side of '||' is false
   drivers/char/tpm/tpm1-cmd.c:498:7: note: 'subcap_id' is not equal to TPM_CAP_FLAG_VOL
                       subcap_id == TPM_CAP_FLAG_VOL)
                       ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:497:3: note: Taking false branch
                   if (subcap_id == TPM_CAP_FLAG_PERM ||
                   ^
--
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:39:2: note: expanded from macro 'dprintk'
           if (dvb_ca_en50221_debug)                                       \
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1453:2: note: Loop condition is false.  Exiting loop
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:38:30: note: expanded from macro 'dprintk'
   #define dprintk(fmt, arg...) do {                                       \
                                ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1459:6: note: Assuming 'count' is >= 2
           if (count < 2)
               ^~~~~~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:1459:2: note: Taking false branch
           if (count < 2)
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1463:6: note: Calling 'copy_from_user'
           if (copy_from_user(&slot, buf, 1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:6: note: Assuming the condition is true
           if (check_copy_size(to, n, false))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:2: note: Taking true branch
           if (check_copy_size(to, n, false))
           ^
   include/linux/uaccess.h:161:7: note: Calling '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:125:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing to '*to'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:132:2: note: Returning without writing to '*to'
           return res;
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:162:2: note: Returning without writing to '*to'
           return n;
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1463:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&slot, buf, 1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_ca_en50221.c:1463:2: note: Taking false branch
           if (copy_from_user(&slot, buf, 1))
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1465:2: note: Taking false branch
           if (copy_from_user(&connection_id, buf + 1, 1))
           ^
   drivers/media/dvb-core/dvb_ca_en50221.c:1470:11: note: The left operand of '>=' is a garbage value
           if (slot >= ca->slot_count)
               ~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/rpmsg/rpmsg_ctrl.c:89:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           chinfo.src = eptinfo.src;
                      ^ ~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:84:6: note: Calling 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:2: note: Taking true branch
           if (check_copy_size(to, n, false))
           ^
   include/linux/uaccess.h:161:7: note: Calling '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:125:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing to 'to->src'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:132:2: note: Returning without writing to 'to->src'
           return res;
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:162:2: note: Returning without writing to 'to->src'
           return n;
           ^
   drivers/rpmsg/rpmsg_ctrl.c:84:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:84:2: note: Taking false branch
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
           ^
   drivers/rpmsg/rpmsg_ctrl.c:87:2: note: '__ret_cond' is false
           memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
           ^
   include/linux/fortify-string.h:514:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:462:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:19:16: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                ^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/rpmsg/rpmsg_ctrl.c:87:2: note: Left side of '&&' is false
           memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
           ^
   include/linux/fortify-string.h:514:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:462:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:27: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                           ^
   drivers/rpmsg/rpmsg_ctrl.c:87:2: note: Taking false branch
           memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
           ^
   include/linux/fortify-string.h:514:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:462:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
--
   arch/mips/include/asm/cpu-features.h:384:25: note: expanded from macro 'cpu_has_clo_clz'
   #define cpu_has_clo_clz cpu_has_mips_r
                           ^
   arch/mips/include/asm/cpu-features.h:336:5: note: expanded from macro 'cpu_has_mips_r'
                            cpu_has_mips64r5 | cpu_has_mips64r6)
                            ^
   arch/mips/include/asm/cpu-features.h:299:43: note: expanded from macro 'cpu_has_mips64r5'
   # define cpu_has_mips64r5       (cpu_has_64bits && \
                                                   ^
   arch/mips/include/asm/bitops.h:390:27: note: 1 is < 6
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
   include/linux/bitops.h:206:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:206:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
>> kernel/bpf/hashtab.c:86:8: warning: Excessive padding in 'struct bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map, pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd, lockdep_key, map_locked, ma, pcpu_ma, , use_percpu_counter, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct bpf_htab {
   ~~~~~~~^~~~~~~~~~
   kernel/bpf/hashtab.c:86:8: note: Excessive padding in 'struct bpf_htab' (35 padding bytes, where 3 is optimal). Optimal fields order: map, pcount, buckets, elems, extra_elems, count, n_buckets, elem_size, hashrnd, lockdep_key, map_locked, ma, pcpu_ma, , use_percpu_counter, consider reordering the fields or adding explicit padding members
   struct bpf_htab {
   ~~~~~~~^~~~~~~~~~
   kernel/bpf/hashtab.c:1983:3: warning: Value stored to 'b' is never read [clang-analyzer-deadcode.DeadStores]
                   b = &htab->buckets[bucket_id++];
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/hashtab.c:1983:3: note: Value stored to 'b' is never read
                   b = &htab->buckets[bucket_id++];
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   mm/readahead.c:717:6: note: Assuming field 'ra_pages' is not equal to 0
           if (!ractl->ra->ra_pages)
               ^~~~~~~~~~~~~~~~~~~~
   mm/readahead.c:717:2: note: Taking false branch
           if (!ractl->ra->ra_pages)
           ^
   mm/readahead.c:723:6: note: Assuming the condition is false
           if (folio_test_writeback(folio))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/readahead.c:723:2: note: Taking false branch
           if (folio_test_writeback(folio))
           ^
   mm/readahead.c:728:2: note: Taking false branch
           if (blk_cgroup_congested())
           ^
   mm/readahead.c:731:2: note: Calling 'ondemand_readahead'
           ondemand_readahead(ractl, folio, req_count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/readahead.c:575:23: note: 'folio' is non-null
           unsigned int order = folio ? folio_order(folio) : 0;
                                ^~~~~
   mm/readahead.c:575:23: note: '?' condition is true
   mm/readahead.c:581:6: note: Assuming 'req_size' is <= 'max_pages'
           if (req_size > max_pages && bdi->io_pages > max_pages)
               ^~~~~~~~~~~~~~~~~~~~
   mm/readahead.c:581:27: note: Left side of '&&' is false
           if (req_size > max_pages && bdi->io_pages > max_pages)
                                    ^
   mm/readahead.c:587:6: note: Assuming 'index' is 0
           if (!index)
               ^~~~~~
   mm/readahead.c:587:2: note: Taking true branch
           if (!index)
           ^
   mm/readahead.c:588:3: note: Control jumps to line 659
                   goto initial_readahead;
                   ^
   mm/readahead.c:660:13: note: Calling 'get_init_ra_size'
           ra->size = get_init_ra_size(req_size, max_pages);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/readahead.c:346:26: note: '?' condition is false
           unsigned long newsize = roundup_pow_of_two(size);
                                   ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_two'
           __builtin_constant_p(n) ? (             \
           ^
   mm/readahead.c:346:26: note: Calling '__roundup_pow_of_two'
           unsigned long newsize = roundup_pow_of_two(size);
                                   ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_two'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:205:2: note: Taking true branch
           if (sizeof(l) == 4)
           ^
   include/linux/bitops.h:206:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   arch/mips/include/asm/bitops.h:389:6: note: Left side of '&&' is true
           if (!__builtin_constant_p(x) &&
               ^
   arch/mips/include/asm/bitops.h:390:27: note: 1 is < 5
               __builtin_constant_p(cpu_has_clo_clz) && cpu_has_clo_clz) {
                                    ^
   arch/mips/include/asm/cpu-features.h:384:25: note: expanded from macro 'cpu_has_clo_clz'
   #define cpu_has_clo_clz cpu_has_mips_r
                           ^~~~~~~~~~~~~~
   arch/mips/include/asm/cpu-features.h:334:5: note: expanded from macro 'cpu_has_mips_r'
                            cpu_has_mips32r5 | cpu_has_mips32r6 | \
                            ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/cpu-features.h:285:27: note: expanded from macro 'cpu_has_mips32r5'
   # define cpu_has_mips32r5       __isa_range_or_flag(5, 6, MIPS_CPU_ISA_M32R5)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/mips/include/asm/cpu-features.h:64:4: note: expanded from macro '__isa_range'
           ((MIPS_ISA_REV >= (ge)) && (MIPS_ISA_REV < (lt)))
             ^~~~~~~~~~~~
--
           ^
   drivers/hid/hidraw.c:213:8: note: Calling 'kmalloc'
           buf = kmalloc(count, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:564:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:581:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hidraw.c:213:8: note: Returning from 'kmalloc'
           buf = kmalloc(count, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hidraw.c:214:6: note: Assuming 'buf' is non-null
           if (!buf) {
               ^~~~
   drivers/hid/hidraw.c:214:2: note: Taking false branch
           if (!buf) {
           ^
   drivers/hid/hidraw.c:223:6: note: Calling 'copy_from_user'
           if (copy_from_user(&report_number, buffer, 1)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:2: note: Taking true branch
           if (check_copy_size(to, n, false))
           ^
   include/linux/uaccess.h:161:7: note: Calling '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:125:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing to '*to'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:132:2: note: Returning without writing to '*to'
           return res;
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:162:2: note: Returning without writing to '*to'
           return n;
           ^
   drivers/hid/hidraw.c:223:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&report_number, buffer, 1)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hidraw.c:223:2: note: Taking false branch
           if (copy_from_user(&report_number, buffer, 1)) {
           ^
   drivers/hid/hidraw.c:228:8: note: 2nd function call argument is an uninitialized value
           ret = hid_hw_raw_request(dev, report_number, buf, count, report_type,
                 ^                       ~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/rpmsg/rpmsg_ctrl.c:89:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           chinfo.src = eptinfo.src;
                      ^ ~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:84:6: note: Calling 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:160:2: note: Taking true branch
           if (check_copy_size(to, n, false))
           ^
   include/linux/uaccess.h:161:7: note: Calling '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:125:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:125:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:127:9: note: Calling 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:412:2: note: Returning without writing to 'to->src'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:127:9: note: Returning from 'raw_copy_from_user'
                   res = raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:130:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:130:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:132:2: note: Returning without writing to 'to->src'
           return res;
           ^
   include/linux/uaccess.h:161:7: note: Returning from '_copy_from_user'
                   n = _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:162:2: note: Returning without writing to 'to->src'
           return n;
           ^
   drivers/rpmsg/rpmsg_ctrl.c:84:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rpmsg/rpmsg_ctrl.c:84:2: note: Taking false branch
           if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
           ^
   drivers/rpmsg/rpmsg_ctrl.c:87:2: note: '__ret_cond' is false
           memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
           ^
   include/linux/fortify-string.h:514:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:462:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:19:16: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                ^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/rpmsg/rpmsg_ctrl.c:87:2: note: Left side of '&&' is false
           memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
           ^
   include/linux/fortify-string.h:514:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:462:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:30:7: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                       ^
   include/linux/once_lite.h:19:27: note: expanded from macro '__ONCE_LITE_IF'
                   if (unlikely(__ret_cond && !__already_done)) {          \
                                           ^
   drivers/rpmsg/rpmsg_ctrl.c:87:2: note: Taking false branch
           memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
           ^
   include/linux/fortify-string.h:514:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:462:2: note: expanded from macro '__fortify_memcpy_chk'
           WARN_ONCE(fortify_memcpy_chk(__fortify_size, __p_size,          \
           ^
   include/asm-generic/bug.h:151:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)

vim +86 kernel/bpf/hashtab.c

20b6cc34ea74b6 Song Liu              2020-10-29   85  
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  @86  struct bpf_htab {
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13   87  	struct bpf_map map;
fba1a1c6c912b3 Alexei Starovoitov    2022-09-02   88  	struct bpf_mem_alloc ma;
ee4ed53c5eb62f Alexei Starovoitov    2022-09-02   89  	struct bpf_mem_alloc pcpu_ma;
688ecfe6022051 tom.leiming@gmail.com 2015-12-29   90  	struct bucket *buckets;
6c90598174322b Alexei Starovoitov    2016-03-07   91  	void *elems;
29ba732acbeece Martin KaFai Lau      2016-11-11   92  	union {
6c90598174322b Alexei Starovoitov    2016-03-07   93  		struct pcpu_freelist freelist;
29ba732acbeece Martin KaFai Lau      2016-11-11   94  		struct bpf_lru lru;
29ba732acbeece Martin KaFai Lau      2016-11-11   95  	};
8c290e60fa2a51 Alexei Starovoitov    2017-03-21   96  	struct htab_elem *__percpu *extra_elems;
86fe28f7692d96 Alexei Starovoitov    2022-09-02   97  	/* number of elements in non-preallocated hashtable are kept
86fe28f7692d96 Alexei Starovoitov    2022-09-02   98  	 * in either pcount or count
86fe28f7692d96 Alexei Starovoitov    2022-09-02   99  	 */
86fe28f7692d96 Alexei Starovoitov    2022-09-02  100  	struct percpu_counter pcount;
86fe28f7692d96 Alexei Starovoitov    2022-09-02  101  	atomic_t count;
86fe28f7692d96 Alexei Starovoitov    2022-09-02  102  	bool use_percpu_counter;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  103  	u32 n_buckets;	/* number of hash buckets */
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  104  	u32 elem_size;	/* size of each element in bytes */
c0203475765f82 Daniel Borkmann       2018-08-22  105  	u32 hashrnd;
c50eb518e262fa Song Liu              2020-10-29  106  	struct lock_class_key lockdep_key;
20b6cc34ea74b6 Song Liu              2020-10-29  107  	int __percpu *map_locked[HASHTAB_MAP_LOCK_COUNT];
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  108  };
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  109  

:::::: The code at line 86 was first introduced by commit
:::::: 0f8e4bd8a1fc8c4185f1630061d0a1f2d197a475 bpf: add hashtable type of eBPF maps

:::::: TO: Alexei Starovoitov <ast@plumgrid.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
