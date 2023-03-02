Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B6710FA
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Mar 2023 18:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677782132; x=1709318132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snld4AZsnU/e+k3EsS0s88u7KEcOn46sX+HdRyKrcLA=;
  b=Gc1gDz+e0x7/gtZkwpGyC0OhOmLI6HwA8uCIHuM7lk37QroFJeRR96j/
   CxfZKi7fQuFx7Mlgnxvtd0qTsTiMyHC5kQ84N+AlOFKCRaFWTBE/9/j/Q
   P0ElnxG0DvIquwjevMdyleWjTO+InWaCOtzmWwI6VxxraQV8njI2QNrkZ
   K2GhfVgskrF3fE26KmszofOug35reKXGGOusiuljzEpz8I8duin6SZTnG
   PWNRQ6y/kSK/CD8UIAp3suHmlEO5QR7pRfSo5JbqYaN4GbqEIOMeba64l
   i55wVnqMkQ4Br7PvhThwkusgVkVaOneoxQfEgCCAA0CEVCFpE5ZIJ9/3L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="314472796"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="314472796"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 10:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="849184575"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="849184575"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Mar 2023 10:35:29 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXnm4-0000mo-1h;
	Thu, 02 Mar 2023 18:35:28 +0000
Date: Fri, 3 Mar 2023 02:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-everything 55/65] include/trace/events/ksm.h:46:1:
 warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202303030257.qViN54tN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/trace/events/ksm.h:46:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Stefan Roesch <shr@devkernel.io>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
head:   aa0ad5e65f255c8be4b6b85b68d1c96a72717a64
commit: 3bad55e0792ee3491003909ae3bd6c96693de441 [55/65] mm: add tracepoints to ksm
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-c005-20230226 (https://download.01.org/0day-ci/archive/20230303/202303030257.qViN54tN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=3bad55e0792ee3491003909ae3bd6c96693de441
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-everything
        git checkout 3bad55e0792ee3491003909ae3bd6c96693de441
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303030257.qViN54tN-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   mm/ksm.c:1220:6: note: Left side of '||' is false
           if (!pmd_present(pmde) || pmd_trans_huge(pmde))
               ^
   mm/ksm.c:1220:2: note: Taking false branch
           if (!pmd_present(pmde) || pmd_trans_huge(pmde))
           ^
   mm/ksm.c:1228:2: note: Taking false branch
           if (!pte_same(*ptep, orig_pte)) {
           ^
   mm/ksm.c:1239:2: note: Taking false branch
           if (!is_zero_pfn(page_to_pfn(kpage))) {
           ^
   mm/ksm.c:1244:26: note: Calling 'mk_pte_phys'
                   newpte = pte_mkspecial(pfn_pte(page_to_pfn(kpage),
                                          ^
   arch/s390/include/asm/pgtable.h:1474:30: note: expanded from macro 'pfn_pte'
   #define pfn_pte(pfn, pgprot)    mk_pte_phys(((pfn) << PAGE_SHIFT), (pgprot))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pgtable.h:1344:7: note: Dereference of null pointer
           if (!MACHINE_HAS_NX)
                ^
   arch/s390/include/asm/setup.h:99:26: note: expanded from macro 'MACHINE_HAS_NX'
   #define MACHINE_HAS_NX          (S390_lowcore.machine_flags & MACHINE_FLAG_NX)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/include/asm/preempt.h:107:29: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count += val;
                                      ^
   mm/ksm.c:3438:18: note: Calling 'calc_checksum'
           zero_checksum = calc_checksum(ZERO_PAGE(0));
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:1095:15: note: Calling 'kmap_atomic'
           void *addr = kmap_atomic(page);
                        ^~~~~~~~~~~~~~~~~
   include/linux/highmem-internal.h:212:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PREEMPT_RT))
           ^
   include/linux/highmem-internal.h:215:3: note: Calling '__preempt_count_add'
                   preempt_disable();
                   ^
   include/linux/preempt.h:203:2: note: expanded from macro 'preempt_disable'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:196:29: note: expanded from macro 'preempt_count_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:188:32: note: expanded from macro 'preempt_count_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:107:29: note: Dereference of null pointer
           S390_lowcore.preempt_count += val;
                                      ^
   include/linux/oom.h:62:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           current->signal->oom_flag_origin = true;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   mm/ksm.c:3135:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   mm/ksm.c:3135:2: note: Taking false branch
           if (err)
           ^
   mm/ksm.c:3137:6: note: Assuming 'flags' is <= KSM_RUN_UNMERGE
           if (flags > KSM_RUN_UNMERGE)
               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:3137:2: note: Taking false branch
           if (flags > KSM_RUN_UNMERGE)
           ^
   mm/ksm.c:3149:6: note: Assuming 'ksm_run' is not equal to 'flags'
           if (ksm_run != flags) {
               ^~~~~~~~~~~~~~~~
   mm/ksm.c:3149:2: note: Taking true branch
           if (ksm_run != flags) {
           ^
   mm/ksm.c:3151:7: note: Assuming the condition is true
                   if (flags & KSM_RUN_UNMERGE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:3151:3: note: Taking true branch
                   if (flags & KSM_RUN_UNMERGE) {
                   ^
   mm/ksm.c:3152:4: note: Calling 'set_current_oom_origin'
                           set_current_oom_origin();
                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/oom.h:62:2: note: Dereference of null pointer
           current->signal->oom_flag_origin = true;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/trace/events/ksm.h:46:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   DEFINE_EVENT(ksm_scan_template, ksm_start_scan,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:431:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   mm/ksm.c:2367:6: note: Assuming the condition is false
           if (list_empty(&ksm_mm_head.slot.mm_node))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:2367:2: note: Taking false branch
           if (list_empty(&ksm_mm_head.slot.mm_node))
           ^
   mm/ksm.c:2371:6: note: Assuming the condition is true
           if (mm_slot == &ksm_mm_head) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:2371:2: note: Taking true branch
           if (mm_slot == &ksm_mm_head) {
           ^
   mm/ksm.c:2372:3: note: Calling 'trace_ksm_start_scan'
                   trace_ksm_start_scan(ksm_scan.seqnr, ksm_rmap_items);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/ksm.h:46:1: note: Taking true branch
   DEFINE_EVENT(ksm_scan_template, ksm_start_scan,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:430:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:258:3: note: expanded from macro '__DECLARE_TRACE'
                   if (static_key_false(&__tracepoint_##name.key))         \
                   ^
   include/trace/events/ksm.h:46:1: note: Dereference of null pointer
   DEFINE_EVENT(ksm_scan_template, ksm_start_scan,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:431:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   include/linux/tracepoint.h:261:18: note: expanded from macro '__DECLARE_TRACE'
                                   TP_CONDITION(cond), 0);                 \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/tracepoint.h:149:31: note: expanded from macro 'TP_CONDITION'
   #define TP_CONDITION(args...)   args
                                   ^
   include/linux/tracepoint.h:199:9: note: expanded from macro '__DO_TRACE'
                   if (!(cond))                                            \
                         ^~~~
   include/trace/events/ksm.h:61:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
   DEFINE_EVENT(ksm_scan_template, ksm_stop_scan,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:431:15: note: expanded from macro 'DECLARE_TRACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:14:32: note: expanded from macro 'raw_smp_processor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   mm/ksm.c:2367:6: note: Assuming the condition is false
           if (list_empty(&ksm_mm_head.slot.mm_node))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:2367:2: note: Taking false branch
           if (list_empty(&ksm_mm_head.slot.mm_node))
           ^
   mm/ksm.c:2371:6: note: Assuming the condition is false
           if (mm_slot == &ksm_mm_head) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:2371:2: note: Taking false branch
           if (mm_slot == &ksm_mm_head) {
           ^
   mm/ksm.c:2431:6: note: Assuming the condition is true
           if (ksm_test_exit(mm))
               ^~~~~~~~~~~~~~~~~
   mm/ksm.c:2431:2: note: Taking true branch
           if (ksm_test_exit(mm))
           ^
   mm/ksm.c:2432:3: note: Control jumps to line 2504
                   goto no_vmas;
                   ^
   mm/ksm.c:2517:6: note: Assuming field 'address' is not equal to 0
           if (ksm_scan.address == 0) {
               ^~~~~~~~~~~~~~~~~~~~~
   mm/ksm.c:2517:2: note: Taking false branch
           if (ksm_scan.address == 0) {
           ^
   mm/ksm.c:2550:6: note: Assuming the condition is false
           if (mm_slot != &ksm_mm_head)

vim +46 include/trace/events/ksm.h

3bad55e0792ee34 Stefan Roesch 2023-02-10  37  
3bad55e0792ee34 Stefan Roesch 2023-02-10  38  /**
3bad55e0792ee34 Stefan Roesch 2023-02-10  39   * ksm_start_scan - called after a new ksm scan is started
3bad55e0792ee34 Stefan Roesch 2023-02-10  40   *
3bad55e0792ee34 Stefan Roesch 2023-02-10  41   * @seq:		sequence number of scan
3bad55e0792ee34 Stefan Roesch 2023-02-10  42   * @rmap_entries:	actual number of rmap entries
3bad55e0792ee34 Stefan Roesch 2023-02-10  43   *
3bad55e0792ee34 Stefan Roesch 2023-02-10  44   * Allows to trace the start of a ksm scan.
3bad55e0792ee34 Stefan Roesch 2023-02-10  45   */
3bad55e0792ee34 Stefan Roesch 2023-02-10 @46  DEFINE_EVENT(ksm_scan_template, ksm_start_scan,
3bad55e0792ee34 Stefan Roesch 2023-02-10  47  
3bad55e0792ee34 Stefan Roesch 2023-02-10  48  	TP_PROTO(int seq, u32 rmap_entries),
3bad55e0792ee34 Stefan Roesch 2023-02-10  49  
3bad55e0792ee34 Stefan Roesch 2023-02-10  50  	TP_ARGS(seq, rmap_entries)
3bad55e0792ee34 Stefan Roesch 2023-02-10  51  );
3bad55e0792ee34 Stefan Roesch 2023-02-10  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
