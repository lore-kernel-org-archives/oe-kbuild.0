Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3B2577
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675009577; x=1706545577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHTCXwmU0QPqEI5yeqFToNw9eAYOchKXicwNHJjfv2U=;
  b=XwINj5qI7R3dlyAyuJ0ILRar7F/ydXk6m2T+14fIgOvmPMQoozNoxfpV
   y3TYqfGuJEAqZWLivU8DDhBDJlNb2/XGVs3i2L+9NhaVlOYrwtdTCfJuq
   ZtVMIAyzmnSFYitZfNZM8/YcePbfY1MAuAX1z7Mg2x3xUk64yXiWkiDCV
   qpQ4DRreLPWbS9E3Mkhr/N7++2Qw6BJT1B77Dnpb/GYM6xjHo3B26tUEa
   tMEcLgmkcbNZBQV2RDbQS+qRrzsfSk+YQwfOeFalBsvd4EHgJeiXcnvQI
   GgVjW5in3hiIy2/GlGfIHm3T2v7pMpJpKGd9IX5/OOnEmddDQmrII3po+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307752969"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="307752969"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 08:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="665818987"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="665818987"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jan 2023 08:26:16 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMAVT-0002w6-0R;
	Sun, 29 Jan 2023 16:26:15 +0000
Date: Mon, 30 Jan 2023 00:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/kernel/traps.c:93:39: warning: Null pointer
 dereference: regs [ctunullpointer]
Message-ID: <202301300010.oRLqnpNc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/loongarch/kernel/traps.c:93:39: warning: Null pointer dereference: regs [ctunullpointer]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Youling Tang <tangyouling@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c96618275234ad03d44eafe9f8844305bb44fda4
commit: 4e62d1d86585e1b62b4f96ee586881dd45a443dc LoongArch: Add kdump support
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4e62d1d86585e1b62b4f96ee586881dd45a443dc
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/loongarch/mm/tlb.c:222:30: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
    pwctl0 = pte_i | pte_w << 5 | pmd_i << 10 | pmd_w << 15 | pud_i << 20 | pud_w << 25;
                                ^
--
>> drivers/firmware/efi/efi.c:123:44: warning: Parameter 'kobj' can be declared as pointer to const [constParameter]
   static ssize_t systab_show(struct kobject *kobj,
                                              ^
--
>> arch/loongarch/kernel/traps.c:93:39: warning: Null pointer dereference: regs [ctunullpointer]
    unsigned long *sp = (unsigned long *)regs->regs[3];
                                         ^
   arch/loongarch/kernel/traps.c:250:6: note: Assuming that condition 'regs' is not redundant
   
        ^
   arch/loongarch/kernel/traps.c:244:17: note: Calling function 'show_registers', 1st argument 'regs' value is 0
   
                   ^
   arch/loongarch/kernel/traps.c:221:17: note: Calling function show_stacktrace, 2nd argument is null
    show_stacktrace(current, regs, KERN_DEFAULT, user_mode(regs));
                   ^
   arch/loongarch/kernel/traps.c:93:39: note: Dereferencing argument regs that is null
    unsigned long *sp = (unsigned long *)regs->regs[3];
                                         ^

vim +93 arch/loongarch/kernel/traps.c

0603839b18f4fb Huacai Chen 2022-05-31   86  
0603839b18f4fb Huacai Chen 2022-05-31   87  static void show_stacktrace(struct task_struct *task,
0603839b18f4fb Huacai Chen 2022-05-31   88  	const struct pt_regs *regs, const char *loglvl, bool user)
0603839b18f4fb Huacai Chen 2022-05-31   89  {
0603839b18f4fb Huacai Chen 2022-05-31   90  	int i;
0603839b18f4fb Huacai Chen 2022-05-31   91  	const int field = 2 * sizeof(unsigned long);
0603839b18f4fb Huacai Chen 2022-05-31   92  	unsigned long stackdata;
0603839b18f4fb Huacai Chen 2022-05-31  @93  	unsigned long *sp = (unsigned long *)regs->regs[3];
0603839b18f4fb Huacai Chen 2022-05-31   94  
0603839b18f4fb Huacai Chen 2022-05-31   95  	printk("%sStack :", loglvl);
0603839b18f4fb Huacai Chen 2022-05-31   96  	i = 0;
0603839b18f4fb Huacai Chen 2022-05-31   97  	while ((unsigned long) sp & (PAGE_SIZE - 1)) {
0603839b18f4fb Huacai Chen 2022-05-31   98  		if (i && ((i % (64 / field)) == 0)) {
0603839b18f4fb Huacai Chen 2022-05-31   99  			pr_cont("\n");
0603839b18f4fb Huacai Chen 2022-05-31  100  			printk("%s       ", loglvl);
0603839b18f4fb Huacai Chen 2022-05-31  101  		}
0603839b18f4fb Huacai Chen 2022-05-31  102  		if (i > 39) {
0603839b18f4fb Huacai Chen 2022-05-31  103  			pr_cont(" ...");
0603839b18f4fb Huacai Chen 2022-05-31  104  			break;
0603839b18f4fb Huacai Chen 2022-05-31  105  		}
0603839b18f4fb Huacai Chen 2022-05-31  106  
0603839b18f4fb Huacai Chen 2022-05-31  107  		if (__get_addr(&stackdata, sp++, user)) {
0603839b18f4fb Huacai Chen 2022-05-31  108  			pr_cont(" (Bad stack address)");
0603839b18f4fb Huacai Chen 2022-05-31  109  			break;
0603839b18f4fb Huacai Chen 2022-05-31  110  		}
0603839b18f4fb Huacai Chen 2022-05-31  111  
0603839b18f4fb Huacai Chen 2022-05-31  112  		pr_cont(" %0*lx", field, stackdata);
0603839b18f4fb Huacai Chen 2022-05-31  113  		i++;
0603839b18f4fb Huacai Chen 2022-05-31  114  	}
0603839b18f4fb Huacai Chen 2022-05-31  115  	pr_cont("\n");
0603839b18f4fb Huacai Chen 2022-05-31  116  	show_backtrace(task, regs, loglvl, user);
0603839b18f4fb Huacai Chen 2022-05-31  117  }
0603839b18f4fb Huacai Chen 2022-05-31  118  

:::::: The code at line 93 was first introduced by commit
:::::: 0603839b18f4fb3bffa82515efcf5b02084505ef LoongArch: Add exception/interrupt handling

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
