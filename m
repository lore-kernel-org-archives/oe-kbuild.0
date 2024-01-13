Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F8A63B3
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jan 2024 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLFOSBZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705173441; x=1736709441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++sCc7dr0QxQxgmgJ258hnpTEcd+lg+hyqHj3Qm7GiA=;
  b=OLFOSBZrZAfSG1x5KLTcVTM1KG+0ytHWJUrGvot4s0/K3nx7mUcKPq/L
   8QldCJb+yl8CsW/XPKpv4c7lr0RHiZcKdNc8wP0sGPVy8wBTkViNnFb80
   6Ikkttw99UNDtBLKfxX0Cpe83iyE24KfjkMEO6FRGK39sDKQ4tfJh/tRL
   j2A8fv/YdR0cTuGX7z/0u/gWAGy7veJ01n9oQN8B7Csm4fopg7j0kMlIU
   L14rtHtcHZyPZ+lG9Ziu63IJJAPNw4oZmj2Rvak/Z2QzxPm8JUhfm6gMs
   IRtJmrkZ9XmcqmnLyk6C/dFseVdZYGWwBZTaKiXnOLXVoZZ3S5my0Hwke
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="12766452"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="12766452"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 11:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="1114536247"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="1114536247"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jan 2024 11:17:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOjVJ-000Aq6-0W;
	Sat, 13 Jan 2024 19:17:13 +0000
Date: Sun, 14 Jan 2024 03:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.1/dovetail-xenomai 15614/15708]
 include/linux/irq_pipeline.h: linux/irqstage.h is included more than once.
Message-ID: <202401140318.Rxwl6xA8-lkp@intel.com>
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
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: 0297a79c3e4df512eddd9c0ece7e8d4a005d6001 [15614/15708] genirq: irq_pipeline: add IRQ pipeline core
:::::: branch date: 11 days ago
:::::: commit date: 5 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401140318.Rxwl6xA8-lkp@intel.com/

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
    60	bool irq_cpuidle_enter(struct cpuidle_device *dev,
    61			       struct cpuidle_state *state);
    62	
    63	int run_oob_call(int (*fn)(void *arg), void *arg);
    64	
    65	static inline bool inband_irq_pending(void)
    66	{
    67		check_hard_irqs_disabled();
    68	
    69		return stage_irqs_pending(this_inband_staged());
    70	}
    71	
    72	struct irq_stage_data *
    73	handle_irq_pipelined_prepare(struct pt_regs *regs);
    74	
    75	int handle_irq_pipelined_finish(struct irq_stage_data *prevd,
    76					struct pt_regs *regs);
    77	
    78	int handle_irq_pipelined(struct pt_regs *regs);
    79	
    80	void sync_inband_irqs(void);
    81	
    82	extern struct irq_domain *synthetic_irq_domain;
    83	
    84	#else /* !CONFIG_IRQ_PIPELINE */
    85	
  > 86	#include <linux/irqstage.h>
    87	#include <linux/hardirq.h>
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
