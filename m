Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3DF1DDC3F
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 07:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541603; cv=none; b=WNfuQTY+p3ab2Ivel8xkCCg0bgH/MlaT/f7sW0JY2r+vrksy/81SQm3xXLZY5skzg4IRdf7YuYfy+YLmzPxt03Ki+KQ0d/XO0Syjj3/OFV0hK9Pnl538B8ezQhLuoxVbSUkkfk2i6q2toWJgZyMPnbK48Dw7Fok8dgjyn6OPfRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541603; c=relaxed/simple;
	bh=ZdZfDKtFnF/Hne1xbhCa285LiLcVMpzgYYCa88xCOoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gl1UBm8BeWk4soQy97jP9vY8yJkUWidTlyJQZh6kg3JhAqOOHgxn5/a3i5Thylf0aH5cpWui2siTsruNfj3S7ooMJUj/ZpZ0VL526oppUxyq37D217PmTWm6uh1fBeIJ8YrbD+UF4EkD//0fUuQZv5CaHAzm+CA1cZPICZQ8uDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oeg/u0k1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oeg/u0k1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749541602; x=1781077602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdZfDKtFnF/Hne1xbhCa285LiLcVMpzgYYCa88xCOoQ=;
  b=Oeg/u0k1bVKptlcf5j0Etvb4ctgwG9F4TvVVPWaMdQ3tEyA0lIVxO00l
   JxKFM8ZU4Q0Akx5S8HBmPlT0wFSBwY1AcaTIZTJJce/2H3lATIqROBQB4
   iWtann8/q4FQEJ0Azlj6Jk4zJVG6JttbFxc2vrlmz8PlfW2TGyt/MVzx0
   7WpStf/FCgIW2gfIqJkL/jCp3Kh/5sxvspROTQvQ+n+k85PDy7bGXX8t/
   3JRJiA+hY/Rqcjb6VNwixJTdSO0rCQ/1Ap1LqG0/80XYtrjMnO4Bo0jmI
   L1NEpWaYhqmasqfev2bRqFl8UqDAFOpYQ8NppsbXaBlb4kuXNFcOp7jAc
   Q==;
X-CSE-ConnectionGUID: OE1yHfY5R2qOaNA72/TF7w==
X-CSE-MsgGUID: cSetdHvkSXqZg29GLCCTtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55302532"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="55302532"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:46:42 -0700
X-CSE-ConnectionGUID: MtDa+1IKQTGbU0QHAhjZXQ==
X-CSE-MsgGUID: 6U+fwQxkQw66HTxHqmXHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="152010190"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2025 00:46:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOtgs-0007wM-0r;
	Tue, 10 Jun 2025 07:46:38 +0000
Date: Tue, 10 Jun 2025 15:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.12/dovetail-xenomai 11/11]
 include/linux/irq_pipeline.h: linux/irqstage.h is included more than once.
Message-ID: <202506101532.HUQYgT2c-lkp@intel.com>
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
CC: Hongzhan Chen <hongzhan.chen@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.12/dovetail-xenomai
head:   42cd032408f34e5fc3e2416eaefb6467c7421631
commit: ad2b528874bb9940b7d56f2acd1343db4fa3eb4c [11/11] genirq: irq_pipeline: add IRQ pipeline core
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506101532.HUQYgT2c-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/irq_pipeline.h: linux/irqstage.h is included more than once.

vim +21 include/linux/irq_pipeline.h

    16	
    17	#include <linux/compiler.h>
    18	#include <linux/irqdomain.h>
    19	#include <linux/percpu.h>
    20	#include <linux/interrupt.h>
  > 21	#include <linux/irqstage.h>
    22	#include <linux/thread_info.h>
    23	#include <asm/irqflags.h>
    24	
    25	void irq_pipeline_init_early(void);
    26	
    27	void irq_pipeline_init(void);
    28	
    29	void arch_irq_pipeline_init(void);
    30	
    31	int generic_pipeline_irq_desc(struct irq_desc *desc);
    32	
    33	int irq_inject_pipeline(unsigned int irq);
    34	
    35	void synchronize_pipeline(void);
    36	
    37	static __always_inline void synchronize_pipeline_on_irq(void)
    38	{
    39		/*
    40		 * Optimize if we preempted the high priority oob stage: we
    41		 * don't need to synchronize the pipeline unless there is a
    42		 * pending interrupt for it.
    43		 */
    44		if (running_inband() ||
    45		    stage_irqs_pending(this_oob_staged()))
    46			synchronize_pipeline();
    47	}
    48	
    49	bool handle_oob_irq(struct irq_desc *desc);
    50	
    51	void arch_do_IRQ_pipelined(struct irq_desc *desc);
    52	
    53	#ifdef CONFIG_SMP
    54	void irq_send_oob_ipi(unsigned int ipi,
    55			const struct cpumask *cpumask);
    56	#endif	/* CONFIG_SMP */
    57	
    58	void irq_pipeline_oops(void);
    59	
    60	bool irq_pipeline_can_idle(void);
    61	
    62	bool irq_cpuidle_enter(struct cpuidle_device *dev,
    63			       struct cpuidle_state *state);
    64	
    65	int run_oob_call(int (*fn)(void *arg), void *arg);
    66	
    67	static inline bool inband_irq_pending(void)
    68	{
    69		check_hard_irqs_disabled();
    70	
    71		return stage_irqs_pending(this_inband_staged());
    72	}
    73	
    74	struct irq_stage_data *
    75	handle_irq_pipelined_prepare(struct pt_regs *regs);
    76	
    77	int handle_irq_pipelined_finish(struct irq_stage_data *prevd,
    78					struct pt_regs *regs);
    79	
    80	int handle_irq_pipelined(struct pt_regs *regs);
    81	
    82	void sync_inband_irqs(void);
    83	
    84	void kentry_enter_pipelined(struct pt_regs *regs);
    85	
    86	void noinstr kentry_exit_pipelined(struct pt_regs *regs);
    87	
    88	static inline void irq_pipeline_idling_checks(void)
    89	{
    90		if (irq_pipeline_debug()) {
    91			WARN_ON_ONCE(!hard_irqs_disabled());
    92			WARN_ON_ONCE(stage_irqs_pending(this_inband_staged()));
    93		}
    94	}
    95	
    96	bool irq_cpuidle_control(struct cpuidle_device *dev,
    97				struct cpuidle_state *state);
    98	
    99	extern struct irq_domain *synthetic_irq_domain;
   100	
   101	#else /* !CONFIG_IRQ_PIPELINE */
   102	
 > 103	#include <linux/irqstage.h>
   104	#include <linux/hardirq.h>
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
