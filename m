Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4381CCB51
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Aug 2024 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724345364; cv=none; b=IYbrmTE7FO0MPwCPQhTEaRg7Y9oAQ+aQB5slLwUH3GjFLnLetAPNhQElA3OKFJv76cjfMhL0C6TGUbv/Gotx8ltTfJmYeKohjh3Xci6qymGET7Mc7Hb0CzlipsMGEFwCuZutgjc1w/PkinEHSYe82FJV/+PzrDbRZtv4kxCkE00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724345364; c=relaxed/simple;
	bh=ZIsEdDVtq07s9XdQLOavazfwPUNETWHNBg5zXgIJSMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X7TAsvaQPKA3scNEQE2e5otYcUgsENO+8X9PPI1e4rH/ensxQ79TA5xONWy7AD12sFmXIteE2+dXBDalQpkGKyB0l1PL8aVYu20QI9569BJvvR6eVRYAGj5Ap0OlYnU0ZtShx6xNok+r8CIac91sKNlNP2sJuuw/kD3xTooSyak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nX6XDv9L; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nX6XDv9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724345362; x=1755881362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZIsEdDVtq07s9XdQLOavazfwPUNETWHNBg5zXgIJSMU=;
  b=nX6XDv9L9q1/zn940kPiuztNSqu0Y3V7Q2cY4hD46SWTM+mAYcugvni+
   2Kz2QYCT6wxKyCjV8dGoy4lWUamWWBKq6ngLORhOOwbuWXizokaXbYcwe
   myTQdv/OVhsBZOhQtHLnEwpQ6qLzQ05nCA/UWqvU8GOMrMGSk4HRMzPwO
   TmNVJ2/b+6ohv5H9s2QjQJSeMVoPqM6k3z7AwtogPkpJl8QSyEJnDUGPD
   Y00DEjJ8Nvd18Sf9bSC+SgPIleuJ9hr6gb4/pfA/OprI5jNMR/nZkTINI
   zgv7cSvSNJbeQg5PwC5T0KtclHoyCEj35ODMRrbjxKyteEEcISQS5Jdhi
   w==;
X-CSE-ConnectionGUID: IPMVYkikQXGvPAF7QrIoEQ==
X-CSE-MsgGUID: eZzHjDB9QvSz8S5uIP2RSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33934086"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33934086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 09:49:22 -0700
X-CSE-ConnectionGUID: Arohf3V5ST6O4OfnUmHH7Q==
X-CSE-MsgGUID: ruv1rH0LQdGCmvybiz85IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="92250929"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Aug 2024 09:49:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shAzu-000D06-0G;
	Thu, 22 Aug 2024 16:49:18 +0000
Date: Fri, 23 Aug 2024 00:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xinli-intel-fred-public:intel-lkp 34/36] x86_64/debug_regs.c:37:15:
 error: symbol 'sw_bp' is already defined
Message-ID: <202408230028.6v52vRVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Xin3 Li <xin3.li@intel.com>

Hi Xin,

First bad commit (maybe != root cause):

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   3162d9822c0cb7cb2a3392416d2d5c471a31f276
commit: 3670a5472ea048aa86e62b5bacc22894d7c21f20 [34/36] KVM: selftests: Run debug_regs test with FRED enabled
:::::: branch date: 8 hours ago
:::::: commit date: 31 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230028.6v52vRVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408230028.6v52vRVl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> x86_64/debug_regs.c:37:15: error: symbol 'sw_bp' is already defined
      37 |         asm volatile("sw_bp: int3");
         |                      ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         sw_bp: int3
         |         ^
>> x86_64/debug_regs.c:40:15: error: symbol 'hw_bp' is already defined
      40 |         asm volatile("hw_bp: nop");
         |                      ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         hw_bp: nop
         |         ^
>> x86_64/debug_regs.c:44:24: error: symbol 'write_data' is already defined
      44 |                      "mov %%rax,%0;\n\t write_data:"
         |                                      ^
   <inline asm>:3:3: note: instantiated into assembly here
       3 |          write_data:
         |          ^
>> x86_64/debug_regs.c:53:15: error: symbol 'ss_start' is already defined
      53 |         asm volatile("ss_start: "
         |                      ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         ss_start: sti
         |         ^
>> x86_64/debug_regs.c:63:15: error: symbol 'bd_start' is already defined
      63 |         asm volatile("bd_start: mov %%dr0, %%rax" : : : "rax");
         |                      ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         bd_start: mov %dr0, %rax
         |         ^
   5 errors generated.


vim +/sw_bp +37 tools/testing/selftests/kvm/x86_64/debug_regs.c

449aa906e67e57 Peter Xu       2020-05-05  22  
3670a5472ea048 Xin Li         2023-10-27  23  static void guest_test_code(void)
449aa906e67e57 Peter Xu       2020-05-05  24  {
85cc207b8e07df Maxim Levitsky 2021-08-11  25  	/* Create a pending interrupt on current vCPU */
85cc207b8e07df Maxim Levitsky 2021-08-11  26  	x2apic_enable();
85cc207b8e07df Maxim Levitsky 2021-08-11  27  	x2apic_write_reg(APIC_ICR, APIC_DEST_SELF | APIC_INT_ASSERT |
85cc207b8e07df Maxim Levitsky 2021-08-11  28  			 APIC_DM_FIXED | IRQ_VECTOR);
85cc207b8e07df Maxim Levitsky 2021-08-11  29  
449aa906e67e57 Peter Xu       2020-05-05  30  	/*
449aa906e67e57 Peter Xu       2020-05-05  31  	 * Software BP tests.
449aa906e67e57 Peter Xu       2020-05-05  32  	 *
449aa906e67e57 Peter Xu       2020-05-05  33  	 * NOTE: sw_bp need to be before the cmd here, because int3 is an
449aa906e67e57 Peter Xu       2020-05-05  34  	 * exception rather than a normal trap for KVM_SET_GUEST_DEBUG (we
449aa906e67e57 Peter Xu       2020-05-05  35  	 * capture it using the vcpu exception bitmap).
449aa906e67e57 Peter Xu       2020-05-05  36  	 */
449aa906e67e57 Peter Xu       2020-05-05 @37  	asm volatile("sw_bp: int3");
449aa906e67e57 Peter Xu       2020-05-05  38  
449aa906e67e57 Peter Xu       2020-05-05  39  	/* Hardware instruction BP test */
449aa906e67e57 Peter Xu       2020-05-05  40  	asm volatile("hw_bp: nop");
449aa906e67e57 Peter Xu       2020-05-05  41  
449aa906e67e57 Peter Xu       2020-05-05  42  	/* Hardware data BP test */
449aa906e67e57 Peter Xu       2020-05-05  43  	asm volatile("mov $1234,%%rax;\n\t"
449aa906e67e57 Peter Xu       2020-05-05  44  		     "mov %%rax,%0;\n\t write_data:"
449aa906e67e57 Peter Xu       2020-05-05  45  		     : "=m" (guest_value) : : "rax");
449aa906e67e57 Peter Xu       2020-05-05  46  
85cc207b8e07df Maxim Levitsky 2021-08-11  47  	/*
85cc207b8e07df Maxim Levitsky 2021-08-11  48  	 * Single step test, covers 2 basic instructions and 2 emulated
85cc207b8e07df Maxim Levitsky 2021-08-11  49  	 *
85cc207b8e07df Maxim Levitsky 2021-08-11  50  	 * Enable interrupts during the single stepping to see that
85cc207b8e07df Maxim Levitsky 2021-08-11  51  	 * pending interrupt we raised is not handled due to KVM_GUESTDBG_BLOCKIRQ
85cc207b8e07df Maxim Levitsky 2021-08-11  52  	 */
449aa906e67e57 Peter Xu       2020-05-05  53  	asm volatile("ss_start: "
85cc207b8e07df Maxim Levitsky 2021-08-11  54  		     "sti\n\t"
98b0bf02738004 Yang Weijiang  2020-08-14  55  		     "xor %%eax,%%eax\n\t"
449aa906e67e57 Peter Xu       2020-05-05  56  		     "cpuid\n\t"
449aa906e67e57 Peter Xu       2020-05-05  57  		     "movl $0x1a0,%%ecx\n\t"
449aa906e67e57 Peter Xu       2020-05-05  58  		     "rdmsr\n\t"
85cc207b8e07df Maxim Levitsky 2021-08-11  59  		     "cli\n\t"
98b0bf02738004 Yang Weijiang  2020-08-14  60  		     : : : "eax", "ebx", "ecx", "edx");
449aa906e67e57 Peter Xu       2020-05-05  61  
45981dedf555bd Paolo Bonzini  2020-05-06  62  	/* DR6.BD test */
45981dedf555bd Paolo Bonzini  2020-05-06  63  	asm volatile("bd_start: mov %%dr0, %%rax" : : : "rax");
3670a5472ea048 Xin Li         2023-10-27  64  }
3670a5472ea048 Xin Li         2023-10-27  65  

:::::: The code at line 37 was first introduced by commit
:::::: 449aa906e67e57636086967bf0edc1328fd0ca9f KVM: selftests: Add KVM_SET_GUEST_DEBUG test

:::::: TO: Peter Xu <peterx@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
