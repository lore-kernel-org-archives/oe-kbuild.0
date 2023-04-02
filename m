Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E93D15A2
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Apr 2023 06:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680417594; x=1711953594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5203dhNvfX/0TSmUjxEE8Qe2nC7joEUIZu4tOAg5frg=;
  b=aK9x6oGTI0lJtHEsPXPB3Cw6kKcdO2x+5eBw+DmErsVAPOHOpUyT0uLp
   F5cO/u0hSvDHKKl4lelGM3Z9eXxU1NXhzW+h4iTSyXmq+J0fPAoBfRdh6
   FuyV8h9g5sX95iZXEzwqOGc84vXJ93DTDyQEXEJuETpt83f2XCeL9M0X7
   gTmeq5UPoc03ZJDMBPE/4HKsQDIOMShtK2ijj8GgJjdaEh73GeFnSiKiY
   1I5+UBhJLBz5a3RNqJrfA4KsNIOpK5jiFGi+Rc3+ZqFtBrbBXwfwDWHaQ
   qCPKybMBq4KG7PL8yhiQHzyC0FvQPN9grK25OI8/OXm/HaSS2OPPZabS8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="325705527"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="325705527"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 23:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="662839022"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="662839022"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Apr 2023 23:39:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pirNX-000NHH-0V;
	Sun, 02 Apr 2023 06:39:51 +0000
Date: Sun, 2 Apr 2023 14:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2106:2: warning:
 Value stored to 'next_id' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202304021408.YRO7FLrB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2106:2: warning: Value stored to 'next_id' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: John Harrison <John.C.Harrison@Intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: 2584b3549f4c4081918bfd4109148b1003b2626b drm/i915/guc: Update to GuC version 70.1.1
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001-20230327 (https://download.01.org/0day-ci/archive/20230402/202304021408.YRO7FLrB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2584b3549f4c4081918bfd4109148b1003b2626b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2584b3549f4c4081918bfd4109148b1003b2626b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304021408.YRO7FLrB-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1037:25: note: Assuming 'destroyed' is true
                   if (pending_enable || destroyed || deregister) {
                                         ^~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1037:35: note: Left side of '||' is true
                   if (pending_enable || destroyed || deregister) {
                                                   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1039:8: note: Assuming 'deregister' is false
                           if (deregister)
                               ^~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1039:4: note: Taking false branch
                           if (deregister)
                           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1041:8: note: 'destroyed' is true
                           if (destroyed) {
                               ^~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1041:4: note: Taking true branch
                           if (destroyed) {
                           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1044:5: note: Calling '__guc_context_destroy'
                                   __guc_context_destroy(ce);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2831:6: note: Assuming the condition is true
           if (intel_engine_is_virtual(ce->engine)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2831:2: note: Taking true branch
           if (intel_engine_is_virtual(ce->engine)) {
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2835:7: note: Assuming field 'breadcrumbs' is null
                   if (ve->base.breadcrumbs)
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2835:3: note: Taking false branch
                   if (ve->base.breadcrumbs)
                   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2838:3: note: Memory is released
                   kfree(ve);
                   ^~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1044:5: note: Returning; memory was released via 1st parameter
                                   __guc_context_destroy(ce);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1046:8: note: 'pending_enable' is false
                           if (pending_enable || deregister)
                               ^~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1046:8: note: Left side of '||' is false
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1046:26: note: 'deregister' is false
                           if (pending_enable || deregister)
                                                 ^~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1046:4: note: Taking false branch
                           if (pending_enable || deregister)
                           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1051:7: note: Assuming 'pending_disable' is false
                   if (pending_disable) {
                       ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1051:3: note: Taking false branch
                   if (pending_disable) {
                   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1067:7: note: Assuming 'do_put' is true
                   if (do_put)
                       ^~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1067:3: note: Taking true branch
                   if (do_put)
                   ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1068:4: note: Use of memory after it is freed
                           intel_context_put(ce);
                           ^                 ~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1197:15: warning: The left operand of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           shift = (reg & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
                        ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1802:6: note: Assuming field 'submission_initialized' is false
           if (guc->submission_initialized)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1802:2: note: Taking false branch
           if (guc->submission_initialized)
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1807:6: note: Assuming field 'guc_ids_bitmap' is non-null
           if (!guc->submission_state.guc_ids_bitmap)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1807:2: note: Taking false branch
           if (!guc->submission_state.guc_ids_bitmap)
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1811:25: note: Calling 'gpm_timestamp_shift'
           guc->timestamp.shift = gpm_timestamp_shift(gt);
                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1192:6: note: 'reg' declared without an initial value
           u32 reg, shift;
               ^~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1194:2: note: Loop condition is false. Execution continues on line 1197
           with_intel_runtime_pm(gt->uncore->rpm, wakeref)
           ^
   drivers/gpu/drm/i915/intel_runtime_pm.h:184:2: note: expanded from macro 'with_intel_runtime_pm'
           for ((wf) = intel_runtime_pm_get(rpm); (wf); \
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1197:15: note: The left operand of '&' is a garbage value
           shift = (reg & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
                    ~~~ ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1343:19: warning: Value stored to 'uc' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
                            ^~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1343:19: note: Value stored to 'uc' during its initialization is never read
           struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
                            ^~
>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2106:2: warning: Value stored to 'next_id' is never read [clang-analyzer-deadcode.DeadStores]
           next_id = info->context_idx + 1;
           ^         ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2106:2: note: Value stored to 'next_id' is never read
           next_id = info->context_idx + 1;
           ^         ~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2331:20: warning: Value stored to 'guc' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct intel_guc *guc = &engine->gt->uc.guc;
                             ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2331:20: note: Value stored to 'guc' during its initialization is never read
           struct intel_guc *guc = &engine->gt->uc.guc;
                             ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2343:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2343:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2377:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(wq_desc, 0, sizeof(*wq_desc));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2377:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(wq_desc, 0, sizeof(*wq_desc));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3531:33: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           parent->parallel.fence_context = dma_fence_context_alloc(1);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3502:24: note: 'parent' initialized to a null pointer value
           struct intel_context *parent = NULL, *ce, *err;
                                 ^~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3505:13: note: Calling 'kmalloc_array'
           siblings = kmalloc_array(num_siblings,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:617:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:619:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:621:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3505:13: note: Returning from 'kmalloc_array'
           siblings = kmalloc_array(num_siblings,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3508:6: note: Assuming 'siblings' is non-null
           if (!siblings)
               ^~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3508:2: note: Taking false branch
           if (!siblings)
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3511:14: note: Assuming 'i' is >= 'width'
           for (i = 0; i < width; ++i) {
                       ^~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3511:2: note: Loop condition is false. Execution continues on line 3531
           for (i = 0; i < width; ++i) {
           ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3531:33: note: Dereference of null pointer
           parent->parallel.fence_context = dma_fence_context_alloc(1);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3666:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(engine->status_page.addr, POISON_INUSE, PAGE_SIZE);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3666:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(engine->status_page.addr, POISON_INUSE, PAGE_SIZE);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3865:27: warning: Value stored to 'i915' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct drm_i915_private *i915 = engine->i915;
                                    ^~~~   ~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:3865:27: note: Value stored to 'i915' during its initialization is never read
           struct drm_i915_private *i915 = engine->i915;
                                    ^~~~   ~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4663:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cs, 0, sizeof(u32) *
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4663:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(cs, 0, sizeof(u32) *
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4739:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(cs, 0, sizeof(u32) *
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)

vim +/next_id +2106 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

3a4cdf1982f05d Matthew Brost 2021-07-21  2079  
c2aa552ff09daf Matthew Brost 2021-10-14  2080  static int __guc_action_register_multi_lrc(struct intel_guc *guc,
c2aa552ff09daf Matthew Brost 2021-10-14  2081  					   struct intel_context *ce,
2584b3549f4c40 John Harrison 2022-04-12  2082  					   struct guc_ctxt_registration_info *info,
c2aa552ff09daf Matthew Brost 2021-10-14  2083  					   bool loop)
c2aa552ff09daf Matthew Brost 2021-10-14  2084  {
c2aa552ff09daf Matthew Brost 2021-10-14  2085  	struct intel_context *child;
2584b3549f4c40 John Harrison 2022-04-12  2086  	u32 action[13 + (MAX_ENGINE_INSTANCE * 2)];
c2aa552ff09daf Matthew Brost 2021-10-14  2087  	int len = 0;
2584b3549f4c40 John Harrison 2022-04-12  2088  	u32 next_id;
c2aa552ff09daf Matthew Brost 2021-10-14  2089  
c2aa552ff09daf Matthew Brost 2021-10-14  2090  	GEM_BUG_ON(ce->parallel.number_children > MAX_ENGINE_INSTANCE);
c2aa552ff09daf Matthew Brost 2021-10-14  2091  
c2aa552ff09daf Matthew Brost 2021-10-14  2092  	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
2584b3549f4c40 John Harrison 2022-04-12  2093  	action[len++] = info->flags;
2584b3549f4c40 John Harrison 2022-04-12  2094  	action[len++] = info->context_idx;
2584b3549f4c40 John Harrison 2022-04-12  2095  	action[len++] = info->engine_class;
2584b3549f4c40 John Harrison 2022-04-12  2096  	action[len++] = info->engine_submit_mask;
2584b3549f4c40 John Harrison 2022-04-12  2097  	action[len++] = info->wq_desc_lo;
2584b3549f4c40 John Harrison 2022-04-12  2098  	action[len++] = info->wq_desc_hi;
2584b3549f4c40 John Harrison 2022-04-12  2099  	action[len++] = info->wq_base_lo;
2584b3549f4c40 John Harrison 2022-04-12  2100  	action[len++] = info->wq_base_hi;
2584b3549f4c40 John Harrison 2022-04-12  2101  	action[len++] = info->wq_size;
c2aa552ff09daf Matthew Brost 2021-10-14  2102  	action[len++] = ce->parallel.number_children + 1;
2584b3549f4c40 John Harrison 2022-04-12  2103  	action[len++] = info->hwlrca_lo;
2584b3549f4c40 John Harrison 2022-04-12  2104  	action[len++] = info->hwlrca_hi;
2584b3549f4c40 John Harrison 2022-04-12  2105  
2584b3549f4c40 John Harrison 2022-04-12 @2106  	next_id = info->context_idx + 1;
c2aa552ff09daf Matthew Brost 2021-10-14  2107  	for_each_child(ce, child) {
2584b3549f4c40 John Harrison 2022-04-12  2108  		GEM_BUG_ON(next_id++ != child->guc_id.id);
2584b3549f4c40 John Harrison 2022-04-12  2109  
2584b3549f4c40 John Harrison 2022-04-12  2110  		/*
2584b3549f4c40 John Harrison 2022-04-12  2111  		 * NB: GuC interface supports 64 bit LRCA even though i915/HW
2584b3549f4c40 John Harrison 2022-04-12  2112  		 * only supports 32 bit currently.
2584b3549f4c40 John Harrison 2022-04-12  2113  		 */
2584b3549f4c40 John Harrison 2022-04-12  2114  		action[len++] = lower_32_bits(child->lrc.lrca);
2584b3549f4c40 John Harrison 2022-04-12  2115  		action[len++] = upper_32_bits(child->lrc.lrca);
c2aa552ff09daf Matthew Brost 2021-10-14  2116  	}
c2aa552ff09daf Matthew Brost 2021-10-14  2117  
2584b3549f4c40 John Harrison 2022-04-12  2118  	GEM_BUG_ON(len > ARRAY_SIZE(action));
2584b3549f4c40 John Harrison 2022-04-12  2119  
c2aa552ff09daf Matthew Brost 2021-10-14  2120  	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
c2aa552ff09daf Matthew Brost 2021-10-14  2121  }
c2aa552ff09daf Matthew Brost 2021-10-14  2122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
