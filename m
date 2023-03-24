Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EFF525F
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679659096; x=1711195096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ag7wst2/2qf2caXbibuxz23hznK1AT3yi3UcAf7PDF4=;
  b=Kdr4TXFhARpVMn8ElVBYZVKnC8KQuh+Q/TSJpzozP33s4IewC5rX2tVI
   WGooPUTFsVk0nLFeLrI/FB5xqr4CC3VXKkG0cxazt9G0eFEchfxOrgPuj
   BdN2IUaLYdr6JDZbgfl24dt5XUj9WE5kt65McZ+HpvuL5+sFgsgZuJNmf
   UOr9Z2r90q/wrsRzBE3vk5liJtIG47cSSWdvokAN27X44Ku/IWl6M97ZD
   gdL1cD0r+HsoF3l+EDMKyepN6J2HZV61fOQM+1QAny57k/p6KWEn45C0i
   lNua+ZjtpAZ4FhjDpJG0cSyvV+4PIeQYM+47/dl0v7xSqqI8fkvyzCfU9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402347233"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="402347233"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 04:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="826239963"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="826239963"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 04:58:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfg3h-000FGw-2C;
	Fri, 24 Mar 2023 11:58:13 +0000
Date: Fri, 24 Mar 2023 19:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [saeed:testing/vdpa-posted-interrupt 1/15] lib/cpu_rmap.c:272:2:
 warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Message-ID: <202303241946.7yCLC1gs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/cpu_rmap.c:272:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Eli Cohen <elic@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git testing/vdpa-posted-interrupt
head:   fa4692657f1fab7ab4169159d3f37ba4d016c02c
commit: 4a6ecee2a92e19585b970b8bf5699ef33ea5d716 [1/15] lib: cpu_rmap: Avoid use after free on rmap->obj array entries
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-c005-20230322 (https://download.01.org/0day-ci/archive/20230324/202303241946.7yCLC1gs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/commit/?id=4a6ecee2a92e19585b970b8bf5699ef33ea5d716
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git
        git fetch --no-tags saeed testing/vdpa-posted-interrupt
        git checkout 4a6ecee2a92e19585b970b8bf5699ef33ea5d716
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303241946.7yCLC1gs-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/lockdep.h:313:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/iommu/iommu.c:389:2: note: Taking false branch
           lockdep_assert_held(&dev->iommu_group->mutex);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   drivers/iommu/iommu.c:389:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(&dev->iommu_group->mutex);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/iommu/iommu.c:391:2: note: Taking false branch
           if (iommu_is_attach_deferred(dev)) {
           ^
   drivers/iommu/iommu.c:396:9: note: Calling '__iommu_attach_device'
           return __iommu_attach_device(domain, dev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu.c:2017:15: note: Assuming field 'attach_dev' is not equal to null
           if (unlikely(domain->ops->attach_dev == NULL))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/iommu/iommu.c:2017:2: note: Taking false branch
           if (unlikely(domain->ops->attach_dev == NULL))
           ^
   drivers/iommu/iommu.c:2021:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iommu/iommu.c:2021:2: note: Taking false branch
           if (ret)
           ^
   drivers/iommu/iommu.c:2024:2: note: Calling 'trace_attach_device_to_domain'
           trace_attach_device_to_domain(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/iommu.h:72:1: note: Assuming the condition is true
   DEFINE_EVENT(iommu_device_event, attach_device_to_domain,
   ^
   include/linux/tracepoint.h:550:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:427:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:257:7: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/iommu.h:72:1: note: Taking true branch
   DEFINE_EVENT(iommu_device_event, attach_device_to_domain,
   ^
   include/linux/tracepoint.h:550:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:427:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:257:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/iommu.h:72:1: note: Dereference of null pointer
   DEFINE_EVENT(iommu_device_event, attach_device_to_domain,
   ^
   include/linux/tracepoint.h:550:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:428:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:260:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:199:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
>> lib/cpu_rmap.c:272:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           glue->rmap->obj[glue->index] = NULL;
           ^~~~~~~~~~~~~~~
   lib/cpu_rmap.c:271:2: note: Calling 'cpu_rmap_put'
           cpu_rmap_put(glue->rmap);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/cpu_rmap.c:87:9: note: Calling 'kref_put'
           return kref_put(&rmap->refcount, cpu_rmap_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'cpu_rmap_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   lib/cpu_rmap.c:69:2: note: Memory is released
           kfree(rmap);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   lib/cpu_rmap.c:87:9: note: Returning; memory was released
           return kref_put(&rmap->refcount, cpu_rmap_release);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/cpu_rmap.c:271:2: note: Returning; memory was released via 1st parameter
           cpu_rmap_put(glue->rmap);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/cpu_rmap.c:272:2: note: Use of memory after it is freed
           glue->rmap->obj[glue->index] = NULL;
           ^~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   14 warnings generated.
   kernel/trace/synth_event_gen_test.c:117:12: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           vals[4] = raw_smp_processor_id(); /* cpu */
                     ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   kernel/trace/synth_event_gen_test.c:442:8: note: Calling 'test_gen_synth_cmd'
           ret = test_gen_synth_cmd();
                 ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/synth_event_gen_test.c:53:8: note: Calling 'kzalloc'
           buf = kzalloc(MAX_DYNEVENT_CMD_LEN, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:573:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) && size) {
                                          ^
   include/linux/slab.h:584:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:2: note: Returning pointer, which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/synth_event_gen_test.c:53:8: note: Returning from 'kzalloc'
           buf = kzalloc(MAX_DYNEVENT_CMD_LEN, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/synth_event_gen_test.c:54:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   kernel/trace/synth_event_gen_test.c:54:2: note: Taking false branch
           if (!buf)
           ^
   kernel/trace/synth_event_gen_test.c:69:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   kernel/trace/synth_event_gen_test.c:69:2: note: Taking false branch
           if (ret)
           ^
   kernel/trace/synth_event_gen_test.c:75:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   kernel/trace/synth_event_gen_test.c:75:2: note: Taking false branch
           if (ret)
           ^
   kernel/trace/synth_event_gen_test.c:79:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   kernel/trace/synth_event_gen_test.c:79:2: note: Taking false branch
           if (ret)
           ^
   kernel/trace/synth_event_gen_test.c:83:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   kernel/trace/synth_event_gen_test.c:83:2: note: Taking false branch
           if (ret)

vim +272 lib/cpu_rmap.c

c39649c331c709 Ben Hutchings   2011-01-19  261  
896f97ea95c1d2 David Decotigny 2013-01-11  262  /**
896f97ea95c1d2 David Decotigny 2013-01-11  263   * irq_cpu_rmap_release - reclaiming callback for IRQ subsystem
896f97ea95c1d2 David Decotigny 2013-01-11  264   * @ref: kref to struct irq_affinity_notify passed by irq/manage.c
896f97ea95c1d2 David Decotigny 2013-01-11  265   */
c39649c331c709 Ben Hutchings   2011-01-19  266  static void irq_cpu_rmap_release(struct kref *ref)
c39649c331c709 Ben Hutchings   2011-01-19  267  {
c39649c331c709 Ben Hutchings   2011-01-19  268  	struct irq_glue *glue =
c39649c331c709 Ben Hutchings   2011-01-19  269  		container_of(ref, struct irq_glue, notify.kref);
896f97ea95c1d2 David Decotigny 2013-01-11  270  
896f97ea95c1d2 David Decotigny 2013-01-11  271  	cpu_rmap_put(glue->rmap);
4a6ecee2a92e19 Eli Cohen       2023-02-08 @272  	glue->rmap->obj[glue->index] = NULL;
c39649c331c709 Ben Hutchings   2011-01-19  273  	kfree(glue);
c39649c331c709 Ben Hutchings   2011-01-19  274  }
c39649c331c709 Ben Hutchings   2011-01-19  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
