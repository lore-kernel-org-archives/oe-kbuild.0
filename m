Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EAD7494
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 20:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679172597; x=1710708597;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Qazgm5xq43bAUj7GG9iKCBkqVMzWF6lyCY+dVqS6vuc=;
  b=SzQNc4+k6VMGzCNvoK7RWmgNQ4AxBeMC68PfOxKMR5Y3mwKf4Qpa7Iri
   vj47NpLVjiEzXRkZRnHfiCdfCaXhGNSpB8yvsA4QrAzTHHeCRyaz1Wzvb
   ZdXM/YEaSQO9mFqQpjQ50VDAFxTU71n+3wfekNuk9wZHr3P+Sp7M1+7QB
   8FvJk/nY/4KMjOP0+W1smKDHQ4ZLF3XUpZ3cyB+L+VHi2pbadJAhOrmT+
   TFgUTEevK/LeWhGNbeJSC8gL9GT1FkyDGjIDQIb1E/mkjXWsNnNegXLy2
   YA2ZR5r/gI6MG7tAqApy9Rk91wtiZWllfXBl/QxXOtf+xIJ5BSMexAsNe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="322307177"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="322307177"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 13:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="657923994"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="657923994"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2023 13:49:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pddUv-000AGj-2G;
	Sat, 18 Mar 2023 20:49:53 +0000
Date: Sun, 19 Mar 2023 04:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 690/4413] drivers/gpu/drm/drm_suballoc.c:106:2:
 warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Message-ID: <202303190406.HsD7QLYW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/drm_suballoc.c:106:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: "Christian König" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: c103a23f2f297c6ab2e5e74e39b655439f3524a6 [690/4413] drm/amd: Convert amdgpu to use suballocation helper.
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-c005-20230312 (https://download.01.org/0day-ci/archive/20230319/202303190406.HsD7QLYW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c103a23f2f297c6ab2e5e74e39b655439f3524a6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c103a23f2f297c6ab2e5e74e39b655439f3524a6
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303190406.HsD7QLYW-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/tracepoint.h:247:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/i2c.h:122:1: note: Dereference of null pointer
   TRACE_EVENT_FN(i2c_result,
   ^
   include/linux/tracepoint.h:556:2: note: expanded from macro 'TRACE_EVENT_FN'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:250:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:188:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/video/fbdev/sm712fb.c:997:4: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                           val |= chan_to_field(blue, &sfb->fb->var.blue);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sm712fb.c:997:4: note: Value stored to 'val' is never read
                           val |= chan_to_field(blue, &sfb->fb->var.blue);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/video/fbdev/aty/atyfb_base.c:167:10: warning: 1st function call argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   return aty_ld_le32(lt_lcd_regs[index], par);
                          ^
   drivers/video/fbdev/aty/atyfb_base.c:2221:32: note: Passing the value 20 via 1st parameter 'index'
           unsigned int reg = aty_ld_lcd(LCD_MISC_CNTL, par);
                                         ^
   include/video/mach64.h:1273:24: note: expanded from macro 'LCD_MISC_CNTL'
   #define LCD_MISC_CNTL           0x14
                                   ^~~~
   drivers/video/fbdev/aty/atyfb_base.c:2221:21: note: Calling 'aty_ld_lcd'
           unsigned int reg = aty_ld_lcd(LCD_MISC_CNTL, par);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/aty/atyfb_base.c:166:6: note: Assuming the condition is true
           if (M64_HAS(LT_LCD_REGS)) {
               ^
   drivers/video/fbdev/aty/atyfb.h:197:27: note: expanded from macro 'M64_HAS'
   #define M64_HAS(feature)        ((par)->features & (M64F_##feature))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/aty/atyfb_base.c:166:2: note: Taking true branch
           if (M64_HAS(LT_LCD_REGS)) {
           ^
   drivers/video/fbdev/aty/atyfb_base.c:167:10: note: 1st function call argument is an uninitialized value
                   return aty_ld_le32(lt_lcd_regs[index], par);
                          ^           ~~~~~~~~~~~~~~~~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (11 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   23 warnings generated.
   Suppressed 23 warnings (11 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/drm_suballoc.c:106:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(sa, tmp, &sa_manager->olist, olist) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_entry_safe'
                   n = list_next_entry(pos, member);                       \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:25: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                  ^~~~~
   drivers/gpu/drm/drm_suballoc.c:97:6: note: Assuming field 'size' is not equal to 0
           if (!sa_manager->size)
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:97:2: note: Taking false branch
           if (!sa_manager->size)
           ^
   drivers/gpu/drm/drm_suballoc.c:100:6: note: Assuming the condition is true
           if (!list_empty(&sa_manager->olist)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:100:2: note: Taking true branch
           if (!list_empty(&sa_manager->olist)) {
           ^
   drivers/gpu/drm/drm_suballoc.c:102:3: note: Calling 'drm_suballoc_try_free'
                   drm_suballoc_try_free(sa_manager);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:131:6: note: Assuming the condition is false
           if (sa_manager->hole->next == &sa_manager->olist)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:131:2: note: Taking false branch
           if (sa_manager->hole->next == &sa_manager->olist)
           ^
   drivers/gpu/drm/drm_suballoc.c:135:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry_safe_from(sa, tmp, &sa_manager->olist, olist) {
           ^
   include/linux/list.h:793:2: note: expanded from macro 'list_for_each_entry_safe_from'
           for (n = list_next_entry(pos, member);                                  \
           ^
   drivers/gpu/drm/drm_suballoc.c:136:7: note: Assuming field 'fence' is non-null
                   if (!sa->fence || !dma_fence_is_signaled(sa->fence))
                       ^~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:136:7: note: Left side of '||' is false
   drivers/gpu/drm/drm_suballoc.c:136:21: note: Assuming the condition is false
                   if (!sa->fence || !dma_fence_is_signaled(sa->fence))
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:136:3: note: Taking false branch
                   if (!sa->fence || !dma_fence_is_signaled(sa->fence))
                   ^
   drivers/gpu/drm/drm_suballoc.c:139:3: note: Calling 'drm_suballoc_remove_locked'
                   drm_suballoc_remove_locked(sa);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:118:6: note: Assuming the condition is true
           if (sa_manager->hole == &sa->olist)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:118:2: note: Taking true branch
           if (sa_manager->hole == &sa->olist)
           ^
   drivers/gpu/drm/drm_suballoc.c:124:2: note: Memory is released
           kfree(sa);
           ^~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:139:3: note: Returning; memory was released via 1st parameter
                   drm_suballoc_remove_locked(sa);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:135:2: note: Loop condition is false. Execution continues on line 135
           list_for_each_entry_safe_from(sa, tmp, &sa_manager->olist, olist) {
           ^
   include/linux/list.h:793:2: note: expanded from macro 'list_for_each_entry_safe_from'
           for (n = list_next_entry(pos, member);                                  \
           ^
   drivers/gpu/drm/drm_suballoc.c:102:3: note: Returning; memory was released
                   drm_suballoc_try_free(sa_manager);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:103:7: note: Assuming the condition is false
                   if (!list_empty(&sa_manager->olist))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_suballoc.c:103:3: note: Taking false branch
                   if (!list_empty(&sa_manager->olist))
                   ^
   drivers/gpu/drm/drm_suballoc.c:106:2: note: Use of memory after it is freed
           list_for_each_entry_safe(sa, tmp, &sa_manager->olist, olist) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_entry_safe'
                   n = list_next_entry(pos, member);                       \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:25: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                  ^~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).

vim +106 drivers/gpu/drm/drm_suballoc.c

849ee8a2f0df7a Maarten Lankhorst 2023-02-24   84  
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   85  /**
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   86   * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   87   * @sa_manager: pointer to the sa_manager
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   88   *
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   89   * Cleans up the suballocation manager after use. All fences added
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   90   * with drm_suballoc_free() must be signaled, or we cannot clean up
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   91   * the entire manager.
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   92   */
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   93  void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager)
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   94  {
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   95  	struct drm_suballoc *sa, *tmp;
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   96  
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   97  	if (!sa_manager->size)
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   98  		return;
849ee8a2f0df7a Maarten Lankhorst 2023-02-24   99  
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  100  	if (!list_empty(&sa_manager->olist)) {
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  101  		sa_manager->hole = &sa_manager->olist;
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  102  		drm_suballoc_try_free(sa_manager);
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  103  		if (!list_empty(&sa_manager->olist))
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  104  			DRM_ERROR("sa_manager is not empty, clearing anyway\n");
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  105  	}
849ee8a2f0df7a Maarten Lankhorst 2023-02-24 @106  	list_for_each_entry_safe(sa, tmp, &sa_manager->olist, olist) {
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  107  		drm_suballoc_remove_locked(sa);
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  108  	}
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  109  
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  110  	sa_manager->size = 0;
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  111  }
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  112  EXPORT_SYMBOL(drm_suballoc_manager_fini);
849ee8a2f0df7a Maarten Lankhorst 2023-02-24  113  

:::::: The code at line 106 was first introduced by commit
:::::: 849ee8a2f0df7a4ed4d281e19d3c9824b8e60bc2 drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Thomas Hellström <thomas.hellstrom@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
