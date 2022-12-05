Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D13AEB31
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Dec 2022 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670237529; x=1701773529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wS9Vnxby8PdBvNA+eCTi7Dnj4BlUNThO15+XwsmA7A=;
  b=ElgMve1f54ffQ63xGwE9whVIUQbErfBfXf9bi7XmCdWx3gDaEsrj/Xh+
   xrOJJ8lC0fNUUM+k5KmSruNDLu9VCjQK2KCovFMDe0kYV+FRVDegz/AwQ
   SjsrZJrovUzMKH3nUw/5foNVOwMIJn/f8pWQaRPfNcFymT8Ln8bn0QHKW
   HT5sCWoFk8VN4cX82bhKf+enc5QwwsaL42svn5ejvGCZWqlA4B47Sv7G1
   QDTBDN5XyYiXKQ0t+8mqbxzRd+Dc7QN4N8thaZtCnDPiv0oTHzbajeI1K
   5BloQgviXYBFQqMS263H58nByt149xdAJn0xlf46UaIETexVISSi+zm42
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="315021756"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="315021756"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 02:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="623461579"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="623461579"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2022 02:52:07 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p294w-00003B-1w;
	Mon, 05 Dec 2022 10:52:06 +0000
Date: Mon, 5 Dec 2022 18:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/kernel/traps.c:93:39: warning: Null pointer
 dereference: regs [ctunullpointer]
Message-ID: <202212051821.pYErx34b-lkp@intel.com>
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
head:   76dcd734eca23168cb008912c0f69ff408905235
commit: 4e62d1d86585e1b62b4f96ee586881dd45a443dc LoongArch: Add kdump support
date:   8 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 weeks ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4e62d1d86585e1b62b4f96ee586881dd45a443dc
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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
https://01.org/lkp
