Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE165E
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Nov 2022 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667376653; x=1698912653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cXlyPTB/GLGjkP+WXgF9bCeFRrsnVxyYAFffk6NYzTg=;
  b=VxxmTgFZo00tZl/QGeCrnb9vHZeQTNbPoMousZZpvRUyGhRMwyHA40NW
   0w2h386kx8QOY5iCWynuJ8H3JVUkVLIMfgKr34LGUjZkMf/VUL6DCelVq
   5qjOaQUxtyA/RH8SNFJJBjJ5dnKYev7NKjWKkXrOcm64m1umvRCTQh+CY
   A9d8h9vaNPQ4doKp+RxBujWd2dO1qGPBxzzk0MPup0qlN/gBeV9MwxcQS
   JIEQ29wRusC0FQ+TBKgBAA+aFOB8MswU3tQA8+LfW42uPhGXCf1Ibh3PE
   N2hRPwAIvLV1K2aAlp3Xg7+g65WTMhE1tHP0sl6LEmzR4C9WIXMU1VLma
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="311061810"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="311061810"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 01:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="963433619"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="963433619"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 02 Nov 2022 01:10:48 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oq8pk-000Ea1-04;
	Wed, 02 Nov 2022 08:10:48 +0000
Date: Wed, 2 Nov 2022 16:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kernel/fpu/xstate.c:605:7: warning: Redundant
 initialization for 'size'. The initialized value is overwritten before it is
 read. [redundantInitialization]
Message-ID: <202211021651.O2lwiQqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/kernel/fpu/xstate.c:605:7: warning: Redundant initialization for 'size'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f71a2b3f435f29b787537d1abedaa7d8ebe6647
commit: 8ad7e8f696951f192c6629a0cbda9ac94c773159 x86/fpu/xsave: Support XSAVEC in the kernel
date:   6 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8ad7e8f696951f192c6629a0cbda9ac94c773159
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> arch/x86/mm/pat/set_memory.c:1036:17: warning: Local variable 'pfn' shadows outer variable [shadowVariable]
     unsigned long pfn = PFN_DOWN(__pa(address));
                   ^
   arch/x86/mm/pat/set_memory.c:974:40: note: Shadowed declaration
    unsigned long lpaddr, lpinc, ref_pfn, pfn, pfninc = 1;
                                          ^
   arch/x86/mm/pat/set_memory.c:1036:17: note: Shadow variable
     unsigned long pfn = PFN_DOWN(__pa(address));
                   ^
>> arch/x86/mm/pat/set_memory.c:385:17: warning: Local variable 'addr' shadows outer variable [shadowVariable]
     unsigned long addr = __cpa_addr(cpa, i);
                   ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:385:17: note: Shadow variable
     unsigned long addr = __cpa_addr(cpa, i);
                   ^
   arch/x86/mm/pat/set_memory.c:2063:16: warning: Local variable 'addr' shadows outer variable [shadowVariable]
    unsigned long addr = (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2063:16: note: Shadow variable
    unsigned long addr = (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/set_memory.c:2129:16: warning: Local variable 'addr' shadows outer variable [shadowVariable]
    unsigned long addr = (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2129:16: note: Shadow variable
    unsigned long addr = (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/set_memory.c:2162:16: warning: Local variable 'addr' shadows outer variable [shadowVariable]
    unsigned long addr = (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2162:16: note: Shadow variable
    unsigned long addr = (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/set_memory.c:2169:16: warning: Local variable 'addr' shadows outer variable [shadowVariable]
    unsigned long addr = (unsigned long)page_address(page);
                  ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/set_memory.c:2169:16: note: Shadow variable
    unsigned long addr = (unsigned long)page_address(page);
                  ^
>> arch/x86/mm/pat/cpa-test.c:58:17: warning: Local variable 'addr' shadows outer variable [shadowVariable]
     unsigned long addr = (unsigned long)__va(i << PAGE_SHIFT);
                   ^
   arch/x86/mm/pat/cpa-test.c:110:22: note: Shadowed declaration
   static unsigned long addr[NTEST];
                        ^
   arch/x86/mm/pat/cpa-test.c:58:17: note: Shadow variable
     unsigned long addr = (unsigned long)__va(i << PAGE_SHIFT);
                   ^
--
   arch/x86/kernel/fpu/xstate.c:1236:7: warning: Local variable 'mask' shadows outer variable [shadowVariable]
     u64 mask = ((u64)1 << i);
         ^
   arch/x86/kernel/fpu/xstate.c:1205:6: note: Shadowed declaration
    u64 mask;
        ^
   arch/x86/kernel/fpu/xstate.c:1236:7: note: Shadow variable
     u64 mask = ((u64)1 << i);
         ^
>> mm/huge_memory.c:1719:15: warning: Local variable 'entry' shadows outer variable [shadowVariable]
     swp_entry_t entry = pmd_to_swp_entry(*pmd);
                 ^
   mm/huge_memory.c:1700:8: note: Shadowed declaration
    pmd_t entry;
          ^
   mm/huge_memory.c:1719:15: note: Shadow variable
     swp_entry_t entry = pmd_to_swp_entry(*pmd);
                 ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/kernel/ptrace.c:1352:1: warning: Found a exit path from function with non-void return type that has missing return statement [missingReturn]
   }
   ^
>> arch/x86/kernel/ptrace.c:451:49: warning: Parameter 'bp' can be declared as pointer to const [constParameter]
   static void ptrace_triggered(struct perf_event *bp,
                                                   ^
>> arch/x86/kernel/ptrace.c:920:7: warning: Return value of function offsetof() is not used. [ignoredReturnValue]
    case offsetof(struct user32, u_debugreg[0]) ...
         ^
   arch/x86/kernel/ptrace.c:979:7: warning: Return value of function offsetof() is not used. [ignoredReturnValue]
    case offsetof(struct user32, u_debugreg[0]) ...
         ^
   arch/x86/kernel/ptrace.c:1347:0: warning: Found a exit path from function with non-void return type that has missing return statement [missingReturn]
     return &user_x86_32_view;
   ^
--
>> arch/x86/kernel/signal.c:197:1: warning: Label 'Efault' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
--
>> drivers/platform/x86/wmi.c:590:30: warning: Redundant condition: wmi_status==AE_OK. 'A || (!A && B)' is equivalent to 'A || B' [redundantCondition]
      if ((wmi_status != AE_OK) ||
                                ^
   drivers/platform/x86/wmi.c:633:31: warning: Redundant condition: wmi_status==AE_OK. 'A || (!A && B)' is equivalent to 'A || B' [redundantCondition]
       if ((wmi_status != AE_OK) ||
                                 ^
>> drivers/platform/x86/wmi.c:1144:50: warning: Parameter 'device' can be declared as pointer to const [constParameter]
   static void wmi_free_devices(struct acpi_device *device)
                                                    ^
>> drivers/platform/x86/wmi.c:178:27: warning: Uninitialized variable: &dummy_info [uninitvar]
    info_ptr = info ? info : &dummy_info;
                             ^
>> drivers/platform/x86/wmi.c:660:16: warning: Uninitialized variable: gblock->flags [uninitvar]
     if ((gblock->flags & ACPI_WMI_EVENT) && gblock->notify_id == event)
                  ^
   drivers/platform/x86/wmi.c:658:31: note: Assignment 'gblock=&wblock->gblock', assigned value is <Uninit>
     struct guid_block *gblock = &wblock->gblock;
                                 ^
   drivers/platform/x86/wmi.c:660:16: note: Uninitialized variable: gblock->flags
     if ((gblock->flags & ACPI_WMI_EVENT) && gblock->notify_id == event)
                  ^
>> drivers/platform/x86/wmi.c:661:26: warning: Uninitialized variables: wblock.dev, wblock.list, wblock.gblock, wblock.char_dev, wblock.char_mutex, wblock.acpi_device, wblock.handler, wblock.handler_data, wblock.req_buf_size, wblock.flags [uninitvar]
      return get_event_data(wblock, out);
                            ^
>> drivers/platform/x86/wmi.c:861:16: warning: Uninitialized variable: wblock->dev [uninitvar]
     if (!wblock->dev.dev.driver)
                  ^
>> drivers/platform/x86/wmi.c:1150:15: warning: Uninitialized variable: wblock->acpi_device [uninitvar]
     if (wblock->acpi_device == device) {
                 ^
   drivers/platform/x86/wmi.c:1317:15: warning: Uninitialized variable: wblock->acpi_device [uninitvar]
     if (wblock->acpi_device->handle == handle &&
                 ^
>> drivers/platform/x86/wmi.c:1318:15: warning: Uninitialized variable: block->flags [uninitvar]
         (block->flags & ACPI_WMI_EVENT) &&
                 ^
   drivers/platform/x86/wmi.c:1315:30: note: Assignment 'block=&wblock->gblock', assigned value is <Uninit>
     struct guid_block *block = &wblock->gblock;
                                ^
   drivers/platform/x86/wmi.c:1318:15: note: Uninitialized variable: block->flags
         (block->flags & ACPI_WMI_EVENT) &&
                 ^
>> arch/x86/mm/pat/set_memory.c:402:52: warning: Same expression on both sides of '||' because 'r1_start<=r2_end&&r1_end>=r2_start' and 'r2_start<=r1_end&&r2_end>=r1_start' represent the same value. [knownConditionTrueFalse]
    return (r1_start <= r2_end && r1_end >= r2_start) ||
                                                      ^
>> arch/x86/kernel/fpu/xstate.c:605:7: warning: Redundant initialization for 'size'. The initialized value is overwritten before it is read. [redundantInitialization]
    size = xstate_calculate_size(fpu_kernel_cfg.max_features, compacted);
         ^
   arch/x86/kernel/fpu/xstate.c:590:20: note: size is initialized
    unsigned int size = FXSAVE_SIZE + XSAVE_HDR_SIZE;
                      ^
   arch/x86/kernel/fpu/xstate.c:605:7: note: size is overwritten
    size = xstate_calculate_size(fpu_kernel_cfg.max_features, compacted);
         ^
>> arch/x86/kernel/fpu/xstate.c:589:7: warning: Local variable 'xsaves' shadows outer function [shadowFunction]
    bool xsaves = cpu_feature_enabled(X86_FEATURE_XSAVES);
         ^
   arch/x86/kernel/fpu/xstate.c:1310:6: note: Shadowed declaration
   void xsaves(struct xregs_state *xstate, u64 mask)
        ^
   arch/x86/kernel/fpu/xstate.c:589:7: note: Shadow variable
    bool xsaves = cpu_feature_enabled(X86_FEATURE_XSAVES);
         ^
   arch/x86/kernel/fpu/xstate.c:1708:43: warning: Parameter 'tsk' can be declared as pointer to const [constParameter]
   long fpu_xstate_prctl(struct task_struct *tsk, int option, unsigned long arg2)
                                             ^
>> fs/binfmt_elf.c:2144:24: warning: Uninitialized variable: ets->num_notes [uninitvar]
     for (i = 0; i < ets->num_notes; i++)
                          ^
   fs/binfmt_elf.c:2139:7: note: Assuming condition is false
     if (!writenote(info->notes + i, cprm))
         ^
   fs/binfmt_elf.c:2144:24: note: Uninitialized variable: ets->num_notes
     for (i = 0; i < ets->num_notes; i++)
                          ^
--
>> mm/huge_memory.c:1615:54: warning: Parameter 'new_pmd_ptl' can be declared as pointer to const [constParameter]
   static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
                                                        ^
>> mm/huge_memory.c:1616:19: warning: Parameter 'old_pmd_ptl' can be declared as pointer to const [constParameter]
         spinlock_t *old_pmd_ptl,
                     ^
>> mm/huge_memory.c:2973:9: warning: Local variable 'buf' shadows outer argument [shadowArgument]
     char *buf = input_buf;
           ^
   mm/huge_memory.c:2949:77: note: Shadowed declaration
   static ssize_t split_huge_pages_write(struct file *file, const char __user *buf,
                                                                               ^
   mm/huge_memory.c:2973:9: note: Shadow variable
     char *buf = input_buf;
           ^

vim +/size +605 arch/x86/kernel/fpu/xstate.c

84e4dccc8fce20 Chang S. Bae    2021-10-21  576  
65ac2e9baa7dee Dave Hansen     2015-09-02  577  /*
65ac2e9baa7dee Dave Hansen     2015-09-02  578   * This essentially double-checks what the cpu told us about
65ac2e9baa7dee Dave Hansen     2015-09-02  579   * how large the XSAVE buffer needs to be.  We are recalculating
65ac2e9baa7dee Dave Hansen     2015-09-02  580   * it to be safe.
76d10256a97a7c Kan Liang       2020-07-20  581   *
01707b66535872 Andy Lutomirski 2021-06-23  582   * Independent XSAVE features allocate their own buffers and are not
76d10256a97a7c Kan Liang       2020-07-20  583   * covered by these checks. Only the size of the buffer for task->fpu
76d10256a97a7c Kan Liang       2020-07-20  584   * is checked here.
65ac2e9baa7dee Dave Hansen     2015-09-02  585   */
cd9ae761744912 Thomas Gleixner 2021-10-15  586  static bool __init paranoid_xstate_size_valid(unsigned int kernel_size)
65ac2e9baa7dee Dave Hansen     2015-09-02  587  {
8ad7e8f696951f Thomas Gleixner 2022-04-04  588  	bool compacted = cpu_feature_enabled(X86_FEATURE_XCOMPACTED);
8ad7e8f696951f Thomas Gleixner 2022-04-04 @589  	bool xsaves = cpu_feature_enabled(X86_FEATURE_XSAVES);
cd9ae761744912 Thomas Gleixner 2021-10-15  590  	unsigned int size = FXSAVE_SIZE + XSAVE_HDR_SIZE;
65ac2e9baa7dee Dave Hansen     2015-09-02  591  	int i;
65ac2e9baa7dee Dave Hansen     2015-09-02  592  
1c253ff2287fe3 Thomas Gleixner 2021-10-15  593  	for_each_extended_xfeature(i, fpu_kernel_cfg.max_features) {
cd9ae761744912 Thomas Gleixner 2021-10-15  594  		if (!check_xstate_against_struct(i))
cd9ae761744912 Thomas Gleixner 2021-10-15  595  			return false;
65ac2e9baa7dee Dave Hansen     2015-09-02  596  		/*
65ac2e9baa7dee Dave Hansen     2015-09-02  597  		 * Supervisor state components can be managed only by
02b93c0b00df22 Thomas Gleixner 2021-06-23  598  		 * XSAVES.
65ac2e9baa7dee Dave Hansen     2015-09-02  599  		 */
8ad7e8f696951f Thomas Gleixner 2022-04-04  600  		if (!xsaves && xfeature_is_supervisor(i)) {
cd9ae761744912 Thomas Gleixner 2021-10-15  601  			XSTATE_WARN_ON(1);
cd9ae761744912 Thomas Gleixner 2021-10-15  602  			return false;
cd9ae761744912 Thomas Gleixner 2021-10-15  603  		}
65ac2e9baa7dee Dave Hansen     2015-09-02  604  	}
84e4dccc8fce20 Chang S. Bae    2021-10-21 @605  	size = xstate_calculate_size(fpu_kernel_cfg.max_features, compacted);
cd9ae761744912 Thomas Gleixner 2021-10-15  606  	XSTATE_WARN_ON(size != kernel_size);
cd9ae761744912 Thomas Gleixner 2021-10-15  607  	return size == kernel_size;
65ac2e9baa7dee Dave Hansen     2015-09-02  608  }
65ac2e9baa7dee Dave Hansen     2015-09-02  609  

:::::: The code at line 605 was first introduced by commit
:::::: 84e4dccc8fce20b497388d756e12de5c9006eb48 x86/fpu/xstate: Provide xstate_calculate_size()

:::::: TO: Chang S. Bae <chang.seok.bae@intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
