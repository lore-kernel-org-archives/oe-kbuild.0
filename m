Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D175101F2
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jul 2023 17:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688406921; x=1719942921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KOpklyyzFdS36ciUEGcwYob4+QBSFJNO955paDmLINI=;
  b=aDwwRN2YyccS+LEsG+ibDwhEcb8NY/42OKv+CdVphK0wE99SZjIk98To
   bhzFGL3g9Gcq+JF4R4UXz6IbauytbamMqsRn7enQ0Tb7KjjBJQGnWxSdO
   4Z9jmq3Lqk7+4tih9OyqelpId6WJQ0Vm/y+qWdFA78VTXhMtIRorvdOIl
   okTm5vIdtfxDue/sNPLAYh+lIc+kE7vJb04ketUQJS0BJSCHp3qnF/2mk
   4uUpiJApvE7xqPlXjQ8ofjVNNNKt09RA5AdqdptrcPNsbz/MDP0DWdfv1
   EO+JsKLS/H4FRLEKj+KdPJstdrGp3zRNZM+UKo1LnL3bz8Gj6tqlEdP+e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343270558"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="343270558"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 10:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="668822458"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="668822458"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Jul 2023 10:55:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGNld-000HYP-3B;
	Mon, 03 Jul 2023 17:55:17 +0000
Date: Tue, 4 Jul 2023 01:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/signal.c:123 __restore_v_state() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202307040106.e0YkajJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Guo Ren <guoren@linux.alibaba.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Greentime Hu <greentime.hu@sifive.com>
CC: Andy Chiu <andy.chiu@sifive.com>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a901a3568fd26ca9c4a82d8bc5ed5b3ed844d451
commit: fa8e7cce55da3569259dc270801885c420eb50fe riscv: Enable Vector code to be built
date:   4 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040106.e0YkajJ9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040106.e0YkajJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307040106.e0YkajJ9-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/signal.c:123 __restore_v_state() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
arch/riscv/kernel/signal.c:50 restore_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:64 save_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:135 __restore_v_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/signal.c:155 restore_sigcontext() warn: maybe return -EFAULT instead of the bytes remaining?

vim +123 arch/riscv/kernel/signal.c

8ee0b41898fa26 Greentime Hu 2023-06-05  107  
8ee0b41898fa26 Greentime Hu 2023-06-05  108  /*
8ee0b41898fa26 Greentime Hu 2023-06-05  109   * Restore Vector extension context from the user's signal frame. This function
8ee0b41898fa26 Greentime Hu 2023-06-05  110   * assumes a valid extension header. So magic and size checking must be done by
8ee0b41898fa26 Greentime Hu 2023-06-05  111   * the caller.
8ee0b41898fa26 Greentime Hu 2023-06-05  112   */
8ee0b41898fa26 Greentime Hu 2023-06-05  113  static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26 Greentime Hu 2023-06-05  114  {
8ee0b41898fa26 Greentime Hu 2023-06-05  115  	long err;
8ee0b41898fa26 Greentime Hu 2023-06-05  116  	struct __sc_riscv_v_state __user *state = sc_vec;
8ee0b41898fa26 Greentime Hu 2023-06-05  117  	void __user *datap;
8ee0b41898fa26 Greentime Hu 2023-06-05  118  
8ee0b41898fa26 Greentime Hu 2023-06-05  119  	/* Copy everything of __sc_riscv_v_state except datap. */
8ee0b41898fa26 Greentime Hu 2023-06-05  120  	err = __copy_from_user(&current->thread.vstate, &state->v_state,
8ee0b41898fa26 Greentime Hu 2023-06-05  121  			       offsetof(struct __riscv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu 2023-06-05  122  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05 @123  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  124  
8ee0b41898fa26 Greentime Hu 2023-06-05  125  	/* Copy the pointer datap itself. */
8ee0b41898fa26 Greentime Hu 2023-06-05  126  	err = __get_user(datap, &state->v_state.datap);
8ee0b41898fa26 Greentime Hu 2023-06-05  127  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  128  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  129  	/*
8ee0b41898fa26 Greentime Hu 2023-06-05  130  	 * Copy the whole vector content from user space datap. Use
8ee0b41898fa26 Greentime Hu 2023-06-05  131  	 * copy_from_user to prevent information leak.
8ee0b41898fa26 Greentime Hu 2023-06-05  132  	 */
8ee0b41898fa26 Greentime Hu 2023-06-05  133  	err = copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu 2023-06-05  134  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  135  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  136  
8ee0b41898fa26 Greentime Hu 2023-06-05  137  	riscv_v_vstate_restore(current, regs);
8ee0b41898fa26 Greentime Hu 2023-06-05  138  
8ee0b41898fa26 Greentime Hu 2023-06-05  139  	return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  140  }
8ee0b41898fa26 Greentime Hu 2023-06-05  141  #else
8ee0b41898fa26 Greentime Hu 2023-06-05  142  #define save_v_state(task, regs) (0)
8ee0b41898fa26 Greentime Hu 2023-06-05  143  #define __restore_v_state(task, regs) (0)
8ee0b41898fa26 Greentime Hu 2023-06-05  144  #endif
8ee0b41898fa26 Greentime Hu 2023-06-05  145  

:::::: The code at line 123 was first introduced by commit
:::::: 8ee0b41898fa26f66e32237f179b6989c65600d6 riscv: signal: Add sigcontext save/restore for vector

:::::: TO: Greentime Hu <greentime.hu@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
