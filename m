Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C09063CF
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Jun 2025 01:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749606124; cv=none; b=AYw2tfvUJdVHAU9uDVzSWDH9/TodcDNea/bDmhUzUIN/FeHDvwNP2N2e83JCILbrP4K5Ri4esYVeSdU1ukkRuj/cdPKV0NeYzFLsEGNge6tMjChg/IoE7155siC/7mNC8bJbCPPw8D6sx9z0HtdBsYlcTjYZVpHulnzsmR4uJbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749606124; c=relaxed/simple;
	bh=bcxDpQtdmdrHfbYqGnPkxPQVVfGLR7/NKNiubSZV3xM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QLw1nzKL3myEY4wT2qMzz2C080nyg0Lnhp/Oi1p64BH3yuBDibd6/J81QonQ3TRA88EjjCX1g9pIuPwXuIiHFhjO9Ad6t6yttdKzzy0ezeqeNizZFSX5XGIljuxYMF2Of18+y/F1BrArN4xVJ+dWjyM0pQP/jgPDBinV+1+Z2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RP1bFs3F; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RP1bFs3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749606123; x=1781142123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bcxDpQtdmdrHfbYqGnPkxPQVVfGLR7/NKNiubSZV3xM=;
  b=RP1bFs3FV8udcLeRya9PnKsNkVbUHY1KNN1N55wRQRij+eyM5U0D1XpX
   JFRUl/tEIXuH7SEjt1we2NvIdptxfimdj8KPTaHHMddSHE8bjwz1vtiNc
   ntRBj8Q1nQNxsUVc2MmndXKdnh5ShDaSs1cdwwahQvbaoYSyyD/yJNpSL
   m5m3pcFJv+Aczvq+em86A11x174DDyLyEmHSCOtVh0h97WJxMeyAa+O9K
   eFs6aQUL28xSHzPWPfBLTJGh68mAAvebKTSw5WTgkxjTBSBMpNSrGIUCP
   DYtab3uXvHSgdLPMq11Wq2jZBII4bhvhQ73BPBJcryPOrml2yS21Ftmjn
   w==;
X-CSE-ConnectionGUID: 6Cf56xCyTIKAp2KxES5d5w==
X-CSE-MsgGUID: KCkGhBpRSJqDZJAFUYo12Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="69300162"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="69300162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 18:42:02 -0700
X-CSE-ConnectionGUID: G+FDq2iNThSobY8Jx4XMYg==
X-CSE-MsgGUID: sScj9jc0R9CKu4OMH0j9hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="151903523"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2025 18:42:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uP386-0008dZ-1T;
	Tue, 10 Jun 2025 17:51:22 +0000
Date: Wed, 11 Jun 2025 01:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.12/dovetail-xenomai 11/11] include/linux/dovetail.h:
 asm/dovetail.h is included more than once.
Message-ID: <202506110104.RKjITrOK-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 6.12/dovetail-xenomai
head:   42cd032408f34e5fc3e2416eaefb6467c7421631
commit: 7ac03b7e6a95406d3097f314f2f65f2f9e59025d [11/11] dovetail: add core support
:::::: branch date: 6 days ago
:::::: commit date: 5 months ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506110104.RKjITrOK-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/dovetail.h: asm/dovetail.h is included more than once.

vim +22 include/linux/dovetail.h

    16	
    17	#include <linux/sched.h>
    18	#include <linux/mm.h>
    19	#include <linux/thread_info.h>
    20	#include <linux/irqstage.h>
    21	#include <uapi/asm-generic/dovetail.h>
  > 22	#include <asm/dovetail.h>
    23	
    24	enum inband_event_type {
    25		INBAND_TASK_SIGNAL,
    26		INBAND_TASK_MIGRATION,
    27		INBAND_TASK_EXIT,
    28		INBAND_TASK_RETUSER,
    29		INBAND_TASK_PTSTEP,
    30		INBAND_TASK_PTSTOP,
    31		INBAND_TASK_PTCONT,
    32		INBAND_PROCESS_CLEANUP,
    33	};
    34	
    35	struct dovetail_migration_data {
    36		struct task_struct *task;
    37		int dest_cpu;
    38	};
    39	
    40	struct dovetail_altsched_context {
    41		struct task_struct *task;
    42		struct mm_struct *active_mm;
    43		bool borrowed_mm;
    44	};
    45	
    46	#define protect_inband_mm(__flags)			\
    47		do {						\
    48			(__flags) = hard_cond_local_irq_save();	\
    49			barrier();				\
    50		} while (0)					\
    51	
    52	#define unprotect_inband_mm(__flags)			\
    53		do {						\
    54			barrier();				\
    55			hard_cond_local_irq_restore(__flags);	\
    56		} while (0)					\
    57	
    58	void inband_task_init(struct task_struct *p);
    59	
    60	int pipeline_syscall(unsigned int nr, struct pt_regs *regs);
    61	
    62	void __oob_trap_notify(unsigned int exception,
    63			       struct pt_regs *regs);
    64	
    65	static __always_inline void oob_trap_notify(unsigned int exception,
    66						struct pt_regs *regs)
    67	{
    68		if (running_oob() && !test_thread_local_flags(_TLF_OOBTRAP))
    69			__oob_trap_notify(exception, regs);
    70	}
    71	
    72	void __oob_trap_unwind(unsigned int exception,
    73			struct pt_regs *regs);
    74	
    75	static __always_inline void oob_trap_unwind(unsigned int exception,
    76						struct pt_regs *regs)
    77	{
    78		if (test_thread_local_flags(_TLF_OOBTRAP))
    79			__oob_trap_unwind(exception, regs);
    80	}
    81	
    82	void inband_event_notify(enum inband_event_type,
    83				 void *data);
    84	
    85	void inband_clock_was_set(void);
    86	
    87	static inline void inband_signal_notify(struct task_struct *p)
    88	{
    89		if (test_ti_local_flags(task_thread_info(p), _TLF_DOVETAIL))
    90			inband_event_notify(INBAND_TASK_SIGNAL, p);
    91	}
    92	
    93	static inline void inband_migration_notify(struct task_struct *p, int cpu)
    94	{
    95		if (test_ti_local_flags(task_thread_info(p), _TLF_DOVETAIL)) {
    96			struct dovetail_migration_data d = {
    97				.task = p,
    98				.dest_cpu = cpu,
    99			};
   100			inband_event_notify(INBAND_TASK_MIGRATION, &d);
   101		}
   102	}
   103	
   104	static inline void inband_exit_notify(void)
   105	{
   106		inband_event_notify(INBAND_TASK_EXIT, NULL);
   107	}
   108	
   109	static inline void inband_cleanup_notify(struct mm_struct *mm)
   110	{
   111		/*
   112		 * Notify regardless of _TLF_DOVETAIL: current may have
   113		 * resources to clean up although it might not be interested
   114		 * in other kernel events.
   115		 */
   116		inband_event_notify(INBAND_PROCESS_CLEANUP, mm);
   117	}
   118	
   119	static inline void inband_ptstop_notify(void)
   120	{
   121		if (test_thread_local_flags(_TLF_DOVETAIL))
   122			inband_event_notify(INBAND_TASK_PTSTOP, current);
   123	}
   124	
   125	static inline void inband_ptcont_notify(void)
   126	{
   127		if (test_thread_local_flags(_TLF_DOVETAIL))
   128			inband_event_notify(INBAND_TASK_PTCONT, current);
   129	}
   130	
   131	static inline void inband_ptstep_notify(struct task_struct *tracee)
   132	{
   133		if (test_ti_local_flags(task_thread_info(tracee), _TLF_DOVETAIL))
   134			inband_event_notify(INBAND_TASK_PTSTEP, tracee);
   135	}
   136	
   137	static inline
   138	void prepare_inband_switch(struct task_struct *next)
   139	{
   140		struct task_struct *prev = current;
   141	
   142		if (test_ti_local_flags(task_thread_info(next), _TLF_DOVETAIL))
   143			__this_cpu_write(irq_pipeline.rqlock_owner, prev);
   144	}
   145	
   146	void inband_retuser_notify(void);
   147	
   148	bool inband_switch_tail(void);
   149	
   150	void oob_trampoline(void);
   151	
   152	void arch_inband_task_init(struct task_struct *p);
   153	
   154	int dovetail_start(void);
   155	
   156	void dovetail_stop(void);
   157	
   158	void dovetail_init_altsched(struct dovetail_altsched_context *p);
   159	
   160	void dovetail_start_altsched(void);
   161	
   162	void dovetail_stop_altsched(void);
   163	
   164	__must_check int dovetail_leave_inband(void);
   165	
   166	static inline void dovetail_leave_oob(void)
   167	{
   168		clear_thread_local_flags(_TLF_OOB|_TLF_OFFSTAGE);
   169		clear_thread_flag(TIF_MAYDAY);
   170	}
   171	
   172	void dovetail_resume_inband(void);
   173	
   174	bool dovetail_context_switch(struct dovetail_altsched_context *out,
   175				struct dovetail_altsched_context *in,
   176				bool leave_inband);
   177	
   178	static inline
   179	struct oob_thread_state *dovetail_current_state(void)
   180	{
   181		return &current_thread_info()->oob_state;
   182	}
   183	
   184	static inline
   185	struct oob_thread_state *dovetail_task_state(struct task_struct *p)
   186	{
   187		return &task_thread_info(p)->oob_state;
   188	}
   189	
   190	static inline
   191	struct oob_mm_state *dovetail_mm_state(void)
   192	{
   193		if (current->flags & PF_KTHREAD)
   194			return NULL;
   195	
   196		return &current->mm->oob_state;
   197	}
   198	
   199	void dovetail_call_mayday(struct pt_regs *regs);
   200	
   201	static inline void dovetail_send_mayday(struct task_struct *castaway)
   202	{
   203		struct thread_info *ti = task_thread_info(castaway);
   204	
   205		if (test_ti_local_flags(ti, _TLF_DOVETAIL))
   206			set_ti_thread_flag(ti, TIF_MAYDAY);
   207	}
   208	
   209	static inline void dovetail_request_ucall(struct task_struct *task)
   210	{
   211		struct thread_info *ti = task_thread_info(task);
   212	
   213		if (test_ti_local_flags(ti, _TLF_DOVETAIL))
   214			set_ti_thread_flag(ti, TIF_RETUSER);
   215	}
   216	
   217	static inline void dovetail_clear_ucall(void)
   218	{
   219		if (test_thread_flag(TIF_RETUSER))
   220			clear_thread_flag(TIF_RETUSER);
   221	}
   222	
   223	void install_inband_fd(unsigned int fd, struct file *file,
   224			       struct files_struct *files);
   225	
   226	void uninstall_inband_fd(unsigned int fd, struct file *file,
   227				 struct files_struct *files);
   228	
   229	void replace_inband_fd(unsigned int fd, struct file *file,
   230			       struct files_struct *files);
   231	
   232	int __pipeline_syscall(struct pt_regs *regs);
   233	
   234	int handle_oob_syscall(struct pt_regs *regs);
   235	
   236	int handle_pipelined_syscall(struct irq_stage *stage,
   237				struct pt_regs *regs);
   238	
   239	void handle_oob_mayday(struct pt_regs *regs);
   240	
   241	void handle_oob_trap_entry(unsigned int trapnr,
   242				struct pt_regs *regs);
   243	
   244	void handle_oob_trap_exit(unsigned int trapnr,
   245				struct pt_regs *regs);
   246	
   247	void handle_inband_event(enum inband_event_type event,
   248				void *data);
   249	
   250	void resume_oob_task(struct task_struct *p);
   251	
   252	#else	/* !CONFIG_DOVETAIL */
   253	
   254	#include <linux/irqflags.h>
   255	
   256	#ifdef CONFIG_HAVE_DOVETAIL
   257	/* We may have arch-specific placeholders. */
 > 258	#include <asm/dovetail.h>
   259	#endif
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
