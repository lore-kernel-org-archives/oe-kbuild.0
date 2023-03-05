Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A866F7E
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678004901; x=1709540901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lNsJM0qK9te1HalUnNxnTQhzuUm2lW5IsHNn2vJiEk0=;
  b=iKjEg8wPtKrJxyQLRCUp722oAilPfDljvV7yUE9aEGqxyp2XJ3AAeHw2
   4ah6fZwerM7NrGwuFKlGmNzjE9s/NZv1GNZAKCt6vvDteBp5DGyy+zZmS
   2TwQAssVeXbqItc+FCSIKUIdwNPLl18+hHyIZh1Lb27a/AjSW9E5JYMxy
   UQfkcZP70a6fRGJf1pRa4pVQOCYFrOJPEPvB7d4EvPNLKgYdRilS1IGwr
   4Lcsr1r9UliOMkoOHtrTgCd8GApI7BInL/BtASlRSpARtN9e5K8TZQZtv
   x3fmaEQrrnz3PcUE1Wthy0dyTheTIcDJBeSfyC/H7EcX8JvntCbVYJYfX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="336874555"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="336874555"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 00:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="675823038"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="675823038"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Mar 2023 00:28:20 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYjj9-0002ck-19;
	Sun, 05 Mar 2023 08:28:19 +0000
Date: Sun, 5 Mar 2023 16:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] remoteproc: qcom: Add remoteproc tracing
Message-ID: <202303051608.4ZM5bvyb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/trace/events/rproc_qcom.h:17:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230303035453.19034-1-quic_gokukris@quicinc.com>
References: <20230303035453.19034-1-quic_gokukris@quicinc.com>
TO: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@somainline.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-remoteproc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Trilok Soni <quic_tsoni@quicinc.com>
CC: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
CC: Rajendra Nayak <quic_rjendra@quicinc.com>
CC: Elliot Berman <quic_eberman@quicinc.com>
CC: Guru Das Srinagesh <quic_gurus@quicinc.com>
CC: Sibi Sankar <quic_sibis@quicinc.com>
CC: linux-trace-kernel@vger.kernel.org
CC: Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>

Hi Gokul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on linus/master v6.2 next-20230303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gokul-krishna-Krishnakumar/remoteproc-qcom-Add-remoteproc-tracing/20230303-115704
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20230303035453.19034-1-quic_gokukris%40quicinc.com
patch subject: [PATCH v2 1/1] remoteproc: qcom: Add remoteproc tracing
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-c005-20230302 (https://download.01.org/0day-ci/archive/20230305/202303051608.4ZM5bvyb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/89ccf0f9143e4482677179b637b6f507f4208838
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gokul-krishna-Krishnakumar/remoteproc-qcom-Add-remoteproc-tracing/20230303-115704
        git checkout 89ccf0f9143e4482677179b637b6f507f4208838
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303051608.4ZM5bvyb-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:338:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/s390/char/sclp_early_core.c:38:2: note: Loop condition is false.  Exiting loop
           __ctl_load(cr0_new.val, 0, 0);
           ^
   arch/s390/include/asm/ctl_reg.h:41:2: note: expanded from macro '__ctl_load'
           BUILD_BUG_ON(sizeof(addrtype) != (high - low + 1) * sizeof(long));\
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:358:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:330:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   drivers/s390/char/sclp_early_core.c:38:2: note: Loop condition is false.  Exiting loop
           __ctl_load(cr0_new.val, 0, 0);
           ^
   arch/s390/include/asm/ctl_reg.h:38:38: note: expanded from macro '__ctl_load'
   #define __ctl_load(array, low, high) do {                               \
                                        ^
   drivers/s390/char/sclp_early_core.c:40:17: note: Dereference of null pointer
           psw_ext_save = S390_lowcore.external_new_psw;
                          ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/dma-buf/dma-buf.c:1445:14: warning: Access to field 'resv' results in a dereference of a null pointer (loaded from variable 'dmabuf') [clang-analyzer-core.NullDereference]
           might_lock(&dmabuf->resv->lock.base);
                       ^
   drivers/dma-buf/dma-buf.c:452:2: note: Value assigned to 'dmabuf'
           dmabuf = file->private_data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:454:2: note: Control jumps to 'case 1074291200:'  at line 455
           switch (cmd) {
           ^
   drivers/dma-buf/dma-buf.c:456:3: note: Taking false branch
                   if (copy_from_user(&sync, (void __user *) arg, sizeof(sync)))
                   ^
   drivers/dma-buf/dma-buf.c:459:7: note: Assuming the condition is false
                   if (sync.flags & ~DMA_BUF_SYNC_VALID_FLAGS_MASK)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:459:3: note: Taking false branch
                   if (sync.flags & ~DMA_BUF_SYNC_VALID_FLAGS_MASK)
                   ^
   drivers/dma-buf/dma-buf.c:462:3: note: Control jumps to 'case 3:'  at line 469
                   switch (sync.flags & DMA_BUF_SYNC_RW) {
                   ^
   drivers/dma-buf/dma-buf.c:471:4: note:  Execution continues on line 476
                           break;
                           ^
   drivers/dma-buf/dma-buf.c:476:7: note: Assuming the condition is true
                   if (sync.flags & DMA_BUF_SYNC_END)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:476:3: note: Taking true branch
                   if (sync.flags & DMA_BUF_SYNC_END)
                   ^
   drivers/dma-buf/dma-buf.c:477:33: note: Passing value via 1st parameter 'dmabuf'
                           ret = dma_buf_end_cpu_access(dmabuf, direction);
                                                        ^~~~~~
   drivers/dma-buf/dma-buf.c:477:10: note: Calling 'dma_buf_end_cpu_access'
                           ret = dma_buf_end_cpu_access(dmabuf, direction);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf.c:1443:10: note: Assuming 'dmabuf' is null
           WARN_ON(!dmabuf);
                   ^
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/dma-buf/dma-buf.c:1445:14: note: Access to field 'resv' results in a dereference of a null pointer (loaded from variable 'dmabuf')
           might_lock(&dmabuf->resv->lock.base);
                       ^
   include/linux/lockdep.h:563:17: note: expanded from macro 'might_lock'
           lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_IP_);    \
                          ^~~~
   Suppressed 17 warnings (5 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   24 warnings generated.
>> include/trace/events/rproc_qcom.h:17:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   TRACE_EVENT(rproc_load_event,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   drivers/remoteproc/remoteproc_core.c:1918:6: note: Assuming 'rproc' is non-null
           if (!rproc) {
               ^~~~~~
   drivers/remoteproc/remoteproc_core.c:1918:2: note: Taking false branch
           if (!rproc) {
           ^
   drivers/remoteproc/remoteproc_core.c:1926:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/remoteproc/remoteproc_core.c:1926:2: note: Taking false branch
           if (ret) {
           ^
   drivers/remoteproc/remoteproc_core.c:1931:6: note: Assuming field 'state' is not equal to RPROC_DELETED
           if (rproc->state == RPROC_DELETED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1931:2: note: Taking false branch
           if (rproc->state == RPROC_DELETED) {
           ^
   drivers/remoteproc/remoteproc_core.c:1938:6: note: Assuming the condition is false
           if (atomic_inc_return(&rproc->power) > 1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1938:2: note: Taking false branch
           if (atomic_inc_return(&rproc->power) > 1) {
           ^
   drivers/remoteproc/remoteproc_core.c:1943:6: note: Assuming field 'state' is not equal to RPROC_DETACHED
           if (rproc->state == RPROC_DETACHED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/remoteproc_core.c:1943:2: note: Taking false branch
           if (rproc->state == RPROC_DETACHED) {
           ^
   drivers/remoteproc/remoteproc_core.c:1950:3: note: Left side of '&&' is true
                   dev_info(dev, "powering up %s\n", rproc->name);
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:424:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:381:7: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                       ^
   drivers/remoteproc/remoteproc_core.c:1950:3: note: Taking true branch
                   dev_info(dev, "powering up %s\n", rproc->name);
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:424:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:381:3: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                   ^
   drivers/remoteproc/remoteproc_core.c:1950:3: note: '?' condition is true
                   dev_info(dev, "powering up %s\n", rproc->name);
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:424:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:390:12: note: expanded from macro '__printk_index_emit'
                                   .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
                                          ^
   drivers/remoteproc/remoteproc_core.c:1950:3: note: '?' condition is true
                   dev_info(dev, "powering up %s\n", rproc->name);
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)

vim +17 include/trace/events/rproc_qcom.h

89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  13  
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  14  /*
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  15   * Tracepoints for remoteproc and subdevice events
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  16   */
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02 @17  TRACE_EVENT(rproc_load_event,
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  18  
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  19  	TP_PROTO(struct rproc *rproc, int ret),
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  20  
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  21  	TP_ARGS(rproc, ret),
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  22  
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  23  	TP_STRUCT__entry(
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  24  		__string(name, rproc->name)
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  25  		__string(firmware, rproc->firmware)
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  26  		__field(int,ret)
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  27  	),
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  28  
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  29  	TP_fast_assign(
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  30  		__assign_str(name, rproc->name);
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  31  		__assign_str(firmware, rproc->firmware);
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  32  		__entry->ret = ret;
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  33  	),
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  34  
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  35  	TP_printk("%s loading firmware %s returned %d",
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  36  			__get_str(name), __get_str(firmware),
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  37  			__entry->ret)
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  38  );
89ccf0f9143e44 Gokul krishna Krishnakumar 2023-03-02  39  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
