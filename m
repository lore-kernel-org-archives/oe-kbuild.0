Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573B652
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jan 2024 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNSfy9xx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705214274; x=1736750274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ga9d3HJNe/kgoKkcZWCsE0NoP2CvboUb7OxZ7yD2yyU=;
  b=LNSfy9xxcmjmtE2gQWiXc7tj69xNBTBALy7kiZU+7BXTLTBAT6Uu4YWM
   iKzhjqyhQQ7RGwB9vJD0JbY9miMcjIXI4ww1czukmW3LnDaNFMerTEM8q
   RRizFZXUiPZfHZ6mgP8qPgGm2W+dUXLuaYHSrE5jscYIaLfC7L7e1KfJp
   tCkSIiYyNt1GlcPfBTYbJo2saaAhVVH/urQJhCSDCXsY+ZEYGCPQAfhRb
   lwHn1cDB4+nUa0eNPQFoEFWo1ah6kprtaGE1mf2pDywfl7sKy65ulH5r7
   C9JSZc2OBaApBNgcOQPIy7Ne9375tZWb1NtdJbfSQBpk8j3yuYvs1LKeV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6152598"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="6152598"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 22:37:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="776423436"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="776423436"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Jan 2024 22:37:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOu7v-000BGC-2p;
	Sun, 14 Jan 2024 06:37:48 +0000
Date: Sun, 14 Jan 2024 14:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.1/dovetail-xenomai 15646/15708]
 include/linux/dovetail.h: asm/dovetail.h is included more than once.
Message-ID: <202401141428.fRvhSijk-lkp@intel.com>
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
commit: 93b8046b5a041b9aac3797ad35e2e1ccebd11695 [15646/15708] dovetail: add core support
:::::: branch date: 11 days ago
:::::: commit date: 5 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401141428.fRvhSijk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/dovetail.h: asm/dovetail.h is included more than once.

vim +16 include/linux/dovetail.h

    10	
    11	#include <linux/sched.h>
    12	#include <linux/mm.h>
    13	#include <linux/thread_info.h>
    14	#include <linux/irqstage.h>
    15	#include <uapi/asm-generic/dovetail.h>
  > 16	#include <asm/dovetail.h>
    17	
    18	struct pt_regs;
    19	struct task_struct;
    20	struct file;
    21	struct files_struct;
    22	
    23	enum inband_event_type {
    24		INBAND_TASK_SIGNAL,
    25		INBAND_TASK_MIGRATION,
    26		INBAND_TASK_EXIT,
    27		INBAND_TASK_RETUSER,
    28		INBAND_TASK_PTSTEP,
    29		INBAND_TASK_PTSTOP,
    30		INBAND_TASK_PTCONT,
    31		INBAND_PROCESS_CLEANUP,
    32	};
    33	
    34	struct dovetail_migration_data {
    35		struct task_struct *task;
    36		int dest_cpu;
    37	};
    38	
    39	struct dovetail_altsched_context {
    40		struct task_struct *task;
    41		struct mm_struct *active_mm;
    42		bool borrowed_mm;
    43	};
    44	
    45	#define protect_inband_mm(__flags)			\
    46		do {						\
    47			(__flags) = hard_cond_local_irq_save();	\
    48			barrier();				\
    49		} while (0)					\
    50	
    51	#define unprotect_inband_mm(__flags)			\
    52		do {						\
    53			barrier();				\
    54			hard_cond_local_irq_restore(__flags);	\
    55		} while (0)					\
    56	
    57	void inband_task_init(struct task_struct *p);
    58	
    59	int pipeline_syscall(unsigned int nr, struct pt_regs *regs);
    60	
    61	void __oob_trap_notify(unsigned int exception,
    62			       struct pt_regs *regs);
    63	
    64	static __always_inline void oob_trap_notify(unsigned int exception,
    65						struct pt_regs *regs)
    66	{
    67		if (running_oob() && !test_thread_local_flags(_TLF_OOBTRAP))
    68			__oob_trap_notify(exception, regs);
    69	}
    70	
    71	void __oob_trap_unwind(unsigned int exception,
    72			struct pt_regs *regs);
    73	
    74	static __always_inline void oob_trap_unwind(unsigned int exception,
    75						struct pt_regs *regs)
    76	{
    77		if (test_thread_local_flags(_TLF_OOBTRAP))
    78			__oob_trap_unwind(exception, regs);
    79	}
    80	
    81	void inband_event_notify(enum inband_event_type,
    82				 void *data);
    83	
    84	void inband_clock_was_set(void);
    85	
    86	static inline void inband_signal_notify(struct task_struct *p)
    87	{
    88		if (test_ti_local_flags(task_thread_info(p), _TLF_DOVETAIL))
    89			inband_event_notify(INBAND_TASK_SIGNAL, p);
    90	}
    91	
    92	static inline void inband_migration_notify(struct task_struct *p, int cpu)
    93	{
    94		if (test_ti_local_flags(task_thread_info(p), _TLF_DOVETAIL)) {
    95			struct dovetail_migration_data d = {
    96				.task = p,
    97				.dest_cpu = cpu,
    98			};
    99			inband_event_notify(INBAND_TASK_MIGRATION, &d);
   100		}
   101	}
   102	
   103	static inline void inband_exit_notify(void)
   104	{
   105		inband_event_notify(INBAND_TASK_EXIT, NULL);
   106	}
   107	
   108	static inline void inband_cleanup_notify(struct mm_struct *mm)
   109	{
   110		/*
   111		 * Notify regardless of _TLF_DOVETAIL: current may have
   112		 * resources to clean up although it might not be interested
   113		 * in other kernel events.
   114		 */
   115		inband_event_notify(INBAND_PROCESS_CLEANUP, mm);
   116	}
   117	
   118	static inline void inband_ptstop_notify(void)
   119	{
   120		if (test_thread_local_flags(_TLF_DOVETAIL))
   121			inband_event_notify(INBAND_TASK_PTSTOP, current);
   122	}
   123	
   124	static inline void inband_ptcont_notify(void)
   125	{
   126		if (test_thread_local_flags(_TLF_DOVETAIL))
   127			inband_event_notify(INBAND_TASK_PTCONT, current);
   128	}
   129	
   130	static inline void inband_ptstep_notify(struct task_struct *tracee)
   131	{
   132		if (test_ti_local_flags(task_thread_info(tracee), _TLF_DOVETAIL))
   133			inband_event_notify(INBAND_TASK_PTSTEP, tracee);
   134	}
   135	
   136	static inline
   137	void prepare_inband_switch(struct task_struct *next)
   138	{
   139		struct task_struct *prev = current;
   140	
   141		if (test_ti_local_flags(task_thread_info(next), _TLF_DOVETAIL))
   142			__this_cpu_write(irq_pipeline.rqlock_owner, prev);
   143	}
   144	
   145	void inband_retuser_notify(void);
   146	
   147	bool inband_switch_tail(void);
   148	
   149	void oob_trampoline(void);
   150	
   151	void arch_inband_task_init(struct task_struct *p);
   152	
   153	int dovetail_start(void);
   154	
   155	void dovetail_stop(void);
   156	
   157	void dovetail_init_altsched(struct dovetail_altsched_context *p);
   158	
   159	void dovetail_start_altsched(void);
   160	
   161	void dovetail_stop_altsched(void);
   162	
   163	__must_check int dovetail_leave_inband(void);
   164	
   165	static inline void dovetail_leave_oob(void)
   166	{
   167		clear_thread_local_flags(_TLF_OOB|_TLF_OFFSTAGE);
   168		clear_thread_flag(TIF_MAYDAY);
   169	}
   170	
   171	void dovetail_resume_inband(void);
   172	
   173	bool dovetail_context_switch(struct dovetail_altsched_context *out,
   174				struct dovetail_altsched_context *in,
   175				bool leave_inband);
   176	
   177	static inline
   178	struct oob_thread_state *dovetail_current_state(void)
   179	{
   180		return &current_thread_info()->oob_state;
   181	}
   182	
   183	static inline
   184	struct oob_thread_state *dovetail_task_state(struct task_struct *p)
   185	{
   186		return &task_thread_info(p)->oob_state;
   187	}
   188	
   189	static inline
   190	struct oob_mm_state *dovetail_mm_state(void)
   191	{
   192		if (current->flags & PF_KTHREAD)
   193			return NULL;
   194	
   195		return &current->mm->oob_state;
   196	}
   197	
   198	void dovetail_call_mayday(struct pt_regs *regs);
   199	
   200	static inline void dovetail_send_mayday(struct task_struct *castaway)
   201	{
   202		struct thread_info *ti = task_thread_info(castaway);
   203	
   204		if (test_ti_local_flags(ti, _TLF_DOVETAIL))
   205			set_ti_thread_flag(ti, TIF_MAYDAY);
   206	}
   207	
   208	static inline void dovetail_request_ucall(struct task_struct *task)
   209	{
   210		struct thread_info *ti = task_thread_info(task);
   211	
   212		if (test_ti_local_flags(ti, _TLF_DOVETAIL))
   213			set_ti_thread_flag(ti, TIF_RETUSER);
   214	}
   215	
   216	static inline void dovetail_clear_ucall(void)
   217	{
   218		if (test_thread_flag(TIF_RETUSER))
   219			clear_thread_flag(TIF_RETUSER);
   220	}
   221	
   222	void install_inband_fd(unsigned int fd, struct file *file,
   223			       struct files_struct *files);
   224	
   225	void uninstall_inband_fd(unsigned int fd, struct file *file,
   226				 struct files_struct *files);
   227	
   228	void replace_inband_fd(unsigned int fd, struct file *file,
   229			       struct files_struct *files);
   230	
   231	#else	/* !CONFIG_DOVETAIL */
   232	
   233	#ifdef CONFIG_HAVE_DOVETAIL
   234	/* We may have arch-specific placeholders. */
 > 235	#include <asm/dovetail.h>
   236	#endif
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
