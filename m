Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987CE7C
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jan 2023 19:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674503002; x=1706039002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79kbli5aCY7WgaNVRsq9hxJVSHK7SJ+MA9koJdHXENc=;
  b=RHhd03GCF5Qzrw86NtHyrafZs1Y6FHouWUCnMs8Gz6kg/mvq8ZDlhKVp
   /HLOwjLm99aUJ+GKv+mpUzcmxDpRftORd6rAXV9MT6orqe6ppUZsTayGA
   /AYa8jLwGK/yiiw3Cl7Sl8BZHDv3hcuBwq9SxiJNO9R6gfpsrQPtt997T
   ihd8Rwo/Dgb2q0fYXhpYulwRUHXPcE0XSO4XMo9LImKaVn/OK8lJrxSew
   /H7EP6hEMx/UnXYC1K1MDi1LaTkDMPFfYPF9IXq9B7Q/Qjz0se0SNsF9o
   Zok2ph1eDX6LUvN9duE9/hiLfaLXuyZxFIeGvXsEwkZEzw95XJuhNu99U
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353400202"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="353400202"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 11:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="990581938"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="990581938"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2023 11:43:20 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK2it-0005r8-36;
	Mon, 23 Jan 2023 19:43:19 +0000
Date: Tue, 24 Jan 2023 03:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kernel/alternative.c:786:42: warning: Subtracting pointers
 that point to different objects [comparePointers]
Message-ID: <202301240315.LFP5syQz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/kernel/alternative.c:786:42: warning: Subtracting pointers that point to different objects [comparePointers]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: 931ab63664f02b17d2213ef36b83e1e50190a0aa x86/ibt: Implement FineIBT
date:   3 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 931ab63664f02b17d2213ef36b83e1e50190a0aa
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> arch/x86/kernel/e820.c:1217:2: warning: int result is returned as long value. If the return value is long to avoid loss of information, then you have loss of information. [truncLongCastReturn]
    return 64*1024*1024;
    ^
--

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/kernel/static_call.c:143:52: warning: Parameter 'dest' can be declared as pointer to const [constParameter]
   bool __static_call_fixup(void *tramp, u8 op, void *dest)
                                                      ^
>> drivers/acpi/ioapic.c:218:39: warning: Uninitialized variable: ioapic->root_handle [uninitvar]
     if (root->device->handle != ioapic->root_handle)
                                         ^
   drivers/acpi/ioapic.c:236:39: warning: Uninitialized variable: ioapic->root_handle [uninitvar]
     if (root->device->handle != ioapic->root_handle)
                                         ^
--
>> arch/x86/kernel/hpet.c:937:33: warning: Signed integer overflow for expression '0xF<<28'. [integerOverflow]
           (mwait_substates & (0xF << 28));
                                   ^
>> arch/x86/kernel/hpet.c:731:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
     sprintf(hc->name, "hpet%d", i);
     ^
--
>> drivers/acpi/battery.c:477:10: warning: Redundant initialization for 'result'. The initialized value is overwritten before it is read. [redundantInitialization]
     result = extract_package(battery, buffer->pointer,
            ^
   drivers/acpi/battery.c:474:13: note: result is initialized
    int result = -EFAULT;
               ^
   drivers/acpi/battery.c:477:10: note: result is overwritten
     result = extract_package(battery, buffer->pointer,
            ^
   arch/x86/kernel/alternative.c:1882:64: warning: Parameter 'addr' can be declared as pointer to const [constParameter]
   static void text_poke_loc_init(struct text_poke_loc *tp, void *addr,
                                                                  ^
   arch/x86/kernel/alternative.c:528:66: warning: Parameter 'end' can be declared as pointer to const [constParameter]
   void __init_or_module noinline apply_retpolines(s32 *start, s32 *end)
                                                                    ^
   arch/x86/kernel/alternative.c:610:63: warning: Parameter 'end' can be declared as pointer to const [constParameter]
   void __init_or_module noinline apply_returns(s32 *start, s32 *end)
                                                                 ^
>> arch/x86/kernel/alternative.c:786:42: warning: Subtracting pointers that point to different objects [comparePointers]
    if (p[0] == JMP8_INSN_OPCODE && p[1] == fineibt_caller_jmp)
                                            ^
   arch/x86/kernel/alternative.c:759:11: note: Variable declared here.
   extern u8 fineibt_caller_end[];
             ^
   arch/x86/kernel/alternative.c:786:42: note: Array decayed to pointer here.
    if (p[0] == JMP8_INSN_OPCODE && p[1] == fineibt_caller_jmp)
                                            ^
   arch/x86/kernel/alternative.c:758:11: note: Variable declared here.
   extern u8 fineibt_caller_start[];
             ^
   arch/x86/kernel/alternative.c:786:42: note: Array decayed to pointer here.
    if (p[0] == JMP8_INSN_OPCODE && p[1] == fineibt_caller_jmp)
                                            ^
   arch/x86/kernel/alternative.c:786:42: note: Subtracting pointers that point to different objects
    if (p[0] == JMP8_INSN_OPCODE && p[1] == fineibt_caller_jmp)
                                            ^
   arch/x86/kernel/alternative.c:800:39: warning: Subtracting pointers that point to different objects [comparePointers]
    const u8 jmp[] = { JMP8_INSN_OPCODE, fineibt_caller_jmp };
                                         ^
   arch/x86/kernel/alternative.c:759:11: note: Variable declared here.
   extern u8 fineibt_caller_end[];
             ^
   arch/x86/kernel/alternative.c:800:39: note: Array decayed to pointer here.
    const u8 jmp[] = { JMP8_INSN_OPCODE, fineibt_caller_jmp };
                                         ^
   arch/x86/kernel/alternative.c:758:11: note: Variable declared here.
   extern u8 fineibt_caller_start[];
             ^
   arch/x86/kernel/alternative.c:800:39: note: Array decayed to pointer here.
    const u8 jmp[] = { JMP8_INSN_OPCODE, fineibt_caller_jmp };
                                         ^
   arch/x86/kernel/alternative.c:800:39: note: Subtracting pointers that point to different objects
    const u8 jmp[] = { JMP8_INSN_OPCODE, fineibt_caller_jmp };
                                         ^
   arch/x86/kernel/alternative.c:807:11: warning: Subtracting pointers that point to different objects [comparePointers]
     addr -= fineibt_caller_size;
             ^
   arch/x86/kernel/alternative.c:759:11: note: Variable declared here.
   extern u8 fineibt_caller_end[];
             ^
   arch/x86/kernel/alternative.c:800:39: note: Array decayed to pointer here.
    const u8 jmp[] = { JMP8_INSN_OPCODE, fineibt_caller_jmp };
                                         ^
   arch/x86/kernel/alternative.c:758:11: note: Variable declared here.
   extern u8 fineibt_caller_start[];
             ^
   arch/x86/kernel/alternative.c:800:39: note: Array decayed to pointer here.
    const u8 jmp[] = { JMP8_INSN_OPCODE, fineibt_caller_jmp };
                                         ^
   arch/x86/kernel/alternative.c:807:11: note: Subtracting pointers that point to different objects
     addr -= fineibt_caller_size;
             ^
   arch/x86/kernel/alternative.c:832:49: warning: Subtracting pointers that point to different objects [comparePointers]
     text_poke_early(addr, fineibt_preamble_start, fineibt_preamble_size);
                                                   ^
   arch/x86/kernel/alternative.c:744:11: note: Variable declared here.
   extern u8 fineibt_preamble_end[];
             ^
   arch/x86/kernel/alternative.c:832:49: note: Array decayed to pointer here.
     text_poke_early(addr, fineibt_preamble_start, fineibt_preamble_size);
                                                   ^
   arch/x86/kernel/alternative.c:743:11: note: Variable declared here.
   extern u8 fineibt_preamble_start[];
             ^
   arch/x86/kernel/alternative.c:832:49: note: Array decayed to pointer here.
     text_poke_early(addr, fineibt_preamble_start, fineibt_preamble_size);
                                                   ^
   arch/x86/kernel/alternative.c:832:49: note: Subtracting pointers that point to different objects
     text_poke_early(addr, fineibt_preamble_start, fineibt_preamble_size);
                                                   ^
   arch/x86/kernel/alternative.c:849:11: warning: Subtracting pointers that point to different objects [comparePointers]
     addr -= fineibt_caller_size;
             ^
   arch/x86/kernel/alternative.c:759:11: note: Variable declared here.
   extern u8 fineibt_caller_end[];
             ^
   arch/x86/kernel/alternative.c:849:11: note: Array decayed to pointer here.
     addr -= fineibt_caller_size;
             ^
   arch/x86/kernel/alternative.c:758:11: note: Variable declared here.
   extern u8 fineibt_caller_start[];
             ^
   arch/x86/kernel/alternative.c:849:11: note: Array decayed to pointer here.
     addr -= fineibt_caller_size;
             ^
   arch/x86/kernel/alternative.c:849:11: note: Subtracting pointers that point to different objects
     addr -= fineibt_caller_size;
             ^
   arch/x86/kernel/alternative.c:852:48: warning: Subtracting pointers that point to different objects [comparePointers]
      text_poke_early(addr, fineibt_caller_start, fineibt_caller_size);
                                                  ^
   arch/x86/kernel/alternative.c:759:11: note: Variable declared here.
   extern u8 fineibt_caller_end[];
             ^
   arch/x86/kernel/alternative.c:852:48: note: Array decayed to pointer here.
      text_poke_early(addr, fineibt_caller_start, fineibt_caller_size);
                                                  ^
   arch/x86/kernel/alternative.c:758:11: note: Variable declared here.
   extern u8 fineibt_caller_start[];
--
>> arch/x86/kernel/cpu/common.c:1628:40: warning: Comparing pointers that point to different objects [comparePointers]
    for (cdev = __x86_cpu_dev_start; cdev < __x86_cpu_dev_end; cdev++) {
                                          ^
   arch/x86/kernel/cpu/cpu.h:44:36: note: Variable declared here.
   extern const struct cpu_dev *const __x86_cpu_dev_start[],
                                      ^
   arch/x86/kernel/cpu/common.c:1628:14: note: Array decayed to pointer here.
    for (cdev = __x86_cpu_dev_start; cdev < __x86_cpu_dev_end; cdev++) {
                ^
   arch/x86/kernel/cpu/cpu.h:45:15: note: Variable declared here.
          *const __x86_cpu_dev_end[];
                 ^
   arch/x86/kernel/cpu/common.c:1628:42: note: Array decayed to pointer here.
    for (cdev = __x86_cpu_dev_start; cdev < __x86_cpu_dev_end; cdev++) {
                                            ^
   arch/x86/kernel/cpu/common.c:1628:40: note: Comparing pointers that point to different objects
    for (cdev = __x86_cpu_dev_start; cdev < __x86_cpu_dev_end; cdev++) {
                                          ^
>> arch/x86/kernel/cpu/common.c:275:45: warning: Parameter 's' can be declared as pointer to const [constParameter]
   static int __init x86_noinvpcid_setup(char *s)
                                               ^
>> arch/x86/kernel/cpu/common.c:530:59: warning: Parameter 'c' can be declared as pointer to const [constParameter]
   static __always_inline void setup_pku(struct cpuinfo_x86 *c)
                                                             ^

vim +786 arch/x86/kernel/alternative.c

931ab63664f02b Peter Zijlstra 2022-10-27  776  
931ab63664f02b Peter Zijlstra 2022-10-27  777  static u32 decode_caller_hash(void *addr)
931ab63664f02b Peter Zijlstra 2022-10-27  778  {
931ab63664f02b Peter Zijlstra 2022-10-27  779  	u8 *p = addr;
931ab63664f02b Peter Zijlstra 2022-10-27  780  
931ab63664f02b Peter Zijlstra 2022-10-27  781  	/* 41 ba 78 56 34 12       mov    $0x12345678,%r10d */
931ab63664f02b Peter Zijlstra 2022-10-27  782  	if (p[0] == 0x41 && p[1] == 0xba)
931ab63664f02b Peter Zijlstra 2022-10-27  783  		return -*(u32 *)(addr + 2);
931ab63664f02b Peter Zijlstra 2022-10-27  784  
931ab63664f02b Peter Zijlstra 2022-10-27  785  	/* e8 0c 78 56 34 12	   jmp.d8  +12 */
931ab63664f02b Peter Zijlstra 2022-10-27 @786  	if (p[0] == JMP8_INSN_OPCODE && p[1] == fineibt_caller_jmp)
931ab63664f02b Peter Zijlstra 2022-10-27  787  		return -*(u32 *)(addr + 2);
931ab63664f02b Peter Zijlstra 2022-10-27  788  
931ab63664f02b Peter Zijlstra 2022-10-27  789  	return 0; /* invalid hash value */
931ab63664f02b Peter Zijlstra 2022-10-27  790  }
931ab63664f02b Peter Zijlstra 2022-10-27  791  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
