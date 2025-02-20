Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09BE1E5734
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Feb 2025 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740037222; cv=none; b=ruH8uyNJsCsmswWoHZqi/z7OMl64gXG0fMo6weM0it+THKyD1q4MMlg/bldLr3wskrvCnoPqcGaB/FyJE4q3g6jX/clz+z2HClrCFiqwmqlePn1Wwe3sS1HGCSDt1VtLE9WJd/Ds6xFbO0Yi+Fpvz1tqMmpiLss72bbTlobXoVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740037222; c=relaxed/simple;
	bh=BZ2vZdAFBVy8rmGefRjpLFHkbWfDl3Sm3cKJkQLdYPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6XR7Rd28ztYI5MslMjazqnYolonEMuZYo1jUVx7WI0u4bmw4nXqGUJqIdJ4cOSQC0qaQ2ZDHUP6mHFJO3W7qvI23QJm9PV5+EcAMG9sOWCSpgkEW0+WgI8LSpE47DH8Pit5GmBEXN50bdDCOPXeNKs1rgYm4Q2tFhR/YuNkNvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEOvbzpx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEOvbzpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740037212; x=1771573212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BZ2vZdAFBVy8rmGefRjpLFHkbWfDl3Sm3cKJkQLdYPo=;
  b=lEOvbzpxjXbqJmgFktZWU5JO01ZotEQUHa4g8erAraDe8ThPa/eu9QE0
   tqlTVR9Xgk84mgzsSRNpm7an+/NyambcNWjnyxFgGejDti5YbSbEIAOfV
   Ab8Wj/Kd0VYlxV3wohl1E7AygRYcPgFiij5dPzQbSVwlWXxoMMvsfrryL
   ePFvn97isOGrOuT3T/Hg9sXCk637h1zi90d99rQfUcGy7E0DyuO2LhcyK
   D31p4tERCTOWZOMYH5auaeioA4vRwtcI4BRYzElowIEYVGJNwvueQYYhn
   Z4bNKzvNeClKhqz1kBpkDKjlqXoA11f7OBx/yucgE/D0s7o8PrUbrzIKb
   w==;
X-CSE-ConnectionGUID: uBMfQVSLQOqilYYYI3gyNA==
X-CSE-MsgGUID: zVUySGUOSfSvH1W6o9Rt4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="43633756"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="43633756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 23:40:10 -0800
X-CSE-ConnectionGUID: tsH8kiiYQDW7tVv/bDc9hg==
X-CSE-MsgGUID: N0yHtq0sR4uW3Mh3YtESNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="114912551"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Feb 2025 23:40:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl1A7-00040X-1J;
	Thu, 20 Feb 2025 07:40:01 +0000
Date: Thu, 20 Feb 2025 15:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jfern:scx/next 1/2] kernel/sched/build_policy.c: ext_idle.h is
 included more than once.
Message-ID: <202502201514.BKNfaKOy-lkp@intel.com>
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
TO: Joel Fernandes <joelagnelf@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git scx/next
head:   ddf1e7d252354f34509bf2186faf95cb7fb94652
commit: 03143e7a58f57dcd829b39dcdbe517712cdd7778 [1/2] config_enable_scx
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502201514.BKNfaKOy-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> kernel/sched/build_policy.c: ext_idle.h is included more than once.

vim +73 kernel/sched/build_policy.c

    63	
    64	/* SPDX-License-Identifier: GPL-2.0 */
    65	/*
    66	 * BPF extensible scheduler class: Documentation/scheduler/sched-ext.rst
    67	 *
    68	 * Copyright (c) 2022 Meta Platforms, Inc. and affiliates.
    69	 * Copyright (c) 2022 Tejun Heo <tj@kernel.org>
    70	 * Copyright (c) 2022 David Vernet <dvernet@meta.com>
    71	 */
    72	#include <linux/btf_ids.h>
  > 73	#include "ext_idle.h"
    74	
    75	#define SCX_OP_IDX(op)		(offsetof(struct sched_ext_ops, op) / sizeof(void (*)(void)))
    76	
    77	enum scx_consts {
    78		SCX_DSP_DFL_MAX_BATCH		= 32,
    79		SCX_DSP_MAX_LOOPS		= 32,
    80		SCX_WATCHDOG_MAX_TIMEOUT	= 30 * HZ,
    81	
    82		SCX_EXIT_BT_LEN			= 64,
    83		SCX_EXIT_MSG_LEN		= 1024,
    84		SCX_EXIT_DUMP_DFL_LEN		= 32768,
    85	
    86		SCX_CPUPERF_ONE			= SCHED_CAPACITY_SCALE,
    87	
    88		/*
    89		 * Iterating all tasks may take a while. Periodically drop
    90		 * scx_tasks_lock to avoid causing e.g. CSD and RCU stalls.
    91		 */
    92		SCX_OPS_TASK_ITER_BATCH		= 32,
    93	};
    94	
    95	enum scx_exit_kind {
    96		SCX_EXIT_NONE,
    97		SCX_EXIT_DONE,
    98	
    99		SCX_EXIT_UNREG = 64,	/* user-space initiated unregistration */
   100		SCX_EXIT_UNREG_BPF,	/* BPF-initiated unregistration */
   101		SCX_EXIT_UNREG_KERN,	/* kernel-initiated unregistration */
   102		SCX_EXIT_SYSRQ,		/* requested by 'S' sysrq */
   103	
   104		SCX_EXIT_ERROR = 1024,	/* runtime error, error msg contains details */
   105		SCX_EXIT_ERROR_BPF,	/* ERROR but triggered through scx_bpf_error() */
   106		SCX_EXIT_ERROR_STALL,	/* watchdog detected stalled runnable tasks */
   107	};
   108	
   109	/*
   110	 * An exit code can be specified when exiting with scx_bpf_exit() or
   111	 * scx_ops_exit(), corresponding to exit_kind UNREG_BPF and UNREG_KERN
   112	 * respectively. The codes are 64bit of the format:
   113	 *
   114	 *   Bits: [63  ..  48 47   ..  32 31 .. 0]
   115	 *         [ SYS ACT ] [ SYS RSN ] [ USR  ]
   116	 *
   117	 *   SYS ACT: System-defined exit actions
   118	 *   SYS RSN: System-defined exit reasons
   119	 *   USR    : User-defined exit codes and reasons
   120	 *
   121	 * Using the above, users may communicate intention and context by ORing system
   122	 * actions and/or system reasons with a user-defined exit code.
   123	 */
   124	enum scx_exit_code {
   125		/* Reasons */
   126		SCX_ECODE_RSN_HOTPLUG	= 1LLU << 32,
   127	
   128		/* Actions */
   129		SCX_ECODE_ACT_RESTART	= 1LLU << 48,
   130	};
   131	
   132	/*
   133	 * scx_exit_info is passed to ops.exit() to describe why the BPF scheduler is
   134	 * being disabled.
   135	 */
   136	struct scx_exit_info {
   137		/* %SCX_EXIT_* - broad category of the exit reason */
   138		enum scx_exit_kind	kind;
   139	
   140		/* exit code if gracefully exiting */
   141		s64			exit_code;
   142	
   143		/* textual representation of the above */
   144		const char		*reason;
   145	
   146		/* backtrace if exiting due to an error */
   147		unsigned long		*bt;
   148		u32			bt_len;
   149	
   150		/* informational message */
   151		char			*msg;
   152	
   153		/* debug dump */
   154		char			*dump;
   155	};
   156	
   157	/* sched_ext_ops.flags */
   158	enum scx_ops_flags {
   159		/*
   160		 * Keep built-in idle tracking even if ops.update_idle() is implemented.
   161		 */
   162		SCX_OPS_KEEP_BUILTIN_IDLE	= 1LLU << 0,
   163	
   164		/*
   165		 * By default, if there are no other task to run on the CPU, ext core
   166		 * keeps running the current task even after its slice expires. If this
   167		 * flag is specified, such tasks are passed to ops.enqueue() with
   168		 * %SCX_ENQ_LAST. See the comment above %SCX_ENQ_LAST for more info.
   169		 */
   170		SCX_OPS_ENQ_LAST		= 1LLU << 1,
   171	
   172		/*
   173		 * An exiting task may schedule after PF_EXITING is set. In such cases,
   174		 * bpf_task_from_pid() may not be able to find the task and if the BPF
   175		 * scheduler depends on pid lookup for dispatching, the task will be
   176		 * lost leading to various issues including RCU grace period stalls.
   177		 *
   178		 * To mask this problem, by default, unhashed tasks are automatically
   179		 * dispatched to the local DSQ on enqueue. If the BPF scheduler doesn't
   180		 * depend on pid lookups and wants to handle these tasks directly, the
   181		 * following flag can be used.
   182		 */
   183		SCX_OPS_ENQ_EXITING		= 1LLU << 2,
   184	
   185		/*
   186		 * If set, only tasks with policy set to SCHED_EXT are attached to
   187		 * sched_ext. If clear, SCHED_NORMAL tasks are also included.
   188		 */
   189		SCX_OPS_SWITCH_PARTIAL		= 1LLU << 3,
   190	
   191		/*
   192		 * A migration disabled task can only execute on its current CPU. By
   193		 * default, such tasks are automatically put on the CPU's local DSQ with
   194		 * the default slice on enqueue. If this ops flag is set, they also go
   195		 * through ops.enqueue().
   196		 *
   197		 * A migration disabled task never invokes ops.select_cpu() as it can
   198		 * only select the current CPU. Also, p->cpus_ptr will only contain its
   199		 * current CPU while p->nr_cpus_allowed keeps tracking p->user_cpus_ptr
   200		 * and thus may disagree with cpumask_weight(p->cpus_ptr).
   201		 */
   202		SCX_OPS_ENQ_MIGRATION_DISABLED	= 1LLU << 4,
   203	
   204		/*
   205		 * Queued wakeup (ttwu_queue) is a wakeup optimization that invokes
   206		 * ops.enqueue() on the ops.select_cpu() selected or the wakee's
   207		 * previous CPU via IPI (inter-processor interrupt) to reduce cacheline
   208		 * transfers. When this optimization is enabled, ops.select_cpu() is
   209		 * skipped in some cases (when racing against the wakee switching out).
   210		 * As the BPF scheduler may depend on ops.select_cpu() being invoked
   211		 * during wakeups, queued wakeup is disabled by default.
   212		 *
   213		 * If this ops flag is set, queued wakeup optimization is enabled and
   214		 * the BPF scheduler must be able to handle ops.enqueue() invoked on the
   215		 * wakee's CPU without preceding ops.select_cpu() even for tasks which
   216		 * may be executed on multiple CPUs.
   217		 */
   218		SCX_OPS_ALLOW_QUEUED_WAKEUP	= 1LLU << 5,
   219	
   220		/*
   221		 * If set, enable per-node idle cpumasks. If clear, use a single global
   222		 * flat idle cpumask.
   223		 */
   224		SCX_OPS_BUILTIN_IDLE_PER_NODE	= 1LLU << 6,
   225	
   226		/*
   227		 * CPU cgroup support flags
   228		 */
   229		SCX_OPS_HAS_CGROUP_WEIGHT = 1LLU << 16,	/* cpu.weight */
   230	
   231		SCX_OPS_ALL_FLAGS	= SCX_OPS_KEEP_BUILTIN_IDLE |
   232					  SCX_OPS_ENQ_LAST |
   233					  SCX_OPS_ENQ_EXITING |
   234					  SCX_OPS_ENQ_MIGRATION_DISABLED |
   235					  SCX_OPS_ALLOW_QUEUED_WAKEUP |
   236					  SCX_OPS_SWITCH_PARTIAL |
   237					  SCX_OPS_BUILTIN_IDLE_PER_NODE |
   238					  SCX_OPS_HAS_CGROUP_WEIGHT,
   239	};
   240	
   241	/* argument container for ops.init_task() */
   242	struct scx_init_task_args {
   243		/*
   244		 * Set if ops.init_task() is being invoked on the fork path, as opposed
   245		 * to the scheduler transition path.
   246		 */
   247		bool			fork;
   248	#ifdef CONFIG_EXT_GROUP_SCHED
   249		/* the cgroup the task is joining */
   250		struct cgroup		*cgroup;
   251	#endif
   252	};
   253	
   254	/* argument container for ops.exit_task() */
   255	struct scx_exit_task_args {
   256		/* Whether the task exited before running on sched_ext. */
   257		bool cancelled;
   258	};
   259	
   260	/* argument container for ops->cgroup_init() */
   261	struct scx_cgroup_init_args {
   262		/* the weight of the cgroup [1..10000] */
   263		u32			weight;
   264	};
   265	
   266	enum scx_cpu_preempt_reason {
   267		/* next task is being scheduled by &sched_class_rt */
   268		SCX_CPU_PREEMPT_RT,
   269		/* next task is being scheduled by &sched_class_dl */
   270		SCX_CPU_PREEMPT_DL,
   271		/* next task is being scheduled by &sched_class_stop */
   272		SCX_CPU_PREEMPT_STOP,
   273		/* unknown reason for SCX being preempted */
   274		SCX_CPU_PREEMPT_UNKNOWN,
   275	};
   276	
   277	/*
   278	 * Argument container for ops->cpu_acquire(). Currently empty, but may be
   279	 * expanded in the future.
   280	 */
   281	struct scx_cpu_acquire_args {};
   282	
   283	/* argument container for ops->cpu_release() */
   284	struct scx_cpu_release_args {
   285		/* the reason the CPU was preempted */
   286		enum scx_cpu_preempt_reason reason;
   287	
   288		/* the task that's going to be scheduled on the CPU */
   289		struct task_struct	*task;
   290	};
   291	
   292	/*
   293	 * Informational context provided to dump operations.
   294	 */
   295	struct scx_dump_ctx {
   296		enum scx_exit_kind	kind;
   297		s64			exit_code;
   298		const char		*reason;
   299		u64			at_ns;
   300		u64			at_jiffies;
   301	};
   302	
   303	/**
   304	 * struct sched_ext_ops - Operation table for BPF scheduler implementation
   305	 *
   306	 * A BPF scheduler can implement an arbitrary scheduling policy by
   307	 * implementing and loading operations in this table. Note that a userland
   308	 * scheduling policy can also be implemented using the BPF scheduler
   309	 * as a shim layer.
   310	 */
   311	struct sched_ext_ops {
   312		/**
   313		 * @select_cpu: Pick the target CPU for a task which is being woken up
   314		 * @p: task being woken up
   315		 * @prev_cpu: the cpu @p was on before sleeping
   316		 * @wake_flags: SCX_WAKE_*
   317		 *
   318		 * Decision made here isn't final. @p may be moved to any CPU while it
   319		 * is getting dispatched for execution later. However, as @p is not on
   320		 * the rq at this point, getting the eventual execution CPU right here
   321		 * saves a small bit of overhead down the line.
   322		 *
   323		 * If an idle CPU is returned, the CPU is kicked and will try to
   324		 * dispatch. While an explicit custom mechanism can be added,
   325		 * select_cpu() serves as the default way to wake up idle CPUs.
   326		 *
   327		 * @p may be inserted into a DSQ directly by calling
   328		 * scx_bpf_dsq_insert(). If so, the ops.enqueue() will be skipped.
   329		 * Directly inserting into %SCX_DSQ_LOCAL will put @p in the local DSQ
   330		 * of the CPU returned by this operation.
   331		 *
   332		 * Note that select_cpu() is never called for tasks that can only run
   333		 * on a single CPU or tasks with migration disabled, as they don't have
   334		 * the option to select a different CPU. See select_task_rq() for
   335		 * details.
   336		 */
   337		s32 (*select_cpu)(struct task_struct *p, s32 prev_cpu, u64 wake_flags);
   338	
   339		/**
   340		 * @enqueue: Enqueue a task on the BPF scheduler
   341		 * @p: task being enqueued
   342		 * @enq_flags: %SCX_ENQ_*
   343		 *
   344		 * @p is ready to run. Insert directly into a DSQ by calling
   345		 * scx_bpf_dsq_insert() or enqueue on the BPF scheduler. If not directly
   346		 * inserted, the bpf scheduler owns @p and if it fails to dispatch @p,
   347		 * the task will stall.
   348		 *
   349		 * If @p was inserted into a DSQ from ops.select_cpu(), this callback is
   350		 * skipped.
   351		 */
   352		void (*enqueue)(struct task_struct *p, u64 enq_flags);
   353	
   354		/**
   355		 * @dequeue: Remove a task from the BPF scheduler
   356		 * @p: task being dequeued
   357		 * @deq_flags: %SCX_DEQ_*
   358		 *
   359		 * Remove @p from the BPF scheduler. This is usually called to isolate
   360		 * the task while updating its scheduling properties (e.g. priority).
   361		 *
   362		 * The ext core keeps track of whether the BPF side owns a given task or
   363		 * not and can gracefully ignore spurious dispatches from BPF side,
   364		 * which makes it safe to not implement this method. However, depending
   365		 * on the scheduling logic, this can lead to confusing behaviors - e.g.
   366		 * scheduling position not being updated across a priority change.
   367		 */
   368		void (*dequeue)(struct task_struct *p, u64 deq_flags);
   369	
   370		/**
   371		 * @dispatch: Dispatch tasks from the BPF scheduler and/or user DSQs
   372		 * @cpu: CPU to dispatch tasks for
   373		 * @prev: previous task being switched out
   374		 *
   375		 * Called when a CPU's local dsq is empty. The operation should dispatch
   376		 * one or more tasks from the BPF scheduler into the DSQs using
   377		 * scx_bpf_dsq_insert() and/or move from user DSQs into the local DSQ
   378		 * using scx_bpf_dsq_move_to_local().
   379		 *
   380		 * The maximum number of times scx_bpf_dsq_insert() can be called
   381		 * without an intervening scx_bpf_dsq_move_to_local() is specified by
   382		 * ops.dispatch_max_batch. See the comments on top of the two functions
   383		 * for more details.
   384		 *
   385		 * When not %NULL, @prev is an SCX task with its slice depleted. If
   386		 * @prev is still runnable as indicated by set %SCX_TASK_QUEUED in
   387		 * @prev->scx.flags, it is not enqueued yet and will be enqueued after
   388		 * ops.dispatch() returns. To keep executing @prev, return without
   389		 * dispatching or moving any tasks. Also see %SCX_OPS_ENQ_LAST.
   390		 */
   391		void (*dispatch)(s32 cpu, struct task_struct *prev);
   392	
   393		/**
   394		 * @tick: Periodic tick
   395		 * @p: task running currently
   396		 *
   397		 * This operation is called every 1/HZ seconds on CPUs which are
   398		 * executing an SCX task. Setting @p->scx.slice to 0 will trigger an
   399		 * immediate dispatch cycle on the CPU.
   400		 */
   401		void (*tick)(struct task_struct *p);
   402	
   403		/**
   404		 * @runnable: A task is becoming runnable on its associated CPU
   405		 * @p: task becoming runnable
   406		 * @enq_flags: %SCX_ENQ_*
   407		 *
   408		 * This and the following three functions can be used to track a task's
   409		 * execution state transitions. A task becomes ->runnable() on a CPU,
   410		 * and then goes through one or more ->running() and ->stopping() pairs
   411		 * as it runs on the CPU, and eventually becomes ->quiescent() when it's
   412		 * done running on the CPU.
   413		 *
   414		 * @p is becoming runnable on the CPU because it's
   415		 *
   416		 * - waking up (%SCX_ENQ_WAKEUP)
   417		 * - being moved from another CPU
   418		 * - being restored after temporarily taken off the queue for an
   419		 *   attribute change.
   420		 *
   421		 * This and ->enqueue() are related but not coupled. This operation
   422		 * notifies @p's state transition and may not be followed by ->enqueue()
   423		 * e.g. when @p is being dispatched to a remote CPU, or when @p is
   424		 * being enqueued on a CPU experiencing a hotplug event. Likewise, a
   425		 * task may be ->enqueue()'d without being preceded by this operation
   426		 * e.g. after exhausting its slice.
   427		 */
   428		void (*runnable)(struct task_struct *p, u64 enq_flags);
   429	
   430		/**
   431		 * @running: A task is starting to run on its associated CPU
   432		 * @p: task starting to run
   433		 *
   434		 * See ->runnable() for explanation on the task state notifiers.
   435		 */
   436		void (*running)(struct task_struct *p);
   437	
   438		/**
   439		 * @stopping: A task is stopping execution
   440		 * @p: task stopping to run
   441		 * @runnable: is task @p still runnable?
   442		 *
   443		 * See ->runnable() for explanation on the task state notifiers. If
   444		 * !@runnable, ->quiescent() will be invoked after this operation
   445		 * returns.
   446		 */
   447		void (*stopping)(struct task_struct *p, bool runnable);
   448	
   449		/**
   450		 * @quiescent: A task is becoming not runnable on its associated CPU
   451		 * @p: task becoming not runnable
   452		 * @deq_flags: %SCX_DEQ_*
   453		 *
   454		 * See ->runnable() for explanation on the task state notifiers.
   455		 *
   456		 * @p is becoming quiescent on the CPU because it's
   457		 *
   458		 * - sleeping (%SCX_DEQ_SLEEP)
   459		 * - being moved to another CPU
   460		 * - being temporarily taken off the queue for an attribute change
   461		 *   (%SCX_DEQ_SAVE)
   462		 *
   463		 * This and ->dequeue() are related but not coupled. This operation
   464		 * notifies @p's state transition and may not be preceded by ->dequeue()
   465		 * e.g. when @p is being dispatched to a remote CPU.
   466		 */
   467		void (*quiescent)(struct task_struct *p, u64 deq_flags);
   468	
   469		/**
   470		 * @yield: Yield CPU
   471		 * @from: yielding task
   472		 * @to: optional yield target task
   473		 *
   474		 * If @to is NULL, @from is yielding the CPU to other runnable tasks.
   475		 * The BPF scheduler should ensure that other available tasks are
   476		 * dispatched before the yielding task. Return value is ignored in this
   477		 * case.
   478		 *
   479		 * If @to is not-NULL, @from wants to yield the CPU to @to. If the bpf
   480		 * scheduler can implement the request, return %true; otherwise, %false.
   481		 */
   482		bool (*yield)(struct task_struct *from, struct task_struct *to);
   483	
   484		/**
   485		 * @core_sched_before: Task ordering for core-sched
   486		 * @a: task A
   487		 * @b: task B
   488		 *
   489		 * Used by core-sched to determine the ordering between two tasks. See
   490		 * Documentation/admin-guide/hw-vuln/core-scheduling.rst for details on
   491		 * core-sched.
   492		 *
   493		 * Both @a and @b are runnable and may or may not currently be queued on
   494		 * the BPF scheduler. Should return %true if @a should run before @b.
   495		 * %false if there's no required ordering or @b should run before @a.
   496		 *
   497		 * If not specified, the default is ordering them according to when they
   498		 * became runnable.
   499		 */
   500		bool (*core_sched_before)(struct task_struct *a, struct task_struct *b);
   501	
   502		/**
   503		 * @set_weight: Set task weight
   504		 * @p: task to set weight for
   505		 * @weight: new weight [1..10000]
   506		 *
   507		 * Update @p's weight to @weight.
   508		 */
   509		void (*set_weight)(struct task_struct *p, u32 weight);
   510	
   511		/**
   512		 * @set_cpumask: Set CPU affinity
   513		 * @p: task to set CPU affinity for
   514		 * @cpumask: cpumask of cpus that @p can run on
   515		 *
   516		 * Update @p's CPU affinity to @cpumask.
   517		 */
   518		void (*set_cpumask)(struct task_struct *p,
   519				    const struct cpumask *cpumask);
   520	
   521		/**
   522		 * @update_idle: Update the idle state of a CPU
   523		 * @cpu: CPU to update the idle state for
   524		 * @idle: whether entering or exiting the idle state
   525		 *
   526		 * This operation is called when @rq's CPU goes or leaves the idle
   527		 * state. By default, implementing this operation disables the built-in
   528		 * idle CPU tracking and the following helpers become unavailable:
   529		 *
   530		 * - scx_bpf_select_cpu_dfl()
   531		 * - scx_bpf_test_and_clear_cpu_idle()
   532		 * - scx_bpf_pick_idle_cpu()
   533		 *
   534		 * The user also must implement ops.select_cpu() as the default
   535		 * implementation relies on scx_bpf_select_cpu_dfl().
   536		 *
   537		 * Specify the %SCX_OPS_KEEP_BUILTIN_IDLE flag to keep the built-in idle
   538		 * tracking.
   539		 */
   540		void (*update_idle)(s32 cpu, bool idle);
   541	
   542		/**
   543		 * @cpu_acquire: A CPU is becoming available to the BPF scheduler
   544		 * @cpu: The CPU being acquired by the BPF scheduler.
   545		 * @args: Acquire arguments, see the struct definition.
   546		 *
   547		 * A CPU that was previously released from the BPF scheduler is now once
   548		 * again under its control.
   549		 */
   550		void (*cpu_acquire)(s32 cpu, struct scx_cpu_acquire_args *args);
   551	
   552		/**
   553		 * @cpu_release: A CPU is taken away from the BPF scheduler
   554		 * @cpu: The CPU being released by the BPF scheduler.
   555		 * @args: Release arguments, see the struct definition.
   556		 *
   557		 * The specified CPU is no longer under the control of the BPF
   558		 * scheduler. This could be because it was preempted by a higher
   559		 * priority sched_class, though there may be other reasons as well. The
   560		 * caller should consult @args->reason to determine the cause.
   561		 */
   562		void (*cpu_release)(s32 cpu, struct scx_cpu_release_args *args);
   563	
   564		/**
   565		 * @init_task: Initialize a task to run in a BPF scheduler
   566		 * @p: task to initialize for BPF scheduling
   567		 * @args: init arguments, see the struct definition
   568		 *
   569		 * Either we're loading a BPF scheduler or a new task is being forked.
   570		 * Initialize @p for BPF scheduling. This operation may block and can
   571		 * be used for allocations, and is called exactly once for a task.
   572		 *
   573		 * Return 0 for success, -errno for failure. An error return while
   574		 * loading will abort loading of the BPF scheduler. During a fork, it
   575		 * will abort that specific fork.
   576		 */
   577		s32 (*init_task)(struct task_struct *p, struct scx_init_task_args *args);
   578	
   579		/**
   580		 * @exit_task: Exit a previously-running task from the system
   581		 * @p: task to exit
   582		 * @args: exit arguments, see the struct definition
   583		 *
   584		 * @p is exiting or the BPF scheduler is being unloaded. Perform any
   585		 * necessary cleanup for @p.
   586		 */
   587		void (*exit_task)(struct task_struct *p, struct scx_exit_task_args *args);
   588	
   589		/**
   590		 * @enable: Enable BPF scheduling for a task
   591		 * @p: task to enable BPF scheduling for
   592		 *
   593		 * Enable @p for BPF scheduling. enable() is called on @p any time it
   594		 * enters SCX, and is always paired with a matching disable().
   595		 */
   596		void (*enable)(struct task_struct *p);
   597	
   598		/**
   599		 * @disable: Disable BPF scheduling for a task
   600		 * @p: task to disable BPF scheduling for
   601		 *
   602		 * @p is exiting, leaving SCX or the BPF scheduler is being unloaded.
   603		 * Disable BPF scheduling for @p. A disable() call is always matched
   604		 * with a prior enable() call.
   605		 */
   606		void (*disable)(struct task_struct *p);
   607	
   608		/**
   609		 * @dump: Dump BPF scheduler state on error
   610		 * @ctx: debug dump context
   611		 *
   612		 * Use scx_bpf_dump() to generate BPF scheduler specific debug dump.
   613		 */
   614		void (*dump)(struct scx_dump_ctx *ctx);
   615	
   616		/**
   617		 * @dump_cpu: Dump BPF scheduler state for a CPU on error
   618		 * @ctx: debug dump context
   619		 * @cpu: CPU to generate debug dump for
   620		 * @idle: @cpu is currently idle without any runnable tasks
   621		 *
   622		 * Use scx_bpf_dump() to generate BPF scheduler specific debug dump for
   623		 * @cpu. If @idle is %true and this operation doesn't produce any
   624		 * output, @cpu is skipped for dump.
   625		 */
   626		void (*dump_cpu)(struct scx_dump_ctx *ctx, s32 cpu, bool idle);
   627	
   628		/**
   629		 * @dump_task: Dump BPF scheduler state for a runnable task on error
   630		 * @ctx: debug dump context
   631		 * @p: runnable task to generate debug dump for
   632		 *
   633		 * Use scx_bpf_dump() to generate BPF scheduler specific debug dump for
   634		 * @p.
   635		 */
   636		void (*dump_task)(struct scx_dump_ctx *ctx, struct task_struct *p);
   637	
   638	#ifdef CONFIG_EXT_GROUP_SCHED
   639		/**
   640		 * @cgroup_init: Initialize a cgroup
   641		 * @cgrp: cgroup being initialized
   642		 * @args: init arguments, see the struct definition
   643		 *
   644		 * Either the BPF scheduler is being loaded or @cgrp created, initialize
   645		 * @cgrp for sched_ext. This operation may block.
   646		 *
   647		 * Return 0 for success, -errno for failure. An error return while
   648		 * loading will abort loading of the BPF scheduler. During cgroup
   649		 * creation, it will abort the specific cgroup creation.
   650		 */
   651		s32 (*cgroup_init)(struct cgroup *cgrp,
   652				   struct scx_cgroup_init_args *args);
   653	
   654		/**
   655		 * @cgroup_exit: Exit a cgroup
   656		 * @cgrp: cgroup being exited
   657		 *
   658		 * Either the BPF scheduler is being unloaded or @cgrp destroyed, exit
   659		 * @cgrp for sched_ext. This operation my block.
   660		 */
   661		void (*cgroup_exit)(struct cgroup *cgrp);
   662	
   663		/**
   664		 * @cgroup_prep_move: Prepare a task to be moved to a different cgroup
   665		 * @p: task being moved
   666		 * @from: cgroup @p is being moved from
   667		 * @to: cgroup @p is being moved to
   668		 *
   669		 * Prepare @p for move from cgroup @from to @to. This operation may
   670		 * block and can be used for allocations.
   671		 *
   672		 * Return 0 for success, -errno for failure. An error return aborts the
   673		 * migration.
   674		 */
   675		s32 (*cgroup_prep_move)(struct task_struct *p,
   676					struct cgroup *from, struct cgroup *to);
   677	
   678		/**
   679		 * @cgroup_move: Commit cgroup move
   680		 * @p: task being moved
   681		 * @from: cgroup @p is being moved from
   682		 * @to: cgroup @p is being moved to
   683		 *
   684		 * Commit the move. @p is dequeued during this operation.
   685		 */
   686		void (*cgroup_move)(struct task_struct *p,
   687				    struct cgroup *from, struct cgroup *to);
   688	
   689		/**
   690		 * @cgroup_cancel_move: Cancel cgroup move
   691		 * @p: task whose cgroup move is being canceled
   692		 * @from: cgroup @p was being moved from
   693		 * @to: cgroup @p was being moved to
   694		 *
   695		 * @p was cgroup_prep_move()'d but failed before reaching cgroup_move().
   696		 * Undo the preparation.
   697		 */
   698		void (*cgroup_cancel_move)(struct task_struct *p,
   699					   struct cgroup *from, struct cgroup *to);
   700	
   701		/**
   702		 * @cgroup_set_weight: A cgroup's weight is being changed
   703		 * @cgrp: cgroup whose weight is being updated
   704		 * @weight: new weight [1..10000]
   705		 *
   706		 * Update @tg's weight to @weight.
   707		 */
   708		void (*cgroup_set_weight)(struct cgroup *cgrp, u32 weight);
   709	#endif	/* CONFIG_EXT_GROUP_SCHED */
   710	
   711		/*
   712		 * All online ops must come before ops.cpu_online().
   713		 */
   714	
   715		/**
   716		 * @cpu_online: A CPU became online
   717		 * @cpu: CPU which just came up
   718		 *
   719		 * @cpu just came online. @cpu will not call ops.enqueue() or
   720		 * ops.dispatch(), nor run tasks associated with other CPUs beforehand.
   721		 */
   722		void (*cpu_online)(s32 cpu);
   723	
   724		/**
   725		 * @cpu_offline: A CPU is going offline
   726		 * @cpu: CPU which is going offline
   727		 *
   728		 * @cpu is going offline. @cpu will not call ops.enqueue() or
   729		 * ops.dispatch(), nor run tasks associated with other CPUs afterwards.
   730		 */
   731		void (*cpu_offline)(s32 cpu);
   732	
   733		/*
   734		 * All CPU hotplug ops must come before ops.init().
   735		 */
   736	
   737		/**
   738		 * @init: Initialize the BPF scheduler
   739		 */
   740		s32 (*init)(void);
   741	
   742		/**
   743		 * @exit: Clean up after the BPF scheduler
   744		 * @info: Exit info
   745		 *
   746		 * ops.exit() is also called on ops.init() failure, which is a bit
   747		 * unusual. This is to allow rich reporting through @info on how
   748		 * ops.init() failed.
   749		 */
   750		void (*exit)(struct scx_exit_info *info);
   751	
   752		/**
   753		 * @dispatch_max_batch: Max nr of tasks that dispatch() can dispatch
   754		 */
   755		u32 dispatch_max_batch;
   756	
   757		/**
   758		 * @flags: %SCX_OPS_* flags
   759		 */
   760		u64 flags;
   761	
   762		/**
   763		 * @timeout_ms: The maximum amount of time, in milliseconds, that a
   764		 * runnable task should be able to wait before being scheduled. The
   765		 * maximum timeout may not exceed the default timeout of 30 seconds.
   766		 *
   767		 * Defaults to the maximum allowed timeout value of 30 seconds.
   768		 */
   769		u32 timeout_ms;
   770	
   771		/**
   772		 * @exit_dump_len: scx_exit_info.dump buffer length. If 0, the default
   773		 * value of 32768 is used.
   774		 */
   775		u32 exit_dump_len;
   776	
   777		/**
   778		 * @hotplug_seq: A sequence number that may be set by the scheduler to
   779		 * detect when a hotplug event has occurred during the loading process.
   780		 * If 0, no detection occurs. Otherwise, the scheduler will fail to
   781		 * load if the sequence number does not match @scx_hotplug_seq on the
   782		 * enable path.
   783		 */
   784		u64 hotplug_seq;
   785	
   786		/**
   787		 * @name: BPF scheduler's name
   788		 *
   789		 * Must be a non-zero valid BPF object name including only isalnum(),
   790		 * '_' and '.' chars. Shows up in kernel.sched_ext_ops sysctl while the
   791		 * BPF scheduler is enabled.
   792		 */
   793		char name[SCX_OPS_NAME_LEN];
   794	};
   795	
   796	enum scx_opi {
   797		SCX_OPI_BEGIN			= 0,
   798		SCX_OPI_NORMAL_BEGIN		= 0,
   799		SCX_OPI_NORMAL_END		= SCX_OP_IDX(cpu_online),
   800		SCX_OPI_CPU_HOTPLUG_BEGIN	= SCX_OP_IDX(cpu_online),
   801		SCX_OPI_CPU_HOTPLUG_END		= SCX_OP_IDX(init),
   802		SCX_OPI_END			= SCX_OP_IDX(init),
   803	};
   804	
   805	enum scx_wake_flags {
   806		/* expose select WF_* flags as enums */
   807		SCX_WAKE_FORK		= WF_FORK,
   808		SCX_WAKE_TTWU		= WF_TTWU,
   809		SCX_WAKE_SYNC		= WF_SYNC,
   810	};
   811	
   812	enum scx_enq_flags {
   813		/* expose select ENQUEUE_* flags as enums */
   814		SCX_ENQ_WAKEUP		= ENQUEUE_WAKEUP,
   815		SCX_ENQ_HEAD		= ENQUEUE_HEAD,
   816		SCX_ENQ_CPU_SELECTED	= ENQUEUE_RQ_SELECTED,
   817	
   818		/* high 32bits are SCX specific */
   819	
   820		/*
   821		 * Set the following to trigger preemption when calling
   822		 * scx_bpf_dsq_insert() with a local dsq as the target. The slice of the
   823		 * current task is cleared to zero and the CPU is kicked into the
   824		 * scheduling path. Implies %SCX_ENQ_HEAD.
   825		 */
   826		SCX_ENQ_PREEMPT		= 1LLU << 32,
   827	
   828		/*
   829		 * The task being enqueued was previously enqueued on the current CPU's
   830		 * %SCX_DSQ_LOCAL, but was removed from it in a call to the
   831		 * bpf_scx_reenqueue_local() kfunc. If bpf_scx_reenqueue_local() was
   832		 * invoked in a ->cpu_release() callback, and the task is again
   833		 * dispatched back to %SCX_LOCAL_DSQ by this current ->enqueue(), the
   834		 * task will not be scheduled on the CPU until at least the next invocation
   835		 * of the ->cpu_acquire() callback.
   836		 */
   837		SCX_ENQ_REENQ		= 1LLU << 40,
   838	
   839		/*
   840		 * The task being enqueued is the only task available for the cpu. By
   841		 * default, ext core keeps executing such tasks but when
   842		 * %SCX_OPS_ENQ_LAST is specified, they're ops.enqueue()'d with the
   843		 * %SCX_ENQ_LAST flag set.
   844		 *
   845		 * The BPF scheduler is responsible for triggering a follow-up
   846		 * scheduling event. Otherwise, Execution may stall.
   847		 */
   848		SCX_ENQ_LAST		= 1LLU << 41,
   849	
   850		/* high 8 bits are internal */
   851		__SCX_ENQ_INTERNAL_MASK	= 0xffLLU << 56,
   852	
   853		SCX_ENQ_CLEAR_OPSS	= 1LLU << 56,
   854		SCX_ENQ_DSQ_PRIQ	= 1LLU << 57,
   855	};
   856	
   857	enum scx_deq_flags {
   858		/* expose select DEQUEUE_* flags as enums */
   859		SCX_DEQ_SLEEP		= DEQUEUE_SLEEP,
   860	
   861		/* high 32bits are SCX specific */
   862	
   863		/*
   864		 * The generic core-sched layer decided to execute the task even though
   865		 * it hasn't been dispatched yet. Dequeue from the BPF side.
   866		 */
   867		SCX_DEQ_CORE_SCHED_EXEC	= 1LLU << 32,
   868	};
   869	
   870	enum scx_pick_idle_cpu_flags {
   871		SCX_PICK_IDLE_CORE	= 1LLU << 0,	/* pick a CPU whose SMT siblings are also idle */
   872		SCX_PICK_IDLE_IN_NODE	= 1LLU << 1,	/* pick a CPU in the same target NUMA node */
   873	};
   874	
   875	enum scx_kick_flags {
   876		/*
   877		 * Kick the target CPU if idle. Guarantees that the target CPU goes
   878		 * through at least one full scheduling cycle before going idle. If the
   879		 * target CPU can be determined to be currently not idle and going to go
   880		 * through a scheduling cycle before going idle, noop.
   881		 */
   882		SCX_KICK_IDLE		= 1LLU << 0,
   883	
   884		/*
   885		 * Preempt the current task and execute the dispatch path. If the
   886		 * current task of the target CPU is an SCX task, its ->scx.slice is
   887		 * cleared to zero before the scheduling path is invoked so that the
   888		 * task expires and the dispatch path is invoked.
   889		 */
   890		SCX_KICK_PREEMPT	= 1LLU << 1,
   891	
   892		/*
   893		 * Wait for the CPU to be rescheduled. The scx_bpf_kick_cpu() call will
   894		 * return after the target CPU finishes picking the next task.
   895		 */
   896		SCX_KICK_WAIT		= 1LLU << 2,
   897	};
   898	
   899	enum scx_tg_flags {
   900		SCX_TG_ONLINE		= 1U << 0,
   901		SCX_TG_INITED		= 1U << 1,
   902	};
   903	
   904	enum scx_ops_enable_state {
   905		SCX_OPS_ENABLING,
   906		SCX_OPS_ENABLED,
   907		SCX_OPS_DISABLING,
   908		SCX_OPS_DISABLED,
   909	};
   910	
   911	static const char *scx_ops_enable_state_str[] = {
   912		[SCX_OPS_ENABLING]	= "enabling",
   913		[SCX_OPS_ENABLED]	= "enabled",
   914		[SCX_OPS_DISABLING]	= "disabling",
   915		[SCX_OPS_DISABLED]	= "disabled",
   916	};
   917	
   918	/*
   919	 * sched_ext_entity->ops_state
   920	 *
   921	 * Used to track the task ownership between the SCX core and the BPF scheduler.
   922	 * State transitions look as follows:
   923	 *
   924	 * NONE -> QUEUEING -> QUEUED -> DISPATCHING
   925	 *   ^              |                 |
   926	 *   |              v                 v
   927	 *   \-------------------------------/
   928	 *
   929	 * QUEUEING and DISPATCHING states can be waited upon. See wait_ops_state() call
   930	 * sites for explanations on the conditions being waited upon and why they are
   931	 * safe. Transitions out of them into NONE or QUEUED must store_release and the
   932	 * waiters should load_acquire.
   933	 *
   934	 * Tracking scx_ops_state enables sched_ext core to reliably determine whether
   935	 * any given task can be dispatched by the BPF scheduler at all times and thus
   936	 * relaxes the requirements on the BPF scheduler. This allows the BPF scheduler
   937	 * to try to dispatch any task anytime regardless of its state as the SCX core
   938	 * can safely reject invalid dispatches.
   939	 */
   940	enum scx_ops_state {
   941		SCX_OPSS_NONE,		/* owned by the SCX core */
   942		SCX_OPSS_QUEUEING,	/* in transit to the BPF scheduler */
   943		SCX_OPSS_QUEUED,	/* owned by the BPF scheduler */
   944		SCX_OPSS_DISPATCHING,	/* in transit back to the SCX core */
   945	
   946		/*
   947		 * QSEQ brands each QUEUED instance so that, when dispatch races
   948		 * dequeue/requeue, the dispatcher can tell whether it still has a claim
   949		 * on the task being dispatched.
   950		 *
   951		 * As some 32bit archs can't do 64bit store_release/load_acquire,
   952		 * p->scx.ops_state is atomic_long_t which leaves 30 bits for QSEQ on
   953		 * 32bit machines. The dispatch race window QSEQ protects is very narrow
   954		 * and runs with IRQ disabled. 30 bits should be sufficient.
   955		 */
   956		SCX_OPSS_QSEQ_SHIFT	= 2,
   957	};
   958	
   959	/* Use macros to ensure that the type is unsigned long for the masks */
   960	#define SCX_OPSS_STATE_MASK	((1LU << SCX_OPSS_QSEQ_SHIFT) - 1)
   961	#define SCX_OPSS_QSEQ_MASK	(~SCX_OPSS_STATE_MASK)
   962	
   963	/*
   964	 * During exit, a task may schedule after losing its PIDs. When disabling the
   965	 * BPF scheduler, we need to be able to iterate tasks in every state to
   966	 * guarantee system safety. Maintain a dedicated task list which contains every
   967	 * task between its fork and eventual free.
   968	 */
   969	static DEFINE_SPINLOCK(scx_tasks_lock);
   970	static LIST_HEAD(scx_tasks);
   971	
   972	/* ops enable/disable */
   973	static struct kthread_worker *scx_ops_helper;
   974	static DEFINE_MUTEX(scx_ops_enable_mutex);
   975	DEFINE_STATIC_KEY_FALSE(__scx_ops_enabled);
   976	DEFINE_STATIC_PERCPU_RWSEM(scx_fork_rwsem);
   977	static atomic_t scx_ops_enable_state_var = ATOMIC_INIT(SCX_OPS_DISABLED);
   978	static unsigned long scx_in_softlockup;
   979	static atomic_t scx_ops_breather_depth = ATOMIC_INIT(0);
   980	static int scx_ops_bypass_depth;
   981	static bool scx_ops_init_task_enabled;
   982	static bool scx_switching_all;
   983	DEFINE_STATIC_KEY_FALSE(__scx_switched_all);
   984	
   985	static struct sched_ext_ops scx_ops;
   986	static bool scx_warned_zero_slice;
   987	
   988	DEFINE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
   989	static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_last);
   990	static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_exiting);
   991	static DEFINE_STATIC_KEY_FALSE(scx_ops_enq_migration_disabled);
   992	static DEFINE_STATIC_KEY_FALSE(scx_ops_cpu_preempt);
   993	
   994	static struct static_key_false scx_has_op[SCX_OPI_END] =
   995		{ [0 ... SCX_OPI_END-1] = STATIC_KEY_FALSE_INIT };
   996	
   997	static atomic_t scx_exit_kind = ATOMIC_INIT(SCX_EXIT_DONE);
   998	static struct scx_exit_info *scx_exit_info;
   999	
  1000	static atomic_long_t scx_nr_rejected = ATOMIC_LONG_INIT(0);
  1001	static atomic_long_t scx_hotplug_seq = ATOMIC_LONG_INIT(0);
  1002	
  1003	/*
  1004	 * A monotically increasing sequence number that is incremented every time a
  1005	 * scheduler is enabled. This can be used by to check if any custom sched_ext
  1006	 * scheduler has ever been used in the system.
  1007	 */
  1008	static atomic_long_t scx_enable_seq = ATOMIC_LONG_INIT(0);
  1009	
  1010	/*
  1011	 * The maximum amount of time in jiffies that a task may be runnable without
  1012	 * being scheduled on a CPU. If this timeout is exceeded, it will trigger
  1013	 * scx_ops_error().
  1014	 */
  1015	static unsigned long scx_watchdog_timeout;
  1016	
  1017	/*
  1018	 * The last time the delayed work was run. This delayed work relies on
  1019	 * ksoftirqd being able to run to service timer interrupts, so it's possible
  1020	 * that this work itself could get wedged. To account for this, we check that
  1021	 * it's not stalled in the timer tick, and trigger an error if it is.
  1022	 */
  1023	static unsigned long scx_watchdog_timestamp = INITIAL_JIFFIES;
  1024	
  1025	static struct delayed_work scx_watchdog_work;
  1026	
  1027	/* for %SCX_KICK_WAIT */
  1028	static unsigned long __percpu *scx_kick_cpus_pnt_seqs;
  1029	
  1030	/*
  1031	 * Direct dispatch marker.
  1032	 *
  1033	 * Non-NULL values are used for direct dispatch from enqueue path. A valid
  1034	 * pointer points to the task currently being enqueued. An ERR_PTR value is used
  1035	 * to indicate that direct dispatch has already happened.
  1036	 */
  1037	static DEFINE_PER_CPU(struct task_struct *, direct_dispatch_task);
  1038	
  1039	/*
  1040	 * Dispatch queues.
  1041	 *
  1042	 * The global DSQ (%SCX_DSQ_GLOBAL) is split per-node for scalability. This is
  1043	 * to avoid live-locking in bypass mode where all tasks are dispatched to
  1044	 * %SCX_DSQ_GLOBAL and all CPUs consume from it. If per-node split isn't
  1045	 * sufficient, it can be further split.
  1046	 */
  1047	static struct scx_dispatch_q **global_dsqs;
  1048	
  1049	static const struct rhashtable_params dsq_hash_params = {
  1050		.key_len		= sizeof_field(struct scx_dispatch_q, id),
  1051		.key_offset		= offsetof(struct scx_dispatch_q, id),
  1052		.head_offset		= offsetof(struct scx_dispatch_q, hash_node),
  1053	};
  1054	
  1055	static struct rhashtable dsq_hash;
  1056	static LLIST_HEAD(dsqs_to_free);
  1057	
  1058	/* dispatch buf */
  1059	struct scx_dsp_buf_ent {
  1060		struct task_struct	*task;
  1061		unsigned long		qseq;
  1062		u64			dsq_id;
  1063		u64			enq_flags;
  1064	};
  1065	
  1066	static u32 scx_dsp_max_batch;
  1067	
  1068	struct scx_dsp_ctx {
  1069		struct rq		*rq;
  1070		u32			cursor;
  1071		u32			nr_tasks;
  1072		struct scx_dsp_buf_ent	buf[];
  1073	};
  1074	
  1075	static struct scx_dsp_ctx __percpu *scx_dsp_ctx;
  1076	
  1077	/* string formatting from BPF */
  1078	struct scx_bstr_buf {
  1079		u64			data[MAX_BPRINTF_VARARGS];
  1080		char			line[SCX_EXIT_MSG_LEN];
  1081	};
  1082	
  1083	static DEFINE_RAW_SPINLOCK(scx_exit_bstr_buf_lock);
  1084	static struct scx_bstr_buf scx_exit_bstr_buf;
  1085	
  1086	/* ops debug dump */
  1087	struct scx_dump_data {
  1088		s32			cpu;
  1089		bool			first;
  1090		s32			cursor;
  1091		struct seq_buf		*s;
  1092		const char		*prefix;
  1093		struct scx_bstr_buf	buf;
  1094	};
  1095	
  1096	static struct scx_dump_data scx_dump_data = {
  1097		.cpu			= -1,
  1098	};
  1099	
  1100	/* /sys/kernel/sched_ext interface */
  1101	static struct kset *scx_kset;
  1102	static struct kobject *scx_root_kobj;
  1103	
  1104	#define CREATE_TRACE_POINTS
  1105	#include <trace/events/sched_ext.h>
  1106	
  1107	static void process_ddsp_deferred_locals(struct rq *rq);
  1108	static void scx_bpf_kick_cpu(s32 cpu, u64 flags);
  1109	static __printf(3, 4) void scx_ops_exit_kind(enum scx_exit_kind kind,
  1110						     s64 exit_code,
  1111						     const char *fmt, ...);
  1112	
  1113	#define scx_ops_error_kind(err, fmt, args...)					\
  1114		scx_ops_exit_kind((err), 0, fmt, ##args)
  1115	
  1116	#define scx_ops_exit(code, fmt, args...)					\
  1117		scx_ops_exit_kind(SCX_EXIT_UNREG_KERN, (code), fmt, ##args)
  1118	
  1119	#define scx_ops_error(fmt, args...)						\
  1120		scx_ops_error_kind(SCX_EXIT_ERROR, fmt, ##args)
  1121	
  1122	#define SCX_HAS_OP(op)	static_branch_likely(&scx_has_op[SCX_OP_IDX(op)])
  1123	
  1124	static long jiffies_delta_msecs(unsigned long at, unsigned long now)
  1125	{
  1126		if (time_after(at, now))
  1127			return jiffies_to_msecs(at - now);
  1128		else
  1129			return -(long)jiffies_to_msecs(now - at);
  1130	}
  1131	
  1132	/* if the highest set bit is N, return a mask with bits [N+1, 31] set */
  1133	static u32 higher_bits(u32 flags)
  1134	{
  1135		return ~((1 << fls(flags)) - 1);
  1136	}
  1137	
  1138	/* return the mask with only the highest bit set */
  1139	static u32 highest_bit(u32 flags)
  1140	{
  1141		int bit = fls(flags);
  1142		return ((u64)1 << bit) >> 1;
  1143	}
  1144	
  1145	static bool u32_before(u32 a, u32 b)
  1146	{
  1147		return (s32)(a - b) < 0;
  1148	}
  1149	
  1150	static struct scx_dispatch_q *find_global_dsq(struct task_struct *p)
  1151	{
  1152		return global_dsqs[cpu_to_node(task_cpu(p))];
  1153	}
  1154	
  1155	static struct scx_dispatch_q *find_user_dsq(u64 dsq_id)
  1156	{
  1157		return rhashtable_lookup_fast(&dsq_hash, &dsq_id, dsq_hash_params);
  1158	}
  1159	
  1160	/*
  1161	 * scx_kf_mask enforcement. Some kfuncs can only be called from specific SCX
  1162	 * ops. When invoking SCX ops, SCX_CALL_OP[_RET]() should be used to indicate
  1163	 * the allowed kfuncs and those kfuncs should use scx_kf_allowed() to check
  1164	 * whether it's running from an allowed context.
  1165	 *
  1166	 * @mask is constant, always inline to cull the mask calculations.
  1167	 */
  1168	static __always_inline void scx_kf_allow(u32 mask)
  1169	{
  1170		/* nesting is allowed only in increasing scx_kf_mask order */
  1171		WARN_ONCE((mask | higher_bits(mask)) & current->scx.kf_mask,
  1172			  "invalid nesting current->scx.kf_mask=0x%x mask=0x%x\n",
  1173			  current->scx.kf_mask, mask);
  1174		current->scx.kf_mask |= mask;
  1175		barrier();
  1176	}
  1177	
  1178	static void scx_kf_disallow(u32 mask)
  1179	{
  1180		barrier();
  1181		current->scx.kf_mask &= ~mask;
  1182	}
  1183	
  1184	#define SCX_CALL_OP(mask, op, args...)						\
  1185	do {										\
  1186		if (mask) {								\
  1187			scx_kf_allow(mask);						\
  1188			scx_ops.op(args);						\
  1189			scx_kf_disallow(mask);						\
  1190		} else {								\
  1191			scx_ops.op(args);						\
  1192		}									\
  1193	} while (0)
  1194	
  1195	#define SCX_CALL_OP_RET(mask, op, args...)					\
  1196	({										\
  1197		__typeof__(scx_ops.op(args)) __ret;					\
  1198		if (mask) {								\
  1199			scx_kf_allow(mask);						\
  1200			__ret = scx_ops.op(args);					\
  1201			scx_kf_disallow(mask);						\
  1202		} else {								\
  1203			__ret = scx_ops.op(args);					\
  1204		}									\
  1205		__ret;									\
  1206	})
  1207	
  1208	/*
  1209	 * Some kfuncs are allowed only on the tasks that are subjects of the
  1210	 * in-progress scx_ops operation for, e.g., locking guarantees. To enforce such
  1211	 * restrictions, the following SCX_CALL_OP_*() variants should be used when
  1212	 * invoking scx_ops operations that take task arguments. These can only be used
  1213	 * for non-nesting operations due to the way the tasks are tracked.
  1214	 *
  1215	 * kfuncs which can only operate on such tasks can in turn use
  1216	 * scx_kf_allowed_on_arg_tasks() to test whether the invocation is allowed on
  1217	 * the specific task.
  1218	 */
  1219	#define SCX_CALL_OP_TASK(mask, op, task, args...)				\
  1220	do {										\
  1221		BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
  1222		current->scx.kf_tasks[0] = task;					\
  1223		SCX_CALL_OP(mask, op, task, ##args);					\
  1224		current->scx.kf_tasks[0] = NULL;					\
  1225	} while (0)
  1226	
  1227	#define SCX_CALL_OP_TASK_RET(mask, op, task, args...)				\
  1228	({										\
  1229		__typeof__(scx_ops.op(task, ##args)) __ret;				\
  1230		BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
  1231		current->scx.kf_tasks[0] = task;					\
  1232		__ret = SCX_CALL_OP_RET(mask, op, task, ##args);			\
  1233		current->scx.kf_tasks[0] = NULL;					\
  1234		__ret;									\
  1235	})
  1236	
  1237	#define SCX_CALL_OP_2TASKS_RET(mask, op, task0, task1, args...)			\
  1238	({										\
  1239		__typeof__(scx_ops.op(task0, task1, ##args)) __ret;			\
  1240		BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
  1241		current->scx.kf_tasks[0] = task0;					\
  1242		current->scx.kf_tasks[1] = task1;					\
  1243		__ret = SCX_CALL_OP_RET(mask, op, task0, task1, ##args);		\
  1244		current->scx.kf_tasks[0] = NULL;					\
  1245		current->scx.kf_tasks[1] = NULL;					\
  1246		__ret;									\
  1247	})
  1248	
  1249	/* @mask is constant, always inline to cull unnecessary branches */
  1250	static __always_inline bool scx_kf_allowed(u32 mask)
  1251	{
  1252		if (unlikely(!(current->scx.kf_mask & mask))) {
  1253			scx_ops_error("kfunc with mask 0x%x called from an operation only allowing 0x%x",
  1254				      mask, current->scx.kf_mask);
  1255			return false;
  1256		}
  1257	
  1258		/*
  1259		 * Enforce nesting boundaries. e.g. A kfunc which can be called from
  1260		 * DISPATCH must not be called if we're running DEQUEUE which is nested
  1261		 * inside ops.dispatch(). We don't need to check boundaries for any
  1262		 * blocking kfuncs as the verifier ensures they're only called from
  1263		 * sleepable progs.
  1264		 */
  1265		if (unlikely(highest_bit(mask) == SCX_KF_CPU_RELEASE &&
  1266			     (current->scx.kf_mask & higher_bits(SCX_KF_CPU_RELEASE)))) {
  1267			scx_ops_error("cpu_release kfunc called from a nested operation");
  1268			return false;
  1269		}
  1270	
  1271		if (unlikely(highest_bit(mask) == SCX_KF_DISPATCH &&
  1272			     (current->scx.kf_mask & higher_bits(SCX_KF_DISPATCH)))) {
  1273			scx_ops_error("dispatch kfunc called from a nested operation");
  1274			return false;
  1275		}
  1276	
  1277		return true;
  1278	}
  1279	
  1280	/* see SCX_CALL_OP_TASK() */
  1281	static __always_inline bool scx_kf_allowed_on_arg_tasks(u32 mask,
  1282								struct task_struct *p)
  1283	{
  1284		if (!scx_kf_allowed(mask))
  1285			return false;
  1286	
  1287		if (unlikely((p != current->scx.kf_tasks[0] &&
  1288			      p != current->scx.kf_tasks[1]))) {
  1289			scx_ops_error("called on a task not being operated on");
  1290			return false;
  1291		}
  1292	
  1293		return true;
  1294	}
  1295	
  1296	static bool scx_kf_allowed_if_unlocked(void)
  1297	{
  1298		return !current->scx.kf_mask;
  1299	}
  1300	
  1301	/**
  1302	 * nldsq_next_task - Iterate to the next task in a non-local DSQ
  1303	 * @dsq: user dsq being iterated
  1304	 * @cur: current position, %NULL to start iteration
  1305	 * @rev: walk backwards
  1306	 *
  1307	 * Returns %NULL when iteration is finished.
  1308	 */
  1309	static struct task_struct *nldsq_next_task(struct scx_dispatch_q *dsq,
  1310						   struct task_struct *cur, bool rev)
  1311	{
  1312		struct list_head *list_node;
  1313		struct scx_dsq_list_node *dsq_lnode;
  1314	
  1315		lockdep_assert_held(&dsq->lock);
  1316	
  1317		if (cur)
  1318			list_node = &cur->scx.dsq_list.node;
  1319		else
  1320			list_node = &dsq->list;
  1321	
  1322		/* find the next task, need to skip BPF iteration cursors */
  1323		do {
  1324			if (rev)
  1325				list_node = list_node->prev;
  1326			else
  1327				list_node = list_node->next;
  1328	
  1329			if (list_node == &dsq->list)
  1330				return NULL;
  1331	
  1332			dsq_lnode = container_of(list_node, struct scx_dsq_list_node,
  1333						 node);
  1334		} while (dsq_lnode->flags & SCX_DSQ_LNODE_ITER_CURSOR);
  1335	
  1336		return container_of(dsq_lnode, struct task_struct, scx.dsq_list);
  1337	}
  1338	
  1339	#define nldsq_for_each_task(p, dsq)						\
  1340		for ((p) = nldsq_next_task((dsq), NULL, false); (p);			\
  1341		     (p) = nldsq_next_task((dsq), (p), false))
  1342	
  1343	
  1344	/*
  1345	 * BPF DSQ iterator. Tasks in a non-local DSQ can be iterated in [reverse]
  1346	 * dispatch order. BPF-visible iterator is opaque and larger to allow future
  1347	 * changes without breaking backward compatibility. Can be used with
  1348	 * bpf_for_each(). See bpf_iter_scx_dsq_*().
  1349	 */
  1350	enum scx_dsq_iter_flags {
  1351		/* iterate in the reverse dispatch order */
  1352		SCX_DSQ_ITER_REV		= 1U << 16,
  1353	
  1354		__SCX_DSQ_ITER_HAS_SLICE	= 1U << 30,
  1355		__SCX_DSQ_ITER_HAS_VTIME	= 1U << 31,
  1356	
  1357		__SCX_DSQ_ITER_USER_FLAGS	= SCX_DSQ_ITER_REV,
  1358		__SCX_DSQ_ITER_ALL_FLAGS	= __SCX_DSQ_ITER_USER_FLAGS |
  1359						  __SCX_DSQ_ITER_HAS_SLICE |
  1360						  __SCX_DSQ_ITER_HAS_VTIME,
  1361	};
  1362	
  1363	struct bpf_iter_scx_dsq_kern {
  1364		struct scx_dsq_list_node	cursor;
  1365		struct scx_dispatch_q		*dsq;
  1366		u64				slice;
  1367		u64				vtime;
  1368	} __attribute__((aligned(8)));
  1369	
  1370	struct bpf_iter_scx_dsq {
  1371		u64				__opaque[6];
  1372	} __attribute__((aligned(8)));
  1373	
  1374	
  1375	/*
  1376	 * SCX task iterator.
  1377	 */
  1378	struct scx_task_iter {
  1379		struct sched_ext_entity		cursor;
  1380		struct task_struct		*locked;
  1381		struct rq			*rq;
  1382		struct rq_flags			rf;
  1383		u32				cnt;
  1384	};
  1385	
  1386	/**
  1387	 * scx_task_iter_start - Lock scx_tasks_lock and start a task iteration
  1388	 * @iter: iterator to init
  1389	 *
  1390	 * Initialize @iter and return with scx_tasks_lock held. Once initialized, @iter
  1391	 * must eventually be stopped with scx_task_iter_stop().
  1392	 *
  1393	 * scx_tasks_lock and the rq lock may be released using scx_task_iter_unlock()
  1394	 * between this and the first next() call or between any two next() calls. If
  1395	 * the locks are released between two next() calls, the caller is responsible
  1396	 * for ensuring that the task being iterated remains accessible either through
  1397	 * RCU read lock or obtaining a reference count.
  1398	 *
  1399	 * All tasks which existed when the iteration started are guaranteed to be
  1400	 * visited as long as they still exist.
  1401	 */
  1402	static void scx_task_iter_start(struct scx_task_iter *iter)
  1403	{
  1404		BUILD_BUG_ON(__SCX_DSQ_ITER_ALL_FLAGS &
  1405			     ((1U << __SCX_DSQ_LNODE_PRIV_SHIFT) - 1));
  1406	
  1407		spin_lock_irq(&scx_tasks_lock);
  1408	
  1409		iter->cursor = (struct sched_ext_entity){ .flags = SCX_TASK_CURSOR };
  1410		list_add(&iter->cursor.tasks_node, &scx_tasks);
  1411		iter->locked = NULL;
  1412		iter->cnt = 0;
  1413	}
  1414	
  1415	static void __scx_task_iter_rq_unlock(struct scx_task_iter *iter)
  1416	{
  1417		if (iter->locked) {
  1418			task_rq_unlock(iter->rq, iter->locked, &iter->rf);
  1419			iter->locked = NULL;
  1420		}
  1421	}
  1422	
  1423	/**
  1424	 * scx_task_iter_unlock - Unlock rq and scx_tasks_lock held by a task iterator
  1425	 * @iter: iterator to unlock
  1426	 *
  1427	 * If @iter is in the middle of a locked iteration, it may be locking the rq of
  1428	 * the task currently being visited in addition to scx_tasks_lock. Unlock both.
  1429	 * This function can be safely called anytime during an iteration.
  1430	 */
  1431	static void scx_task_iter_unlock(struct scx_task_iter *iter)
  1432	{
  1433		__scx_task_iter_rq_unlock(iter);
  1434		spin_unlock_irq(&scx_tasks_lock);
  1435	}
  1436	
  1437	/**
  1438	 * scx_task_iter_relock - Lock scx_tasks_lock released by scx_task_iter_unlock()
  1439	 * @iter: iterator to re-lock
  1440	 *
  1441	 * Re-lock scx_tasks_lock unlocked by scx_task_iter_unlock(). Note that it
  1442	 * doesn't re-lock the rq lock. Must be called before other iterator operations.
  1443	 */
  1444	static void scx_task_iter_relock(struct scx_task_iter *iter)
  1445	{
  1446		spin_lock_irq(&scx_tasks_lock);
  1447	}
  1448	
  1449	/**
  1450	 * scx_task_iter_stop - Stop a task iteration and unlock scx_tasks_lock
  1451	 * @iter: iterator to exit
  1452	 *
  1453	 * Exit a previously initialized @iter. Must be called with scx_tasks_lock held
  1454	 * which is released on return. If the iterator holds a task's rq lock, that rq
  1455	 * lock is also released. See scx_task_iter_start() for details.
  1456	 */
  1457	static void scx_task_iter_stop(struct scx_task_iter *iter)
  1458	{
  1459		list_del_init(&iter->cursor.tasks_node);
  1460		scx_task_iter_unlock(iter);
  1461	}
  1462	
  1463	/**
  1464	 * scx_task_iter_next - Next task
  1465	 * @iter: iterator to walk
  1466	 *
  1467	 * Visit the next task. See scx_task_iter_start() for details. Locks are dropped
  1468	 * and re-acquired every %SCX_OPS_TASK_ITER_BATCH iterations to avoid causing
  1469	 * stalls by holding scx_tasks_lock for too long.
  1470	 */
  1471	static struct task_struct *scx_task_iter_next(struct scx_task_iter *iter)
  1472	{
  1473		struct list_head *cursor = &iter->cursor.tasks_node;
  1474		struct sched_ext_entity *pos;
  1475	
  1476		if (!(++iter->cnt % SCX_OPS_TASK_ITER_BATCH)) {
  1477			scx_task_iter_unlock(iter);
  1478			cond_resched();
  1479			scx_task_iter_relock(iter);
  1480		}
  1481	
  1482		list_for_each_entry(pos, cursor, tasks_node) {
  1483			if (&pos->tasks_node == &scx_tasks)
  1484				return NULL;
  1485			if (!(pos->flags & SCX_TASK_CURSOR)) {
  1486				list_move(cursor, &pos->tasks_node);
  1487				return container_of(pos, struct task_struct, scx);
  1488			}
  1489		}
  1490	
  1491		/* can't happen, should always terminate at scx_tasks above */
  1492		BUG();
  1493	}
  1494	
  1495	/**
  1496	 * scx_task_iter_next_locked - Next non-idle task with its rq locked
  1497	 * @iter: iterator to walk
  1498	 *
  1499	 * Visit the non-idle task with its rq lock held. Allows callers to specify
  1500	 * whether they would like to filter out dead tasks. See scx_task_iter_start()
  1501	 * for details.
  1502	 */
  1503	static struct task_struct *scx_task_iter_next_locked(struct scx_task_iter *iter)
  1504	{
  1505		struct task_struct *p;
  1506	
  1507		__scx_task_iter_rq_unlock(iter);
  1508	
  1509		while ((p = scx_task_iter_next(iter))) {
  1510			/*
  1511			 * scx_task_iter is used to prepare and move tasks into SCX
  1512			 * while loading the BPF scheduler and vice-versa while
  1513			 * unloading. The init_tasks ("swappers") should be excluded
  1514			 * from the iteration because:
  1515			 *
  1516			 * - It's unsafe to use __setschduler_prio() on an init_task to
  1517			 *   determine the sched_class to use as it won't preserve its
  1518			 *   idle_sched_class.
  1519			 *
  1520			 * - ops.init/exit_task() can easily be confused if called with
  1521			 *   init_tasks as they, e.g., share PID 0.
  1522			 *
  1523			 * As init_tasks are never scheduled through SCX, they can be
  1524			 * skipped safely. Note that is_idle_task() which tests %PF_IDLE
  1525			 * doesn't work here:
  1526			 *
  1527			 * - %PF_IDLE may not be set for an init_task whose CPU hasn't
  1528			 *   yet been onlined.
  1529			 *
  1530			 * - %PF_IDLE can be set on tasks that are not init_tasks. See
  1531			 *   play_idle_precise() used by CONFIG_IDLE_INJECT.
  1532			 *
  1533			 * Test for idle_sched_class as only init_tasks are on it.
  1534			 */
  1535			if (p->sched_class != &idle_sched_class)
  1536				break;
  1537		}
  1538		if (!p)
  1539			return NULL;
  1540	
  1541		iter->rq = task_rq_lock(p, &iter->rf);
  1542		iter->locked = p;
  1543	
  1544		return p;
  1545	}
  1546	
  1547	/*
  1548	 * Collection of event counters. Event types are placed in descending order.
  1549	 */
  1550	struct scx_event_stats {
  1551		/*
  1552		 * If ops.select_cpu() returns a CPU which can't be used by the task,
  1553		 * the core scheduler code silently picks a fallback CPU.
  1554		 */
  1555		u64		SCX_EV_SELECT_CPU_FALLBACK;
  1556	
  1557		/*
  1558		 * When dispatching to a local DSQ, the CPU may have gone offline in
  1559		 * the meantime. In this case, the task is bounced to the global DSQ.
  1560		 */
  1561		u64		SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE;
  1562	
  1563		/*
  1564		 * If SCX_OPS_ENQ_LAST is not set, the number of times that a task
  1565		 * continued to run because there were no other tasks on the CPU.
  1566		 */
  1567		u64		SCX_EV_DISPATCH_KEEP_LAST;
  1568	
  1569		/*
  1570		 * If SCX_OPS_ENQ_EXITING is not set, the number of times that a task
  1571		 * is dispatched to a local DSQ when exiting.
  1572		 */
  1573		u64		SCX_EV_ENQ_SKIP_EXITING;
  1574	
  1575		/*
  1576		 * If SCX_OPS_ENQ_MIGRATION_DISABLED is not set, the number of times a
  1577		 * migration disabled task skips ops.enqueue() and is dispatched to its
  1578		 * local DSQ.
  1579		 */
  1580		u64		SCX_EV_ENQ_SKIP_MIGRATION_DISABLED;
  1581	
  1582		/*
  1583		 * The total number of tasks enqueued (or pick_task-ed) with a
  1584		 * default time slice (SCX_SLICE_DFL).
  1585		 */
  1586		u64		SCX_EV_ENQ_SLICE_DFL;
  1587	
  1588		/*
  1589		 * The total duration of bypass modes in nanoseconds.
  1590		 */
  1591		u64		SCX_EV_BYPASS_DURATION;
  1592	
  1593		/*
  1594		 * The number of tasks dispatched in the bypassing mode.
  1595		 */
  1596		u64		SCX_EV_BYPASS_DISPATCH;
  1597	
  1598		/*
  1599		 * The number of times the bypassing mode has been activated.
  1600		 */
  1601		u64		SCX_EV_BYPASS_ACTIVATE;
  1602	};
  1603	
  1604	/*
  1605	 * The event counter is organized by a per-CPU variable to minimize the
  1606	 * accounting overhead without synchronization. A system-wide view on the
  1607	 * event counter is constructed when requested by scx_bpf_get_event_stat().
  1608	 */
  1609	static DEFINE_PER_CPU(struct scx_event_stats, event_stats_cpu);
  1610	
  1611	/**
  1612	 * scx_add_event - Increase an event counter for 'name' by 'cnt'
  1613	 * @name: an event name defined in struct scx_event_stats
  1614	 * @cnt: the number of the event occured
  1615	 *
  1616	 * This can be used when preemption is not disabled.
  1617	 */
  1618	#define scx_add_event(name, cnt) do {						\
  1619		this_cpu_add(event_stats_cpu.name, cnt);				\
  1620	} while(0)
  1621	
  1622	/**
  1623	 * __scx_add_event - Increase an event counter for 'name' by 'cnt'
  1624	 * @name: an event name defined in struct scx_event_stats
  1625	 * @cnt: the number of the event occured
  1626	 *
  1627	 * This should be used only when preemption is disabled.
  1628	 */
  1629	#define __scx_add_event(name, cnt) do {						\
  1630		__this_cpu_add(event_stats_cpu.name, cnt);				\
  1631	} while(0)
  1632	
  1633	/**
  1634	 * scx_agg_event - Aggregate an event counter 'kind' from 'src_e' to 'dst_e'
  1635	 * @dst_e: destination event stats
  1636	 * @src_e: source event stats
  1637	 * @kind: a kind of event to be aggregated
  1638	 */
  1639	#define scx_agg_event(dst_e, src_e, kind) do {					\
  1640		(dst_e)->kind += READ_ONCE((src_e)->kind);				\
  1641	} while(0)
  1642	
  1643	/**
  1644	 * scx_dump_event - Dump an event 'kind' in 'events' to 's'
  1645	 * @s: output seq_buf
  1646	 * @events: event stats
  1647	 * @kind: a kind of event to dump
  1648	 */
  1649	#define scx_dump_event(s, events, kind) do {					\
  1650		dump_line(&(s), "%40s: %16llu", #kind, (events)->kind);			\
  1651	} while (0)
  1652	
  1653	
  1654	static void scx_bpf_events(struct scx_event_stats *events, size_t events__sz);
  1655	
  1656	static enum scx_ops_enable_state scx_ops_enable_state(void)
  1657	{
  1658		return atomic_read(&scx_ops_enable_state_var);
  1659	}
  1660	
  1661	static enum scx_ops_enable_state
  1662	scx_ops_set_enable_state(enum scx_ops_enable_state to)
  1663	{
  1664		return atomic_xchg(&scx_ops_enable_state_var, to);
  1665	}
  1666	
  1667	static bool scx_ops_tryset_enable_state(enum scx_ops_enable_state to,
  1668						enum scx_ops_enable_state from)
  1669	{
  1670		int from_v = from;
  1671	
  1672		return atomic_try_cmpxchg(&scx_ops_enable_state_var, &from_v, to);
  1673	}
  1674	
  1675	static bool scx_rq_bypassing(struct rq *rq)
  1676	{
  1677		return unlikely(rq->scx.flags & SCX_RQ_BYPASSING);
  1678	}
  1679	
  1680	/**
  1681	 * wait_ops_state - Busy-wait the specified ops state to end
  1682	 * @p: target task
  1683	 * @opss: state to wait the end of
  1684	 *
  1685	 * Busy-wait for @p to transition out of @opss. This can only be used when the
  1686	 * state part of @opss is %SCX_QUEUEING or %SCX_DISPATCHING. This function also
  1687	 * has load_acquire semantics to ensure that the caller can see the updates made
  1688	 * in the enqueueing and dispatching paths.
  1689	 */
  1690	static void wait_ops_state(struct task_struct *p, unsigned long opss)
  1691	{
  1692		do {
  1693			cpu_relax();
  1694		} while (atomic_long_read_acquire(&p->scx.ops_state) == opss);
  1695	}
  1696	
  1697	/**
  1698	 * ops_cpu_valid - Verify a cpu number
  1699	 * @cpu: cpu number which came from a BPF ops
  1700	 * @where: extra information reported on error
  1701	 *
  1702	 * @cpu is a cpu number which came from the BPF scheduler and can be any value.
  1703	 * Verify that it is in range and one of the possible cpus. If invalid, trigger
  1704	 * an ops error.
  1705	 */
  1706	static bool ops_cpu_valid(s32 cpu, const char *where)
  1707	{
  1708		if (likely(cpu >= 0 && cpu < nr_cpu_ids && cpu_possible(cpu))) {
  1709			return true;
  1710		} else {
  1711			scx_ops_error("invalid CPU %d%s%s", cpu,
  1712				      where ? " " : "", where ?: "");
  1713			return false;
  1714		}
  1715	}
  1716	
  1717	/**
  1718	 * ops_sanitize_err - Sanitize a -errno value
  1719	 * @ops_name: operation to blame on failure
  1720	 * @err: -errno value to sanitize
  1721	 *
  1722	 * Verify @err is a valid -errno. If not, trigger scx_ops_error() and return
  1723	 * -%EPROTO. This is necessary because returning a rogue -errno up the chain can
  1724	 * cause misbehaviors. For an example, a large negative return from
  1725	 * ops.init_task() triggers an oops when passed up the call chain because the
  1726	 * value fails IS_ERR() test after being encoded with ERR_PTR() and then is
  1727	 * handled as a pointer.
  1728	 */
  1729	static int ops_sanitize_err(const char *ops_name, s32 err)
  1730	{
  1731		if (err < 0 && err >= -MAX_ERRNO)
  1732			return err;
  1733	
  1734		scx_ops_error("ops.%s() returned an invalid errno %d", ops_name, err);
  1735		return -EPROTO;
  1736	}
  1737	
  1738	static void run_deferred(struct rq *rq)
  1739	{
  1740		process_ddsp_deferred_locals(rq);
  1741	}
  1742	
  1743	#ifdef CONFIG_SMP
  1744	static void deferred_bal_cb_workfn(struct rq *rq)
  1745	{
  1746		run_deferred(rq);
  1747	}
  1748	#endif
  1749	
  1750	static void deferred_irq_workfn(struct irq_work *irq_work)
  1751	{
  1752		struct rq *rq = container_of(irq_work, struct rq, scx.deferred_irq_work);
  1753	
  1754		raw_spin_rq_lock(rq);
  1755		run_deferred(rq);
  1756		raw_spin_rq_unlock(rq);
  1757	}
  1758	
  1759	/**
  1760	 * schedule_deferred - Schedule execution of deferred actions on an rq
  1761	 * @rq: target rq
  1762	 *
  1763	 * Schedule execution of deferred actions on @rq. Must be called with @rq
  1764	 * locked. Deferred actions are executed with @rq locked but unpinned, and thus
  1765	 * can unlock @rq to e.g. migrate tasks to other rqs.
  1766	 */
  1767	static void schedule_deferred(struct rq *rq)
  1768	{
  1769		lockdep_assert_rq_held(rq);
  1770	
  1771	#ifdef CONFIG_SMP
  1772		/*
  1773		 * If in the middle of waking up a task, task_woken_scx() will be called
  1774		 * afterwards which will then run the deferred actions, no need to
  1775		 * schedule anything.
  1776		 */
  1777		if (rq->scx.flags & SCX_RQ_IN_WAKEUP)
  1778			return;
  1779	
  1780		/*
  1781		 * If in balance, the balance callbacks will be called before rq lock is
  1782		 * released. Schedule one.
  1783		 */
  1784		if (rq->scx.flags & SCX_RQ_IN_BALANCE) {
  1785			queue_balance_callback(rq, &rq->scx.deferred_bal_cb,
  1786					       deferred_bal_cb_workfn);
  1787			return;
  1788		}
  1789	#endif
  1790		/*
  1791		 * No scheduler hooks available. Queue an irq work. They are executed on
  1792		 * IRQ re-enable which may take a bit longer than the scheduler hooks.
  1793		 * The above WAKEUP and BALANCE paths should cover most of the cases and
  1794		 * the time to IRQ re-enable shouldn't be long.
  1795		 */
  1796		irq_work_queue(&rq->scx.deferred_irq_work);
  1797	}
  1798	
  1799	/**
  1800	 * touch_core_sched - Update timestamp used for core-sched task ordering
  1801	 * @rq: rq to read clock from, must be locked
  1802	 * @p: task to update the timestamp for
  1803	 *
  1804	 * Update @p->scx.core_sched_at timestamp. This is used by scx_prio_less() to
  1805	 * implement global or local-DSQ FIFO ordering for core-sched. Should be called
  1806	 * when a task becomes runnable and its turn on the CPU ends (e.g. slice
  1807	 * exhaustion).
  1808	 */
  1809	static void touch_core_sched(struct rq *rq, struct task_struct *p)
  1810	{
  1811		lockdep_assert_rq_held(rq);
  1812	
  1813	#ifdef CONFIG_SCHED_CORE
  1814		/*
  1815		 * It's okay to update the timestamp spuriously. Use
  1816		 * sched_core_disabled() which is cheaper than enabled().
  1817		 *
  1818		 * As this is used to determine ordering between tasks of sibling CPUs,
  1819		 * it may be better to use per-core dispatch sequence instead.
  1820		 */
  1821		if (!sched_core_disabled())
  1822			p->scx.core_sched_at = sched_clock_cpu(cpu_of(rq));
  1823	#endif
  1824	}
  1825	
  1826	/**
  1827	 * touch_core_sched_dispatch - Update core-sched timestamp on dispatch
  1828	 * @rq: rq to read clock from, must be locked
  1829	 * @p: task being dispatched
  1830	 *
  1831	 * If the BPF scheduler implements custom core-sched ordering via
  1832	 * ops.core_sched_before(), @p->scx.core_sched_at is used to implement FIFO
  1833	 * ordering within each local DSQ. This function is called from dispatch paths
  1834	 * and updates @p->scx.core_sched_at if custom core-sched ordering is in effect.
  1835	 */
  1836	static void touch_core_sched_dispatch(struct rq *rq, struct task_struct *p)
  1837	{
  1838		lockdep_assert_rq_held(rq);
  1839	
  1840	#ifdef CONFIG_SCHED_CORE
  1841		if (SCX_HAS_OP(core_sched_before))
  1842			touch_core_sched(rq, p);
  1843	#endif
  1844	}
  1845	
  1846	static void update_curr_scx(struct rq *rq)
  1847	{
  1848		struct task_struct *curr = rq->curr;
  1849		s64 delta_exec;
  1850	
  1851		delta_exec = update_curr_common(rq);
  1852		if (unlikely(delta_exec <= 0))
  1853			return;
  1854	
  1855		if (curr->scx.slice != SCX_SLICE_INF) {
  1856			curr->scx.slice -= min_t(u64, curr->scx.slice, delta_exec);
  1857			if (!curr->scx.slice)
  1858				touch_core_sched(rq, curr);
  1859		}
  1860	}
  1861	
  1862	static bool scx_dsq_priq_less(struct rb_node *node_a,
  1863				      const struct rb_node *node_b)
  1864	{
  1865		const struct task_struct *a =
  1866			container_of(node_a, struct task_struct, scx.dsq_priq);
  1867		const struct task_struct *b =
  1868			container_of(node_b, struct task_struct, scx.dsq_priq);
  1869	
  1870		return time_before64(a->scx.dsq_vtime, b->scx.dsq_vtime);
  1871	}
  1872	
  1873	static void dsq_mod_nr(struct scx_dispatch_q *dsq, s32 delta)
  1874	{
  1875		/* scx_bpf_dsq_nr_queued() reads ->nr without locking, use WRITE_ONCE() */
  1876		WRITE_ONCE(dsq->nr, dsq->nr + delta);
  1877	}
  1878	
  1879	static void dispatch_enqueue(struct scx_dispatch_q *dsq, struct task_struct *p,
  1880				     u64 enq_flags)
  1881	{
  1882		bool is_local = dsq->id == SCX_DSQ_LOCAL;
  1883	
  1884		WARN_ON_ONCE(p->scx.dsq || !list_empty(&p->scx.dsq_list.node));
  1885		WARN_ON_ONCE((p->scx.dsq_flags & SCX_TASK_DSQ_ON_PRIQ) ||
  1886			     !RB_EMPTY_NODE(&p->scx.dsq_priq));
  1887	
  1888		if (!is_local) {
  1889			raw_spin_lock(&dsq->lock);
  1890			if (unlikely(dsq->id == SCX_DSQ_INVALID)) {
  1891				scx_ops_error("attempting to dispatch to a destroyed dsq");
  1892				/* fall back to the global dsq */
  1893				raw_spin_unlock(&dsq->lock);
  1894				dsq = find_global_dsq(p);
  1895				raw_spin_lock(&dsq->lock);
  1896			}
  1897		}
  1898	
  1899		if (unlikely((dsq->id & SCX_DSQ_FLAG_BUILTIN) &&
  1900			     (enq_flags & SCX_ENQ_DSQ_PRIQ))) {
  1901			/*
  1902			 * SCX_DSQ_LOCAL and SCX_DSQ_GLOBAL DSQs always consume from
  1903			 * their FIFO queues. To avoid confusion and accidentally
  1904			 * starving vtime-dispatched tasks by FIFO-dispatched tasks, we
  1905			 * disallow any internal DSQ from doing vtime ordering of
  1906			 * tasks.
  1907			 */
  1908			scx_ops_error("cannot use vtime ordering for built-in DSQs");
  1909			enq_flags &= ~SCX_ENQ_DSQ_PRIQ;
  1910		}
  1911	
  1912		if (enq_flags & SCX_ENQ_DSQ_PRIQ) {
  1913			struct rb_node *rbp;
  1914	
  1915			/*
  1916			 * A PRIQ DSQ shouldn't be using FIFO enqueueing. As tasks are
  1917			 * linked to both the rbtree and list on PRIQs, this can only be
  1918			 * tested easily when adding the first task.
  1919			 */
  1920			if (unlikely(RB_EMPTY_ROOT(&dsq->priq) &&
  1921				     nldsq_next_task(dsq, NULL, false)))
  1922				scx_ops_error("DSQ ID 0x%016llx already had FIFO-enqueued tasks",
  1923					      dsq->id);
  1924	
  1925			p->scx.dsq_flags |= SCX_TASK_DSQ_ON_PRIQ;
  1926			rb_add(&p->scx.dsq_priq, &dsq->priq, scx_dsq_priq_less);
  1927	
  1928			/*
  1929			 * Find the previous task and insert after it on the list so
  1930			 * that @dsq->list is vtime ordered.
  1931			 */
  1932			rbp = rb_prev(&p->scx.dsq_priq);
  1933			if (rbp) {
  1934				struct task_struct *prev =
  1935					container_of(rbp, struct task_struct,
  1936						     scx.dsq_priq);
  1937				list_add(&p->scx.dsq_list.node, &prev->scx.dsq_list.node);
  1938			} else {
  1939				list_add(&p->scx.dsq_list.node, &dsq->list);
  1940			}
  1941		} else {
  1942			/* a FIFO DSQ shouldn't be using PRIQ enqueuing */
  1943			if (unlikely(!RB_EMPTY_ROOT(&dsq->priq)))
  1944				scx_ops_error("DSQ ID 0x%016llx already had PRIQ-enqueued tasks",
  1945					      dsq->id);
  1946	
  1947			if (enq_flags & (SCX_ENQ_HEAD | SCX_ENQ_PREEMPT))
  1948				list_add(&p->scx.dsq_list.node, &dsq->list);
  1949			else
  1950				list_add_tail(&p->scx.dsq_list.node, &dsq->list);
  1951		}
  1952	
  1953		/* seq records the order tasks are queued, used by BPF DSQ iterator */
  1954		dsq->seq++;
  1955		p->scx.dsq_seq = dsq->seq;
  1956	
  1957		dsq_mod_nr(dsq, 1);
  1958		p->scx.dsq = dsq;
  1959	
  1960		/*
  1961		 * scx.ddsp_dsq_id and scx.ddsp_enq_flags are only relevant on the
  1962		 * direct dispatch path, but we clear them here because the direct
  1963		 * dispatch verdict may be overridden on the enqueue path during e.g.
  1964		 * bypass.
  1965		 */
  1966		p->scx.ddsp_dsq_id = SCX_DSQ_INVALID;
  1967		p->scx.ddsp_enq_flags = 0;
  1968	
  1969		/*
  1970		 * We're transitioning out of QUEUEING or DISPATCHING. store_release to
  1971		 * match waiters' load_acquire.
  1972		 */
  1973		if (enq_flags & SCX_ENQ_CLEAR_OPSS)
  1974			atomic_long_set_release(&p->scx.ops_state, SCX_OPSS_NONE);
  1975	
  1976		if (is_local) {
  1977			struct rq *rq = container_of(dsq, struct rq, scx.local_dsq);
  1978			bool preempt = false;
  1979	
  1980			if ((enq_flags & SCX_ENQ_PREEMPT) && p != rq->curr &&
  1981			    rq->curr->sched_class == &ext_sched_class) {
  1982				rq->curr->scx.slice = 0;
  1983				preempt = true;
  1984			}
  1985	
  1986			if (preempt || sched_class_above(&ext_sched_class,
  1987							 rq->curr->sched_class))
  1988				resched_curr(rq);
  1989		} else {
  1990			raw_spin_unlock(&dsq->lock);
  1991		}
  1992	}
  1993	
  1994	static void task_unlink_from_dsq(struct task_struct *p,
  1995					 struct scx_dispatch_q *dsq)
  1996	{
  1997		WARN_ON_ONCE(list_empty(&p->scx.dsq_list.node));
  1998	
  1999		if (p->scx.dsq_flags & SCX_TASK_DSQ_ON_PRIQ) {
  2000			rb_erase(&p->scx.dsq_priq, &dsq->priq);
  2001			RB_CLEAR_NODE(&p->scx.dsq_priq);
  2002			p->scx.dsq_flags &= ~SCX_TASK_DSQ_ON_PRIQ;
  2003		}
  2004	
  2005		list_del_init(&p->scx.dsq_list.node);
  2006		dsq_mod_nr(dsq, -1);
  2007	}
  2008	
  2009	static void dispatch_dequeue(struct rq *rq, struct task_struct *p)
  2010	{
  2011		struct scx_dispatch_q *dsq = p->scx.dsq;
  2012		bool is_local = dsq == &rq->scx.local_dsq;
  2013	
  2014		if (!dsq) {
  2015			/*
  2016			 * If !dsq && on-list, @p is on @rq's ddsp_deferred_locals.
  2017			 * Unlinking is all that's needed to cancel.
  2018			 */
  2019			if (unlikely(!list_empty(&p->scx.dsq_list.node)))
  2020				list_del_init(&p->scx.dsq_list.node);
  2021	
  2022			/*
  2023			 * When dispatching directly from the BPF scheduler to a local
  2024			 * DSQ, the task isn't associated with any DSQ but
  2025			 * @p->scx.holding_cpu may be set under the protection of
  2026			 * %SCX_OPSS_DISPATCHING.
  2027			 */
  2028			if (p->scx.holding_cpu >= 0)
  2029				p->scx.holding_cpu = -1;
  2030	
  2031			return;
  2032		}
  2033	
  2034		if (!is_local)
  2035			raw_spin_lock(&dsq->lock);
  2036	
  2037		/*
  2038		 * Now that we hold @dsq->lock, @p->holding_cpu and @p->scx.dsq_* can't
  2039		 * change underneath us.
  2040		*/
  2041		if (p->scx.holding_cpu < 0) {
  2042			/* @p must still be on @dsq, dequeue */
  2043			task_unlink_from_dsq(p, dsq);
  2044		} else {
  2045			/*
  2046			 * We're racing against dispatch_to_local_dsq() which already
  2047			 * removed @p from @dsq and set @p->scx.holding_cpu. Clear the
  2048			 * holding_cpu which tells dispatch_to_local_dsq() that it lost
  2049			 * the race.
  2050			 */
  2051			WARN_ON_ONCE(!list_empty(&p->scx.dsq_list.node));
  2052			p->scx.holding_cpu = -1;
  2053		}
  2054		p->scx.dsq = NULL;
  2055	
  2056		if (!is_local)
  2057			raw_spin_unlock(&dsq->lock);
  2058	}
  2059	
  2060	static struct scx_dispatch_q *find_dsq_for_dispatch(struct rq *rq, u64 dsq_id,
  2061							    struct task_struct *p)
  2062	{
  2063		struct scx_dispatch_q *dsq;
  2064	
  2065		if (dsq_id == SCX_DSQ_LOCAL)
  2066			return &rq->scx.local_dsq;
  2067	
  2068		if ((dsq_id & SCX_DSQ_LOCAL_ON) == SCX_DSQ_LOCAL_ON) {
  2069			s32 cpu = dsq_id & SCX_DSQ_LOCAL_CPU_MASK;
  2070	
  2071			if (!ops_cpu_valid(cpu, "in SCX_DSQ_LOCAL_ON dispatch verdict"))
  2072				return find_global_dsq(p);
  2073	
  2074			return &cpu_rq(cpu)->scx.local_dsq;
  2075		}
  2076	
  2077		if (dsq_id == SCX_DSQ_GLOBAL)
  2078			dsq = find_global_dsq(p);
  2079		else
  2080			dsq = find_user_dsq(dsq_id);
  2081	
  2082		if (unlikely(!dsq)) {
  2083			scx_ops_error("non-existent DSQ 0x%llx for %s[%d]",
  2084				      dsq_id, p->comm, p->pid);
  2085			return find_global_dsq(p);
  2086		}
  2087	
  2088		return dsq;
  2089	}
  2090	
  2091	static void mark_direct_dispatch(struct task_struct *ddsp_task,
  2092					 struct task_struct *p, u64 dsq_id,
  2093					 u64 enq_flags)
  2094	{
  2095		/*
  2096		 * Mark that dispatch already happened from ops.select_cpu() or
  2097		 * ops.enqueue() by spoiling direct_dispatch_task with a non-NULL value
  2098		 * which can never match a valid task pointer.
  2099		 */
  2100		__this_cpu_write(direct_dispatch_task, ERR_PTR(-ESRCH));
  2101	
  2102		/* @p must match the task on the enqueue path */
  2103		if (unlikely(p != ddsp_task)) {
  2104			if (IS_ERR(ddsp_task))
  2105				scx_ops_error("%s[%d] already direct-dispatched",
  2106					      p->comm, p->pid);
  2107			else
  2108				scx_ops_error("scheduling for %s[%d] but trying to direct-dispatch %s[%d]",
  2109					      ddsp_task->comm, ddsp_task->pid,
  2110					      p->comm, p->pid);
  2111			return;
  2112		}
  2113	
  2114		WARN_ON_ONCE(p->scx.ddsp_dsq_id != SCX_DSQ_INVALID);
  2115		WARN_ON_ONCE(p->scx.ddsp_enq_flags);
  2116	
  2117		p->scx.ddsp_dsq_id = dsq_id;
  2118		p->scx.ddsp_enq_flags = enq_flags;
  2119	}
  2120	
  2121	static void direct_dispatch(struct task_struct *p, u64 enq_flags)
  2122	{
  2123		struct rq *rq = task_rq(p);
  2124		struct scx_dispatch_q *dsq =
  2125			find_dsq_for_dispatch(rq, p->scx.ddsp_dsq_id, p);
  2126	
  2127		touch_core_sched_dispatch(rq, p);
  2128	
  2129		p->scx.ddsp_enq_flags |= enq_flags;
  2130	
  2131		/*
  2132		 * We are in the enqueue path with @rq locked and pinned, and thus can't
  2133		 * double lock a remote rq and enqueue to its local DSQ. For
  2134		 * DSQ_LOCAL_ON verdicts targeting the local DSQ of a remote CPU, defer
  2135		 * the enqueue so that it's executed when @rq can be unlocked.
  2136		 */
  2137		if (dsq->id == SCX_DSQ_LOCAL && dsq != &rq->scx.local_dsq) {
  2138			unsigned long opss;
  2139	
  2140			opss = atomic_long_read(&p->scx.ops_state) & SCX_OPSS_STATE_MASK;
  2141	
  2142			switch (opss & SCX_OPSS_STATE_MASK) {
  2143			case SCX_OPSS_NONE:
  2144				break;
  2145			case SCX_OPSS_QUEUEING:
  2146				/*
  2147				 * As @p was never passed to the BPF side, _release is
  2148				 * not strictly necessary. Still do it for consistency.
  2149				 */
  2150				atomic_long_set_release(&p->scx.ops_state, SCX_OPSS_NONE);
  2151				break;
  2152			default:
  2153				WARN_ONCE(true, "sched_ext: %s[%d] has invalid ops state 0x%lx in direct_dispatch()",
  2154					  p->comm, p->pid, opss);
  2155				atomic_long_set_release(&p->scx.ops_state, SCX_OPSS_NONE);
  2156				break;
  2157			}
  2158	
  2159			WARN_ON_ONCE(p->scx.dsq || !list_empty(&p->scx.dsq_list.node));
  2160			list_add_tail(&p->scx.dsq_list.node,
  2161				      &rq->scx.ddsp_deferred_locals);
  2162			schedule_deferred(rq);
  2163			return;
  2164		}
  2165	
  2166		dispatch_enqueue(dsq, p, p->scx.ddsp_enq_flags | SCX_ENQ_CLEAR_OPSS);
  2167	}
  2168	
  2169	static bool scx_rq_online(struct rq *rq)
  2170	{
  2171		/*
  2172		 * Test both cpu_active() and %SCX_RQ_ONLINE. %SCX_RQ_ONLINE indicates
  2173		 * the online state as seen from the BPF scheduler. cpu_active() test
  2174		 * guarantees that, if this function returns %true, %SCX_RQ_ONLINE will
  2175		 * stay set until the current scheduling operation is complete even if
  2176		 * we aren't locking @rq.
  2177		 */
  2178		return likely((rq->scx.flags & SCX_RQ_ONLINE) && cpu_active(cpu_of(rq)));
  2179	}
  2180	
  2181	static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
  2182				    int sticky_cpu)
  2183	{
  2184		struct task_struct **ddsp_taskp;
  2185		unsigned long qseq;
  2186	
  2187		WARN_ON_ONCE(!(p->scx.flags & SCX_TASK_QUEUED));
  2188	
  2189		/* rq migration */
  2190		if (sticky_cpu == cpu_of(rq))
  2191			goto local_norefill;
  2192	
  2193		/*
  2194		 * If !scx_rq_online(), we already told the BPF scheduler that the CPU
  2195		 * is offline and are just running the hotplug path. Don't bother the
  2196		 * BPF scheduler.
  2197		 */
  2198		if (!scx_rq_online(rq))
  2199			goto local;
  2200	
  2201		if (scx_rq_bypassing(rq)) {
  2202			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
  2203			goto global;
  2204		}
  2205	
  2206		if (p->scx.ddsp_dsq_id != SCX_DSQ_INVALID)
  2207			goto direct;
  2208	
  2209		/* see %SCX_OPS_ENQ_EXITING */
  2210		if (!static_branch_unlikely(&scx_ops_enq_exiting) &&
  2211		    unlikely(p->flags & PF_EXITING)) {
  2212			__scx_add_event(SCX_EV_ENQ_SKIP_EXITING, 1);
  2213			goto local;
  2214		}
  2215	
  2216		/* see %SCX_OPS_ENQ_MIGRATION_DISABLED */
  2217		if (!static_branch_unlikely(&scx_ops_enq_migration_disabled) &&
  2218		    is_migration_disabled(p)) {
  2219			__scx_add_event(SCX_EV_ENQ_SKIP_MIGRATION_DISABLED, 1);
  2220			goto local;
  2221		}
  2222	
  2223		if (!SCX_HAS_OP(enqueue))
  2224			goto global;
  2225	
  2226		/* DSQ bypass didn't trigger, enqueue on the BPF scheduler */
  2227		qseq = rq->scx.ops_qseq++ << SCX_OPSS_QSEQ_SHIFT;
  2228	
  2229		WARN_ON_ONCE(atomic_long_read(&p->scx.ops_state) != SCX_OPSS_NONE);
  2230		atomic_long_set(&p->scx.ops_state, SCX_OPSS_QUEUEING | qseq);
  2231	
  2232		ddsp_taskp = this_cpu_ptr(&direct_dispatch_task);
  2233		WARN_ON_ONCE(*ddsp_taskp);
  2234		*ddsp_taskp = p;
  2235	
  2236		SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, enqueue, p, enq_flags);
  2237	
  2238		*ddsp_taskp = NULL;
  2239		if (p->scx.ddsp_dsq_id != SCX_DSQ_INVALID)
  2240			goto direct;
  2241	
  2242		/*
  2243		 * If not directly dispatched, QUEUEING isn't clear yet and dispatch or
  2244		 * dequeue may be waiting. The store_release matches their load_acquire.
  2245		 */
  2246		atomic_long_set_release(&p->scx.ops_state, SCX_OPSS_QUEUED | qseq);
  2247		return;
  2248	
  2249	direct:
  2250		direct_dispatch(p, enq_flags);
  2251		return;
  2252	
  2253	local:
  2254		/*
  2255		 * For task-ordering, slice refill must be treated as implying the end
  2256		 * of the current slice. Otherwise, the longer @p stays on the CPU, the
  2257		 * higher priority it becomes from scx_prio_less()'s POV.
  2258		 */
  2259		touch_core_sched(rq, p);
  2260		p->scx.slice = SCX_SLICE_DFL;
  2261		__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
  2262	local_norefill:
  2263		dispatch_enqueue(&rq->scx.local_dsq, p, enq_flags);
  2264		return;
  2265	
  2266	global:
  2267		touch_core_sched(rq, p);	/* see the comment in local: */
  2268		p->scx.slice = SCX_SLICE_DFL;
  2269		__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
  2270		dispatch_enqueue(find_global_dsq(p), p, enq_flags);
  2271	}
  2272	
  2273	static bool task_runnable(const struct task_struct *p)
  2274	{
  2275		return !list_empty(&p->scx.runnable_node);
  2276	}
  2277	
  2278	static void set_task_runnable(struct rq *rq, struct task_struct *p)
  2279	{
  2280		lockdep_assert_rq_held(rq);
  2281	
  2282		if (p->scx.flags & SCX_TASK_RESET_RUNNABLE_AT) {
  2283			p->scx.runnable_at = jiffies;
  2284			p->scx.flags &= ~SCX_TASK_RESET_RUNNABLE_AT;
  2285		}
  2286	
  2287		/*
  2288		 * list_add_tail() must be used. scx_ops_bypass() depends on tasks being
  2289		 * appended to the runnable_list.
  2290		 */
  2291		list_add_tail(&p->scx.runnable_node, &rq->scx.runnable_list);
  2292	}
  2293	
  2294	static void clr_task_runnable(struct task_struct *p, bool reset_runnable_at)
  2295	{
  2296		list_del_init(&p->scx.runnable_node);
  2297		if (reset_runnable_at)
  2298			p->scx.flags |= SCX_TASK_RESET_RUNNABLE_AT;
  2299	}
  2300	
  2301	static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags)
  2302	{
  2303		int sticky_cpu = p->scx.sticky_cpu;
  2304	
  2305		if (enq_flags & ENQUEUE_WAKEUP)
  2306			rq->scx.flags |= SCX_RQ_IN_WAKEUP;
  2307	
  2308		enq_flags |= rq->scx.extra_enq_flags;
  2309	
  2310		if (sticky_cpu >= 0)
  2311			p->scx.sticky_cpu = -1;
  2312	
  2313		/*
  2314		 * Restoring a running task will be immediately followed by
  2315		 * set_next_task_scx() which expects the task to not be on the BPF
  2316		 * scheduler as tasks can only start running through local DSQs. Force
  2317		 * direct-dispatch into the local DSQ by setting the sticky_cpu.
  2318		 */
  2319		if (unlikely(enq_flags & ENQUEUE_RESTORE) && task_current(rq, p))
  2320			sticky_cpu = cpu_of(rq);
  2321	
  2322		if (p->scx.flags & SCX_TASK_QUEUED) {
  2323			WARN_ON_ONCE(!task_runnable(p));
  2324			goto out;
  2325		}
  2326	
  2327		set_task_runnable(rq, p);
  2328		p->scx.flags |= SCX_TASK_QUEUED;
  2329		rq->scx.nr_running++;
  2330		add_nr_running(rq, 1);
  2331	
  2332		if (SCX_HAS_OP(runnable) && !task_on_rq_migrating(p))
  2333			SCX_CALL_OP_TASK(SCX_KF_REST, runnable, p, enq_flags);
  2334	
  2335		if (enq_flags & SCX_ENQ_WAKEUP)
  2336			touch_core_sched(rq, p);
  2337	
  2338		do_enqueue_task(rq, p, enq_flags, sticky_cpu);
  2339	out:
  2340		rq->scx.flags &= ~SCX_RQ_IN_WAKEUP;
  2341	
  2342		if ((enq_flags & SCX_ENQ_CPU_SELECTED) &&
  2343		    unlikely(cpu_of(rq) != p->scx.selected_cpu))
  2344			__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);
  2345	}
  2346	
  2347	static void ops_dequeue(struct task_struct *p, u64 deq_flags)
  2348	{
  2349		unsigned long opss;
  2350	
  2351		/* dequeue is always temporary, don't reset runnable_at */
  2352		clr_task_runnable(p, false);
  2353	
  2354		/* acquire ensures that we see the preceding updates on QUEUED */
  2355		opss = atomic_long_read_acquire(&p->scx.ops_state);
  2356	
  2357		switch (opss & SCX_OPSS_STATE_MASK) {
  2358		case SCX_OPSS_NONE:
  2359			break;
  2360		case SCX_OPSS_QUEUEING:
  2361			/*
  2362			 * QUEUEING is started and finished while holding @p's rq lock.
  2363			 * As we're holding the rq lock now, we shouldn't see QUEUEING.
  2364			 */
  2365			BUG();
  2366		case SCX_OPSS_QUEUED:
  2367			if (SCX_HAS_OP(dequeue))
  2368				SCX_CALL_OP_TASK(SCX_KF_REST, dequeue, p, deq_flags);
  2369	
  2370			if (atomic_long_try_cmpxchg(&p->scx.ops_state, &opss,
  2371						    SCX_OPSS_NONE))
  2372				break;
  2373			fallthrough;
  2374		case SCX_OPSS_DISPATCHING:
  2375			/*
  2376			 * If @p is being dispatched from the BPF scheduler to a DSQ,
  2377			 * wait for the transfer to complete so that @p doesn't get
  2378			 * added to its DSQ after dequeueing is complete.
  2379			 *
  2380			 * As we're waiting on DISPATCHING with the rq locked, the
  2381			 * dispatching side shouldn't try to lock the rq while
  2382			 * DISPATCHING is set. See dispatch_to_local_dsq().
  2383			 *
  2384			 * DISPATCHING shouldn't have qseq set and control can reach
  2385			 * here with NONE @opss from the above QUEUED case block.
  2386			 * Explicitly wait on %SCX_OPSS_DISPATCHING instead of @opss.
  2387			 */
  2388			wait_ops_state(p, SCX_OPSS_DISPATCHING);
  2389			BUG_ON(atomic_long_read(&p->scx.ops_state) != SCX_OPSS_NONE);
  2390			break;
  2391		}
  2392	}
  2393	
  2394	static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags)
  2395	{
  2396		if (!(p->scx.flags & SCX_TASK_QUEUED)) {
  2397			WARN_ON_ONCE(task_runnable(p));
  2398			return true;
  2399		}
  2400	
  2401		ops_dequeue(p, deq_flags);
  2402	
  2403		/*
  2404		 * A currently running task which is going off @rq first gets dequeued
  2405		 * and then stops running. As we want running <-> stopping transitions
  2406		 * to be contained within runnable <-> quiescent transitions, trigger
  2407		 * ->stopping() early here instead of in put_prev_task_scx().
  2408		 *
  2409		 * @p may go through multiple stopping <-> running transitions between
  2410		 * here and put_prev_task_scx() if task attribute changes occur while
  2411		 * balance_scx() leaves @rq unlocked. However, they don't contain any
  2412		 * information meaningful to the BPF scheduler and can be suppressed by
  2413		 * skipping the callbacks if the task is !QUEUED.
  2414		 */
  2415		if (SCX_HAS_OP(stopping) && task_current(rq, p)) {
  2416			update_curr_scx(rq);
  2417			SCX_CALL_OP_TASK(SCX_KF_REST, stopping, p, false);
  2418		}
  2419	
  2420		if (SCX_HAS_OP(quiescent) && !task_on_rq_migrating(p))
  2421			SCX_CALL_OP_TASK(SCX_KF_REST, quiescent, p, deq_flags);
  2422	
  2423		if (deq_flags & SCX_DEQ_SLEEP)
  2424			p->scx.flags |= SCX_TASK_DEQD_FOR_SLEEP;
  2425		else
  2426			p->scx.flags &= ~SCX_TASK_DEQD_FOR_SLEEP;
  2427	
  2428		p->scx.flags &= ~SCX_TASK_QUEUED;
  2429		rq->scx.nr_running--;
  2430		sub_nr_running(rq, 1);
  2431	
  2432		dispatch_dequeue(rq, p);
  2433		return true;
  2434	}
  2435	
  2436	static void yield_task_scx(struct rq *rq)
  2437	{
  2438		struct task_struct *p = rq->curr;
  2439	
  2440		if (SCX_HAS_OP(yield))
  2441			SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, p, NULL);
  2442		else
  2443			p->scx.slice = 0;
  2444	}
  2445	
  2446	static bool yield_to_task_scx(struct rq *rq, struct task_struct *to)
  2447	{
  2448		struct task_struct *from = rq->curr;
  2449	
  2450		if (SCX_HAS_OP(yield))
  2451			return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, from, to);
  2452		else
  2453			return false;
  2454	}
  2455	
  2456	static void move_local_task_to_local_dsq(struct task_struct *p, u64 enq_flags,
  2457						 struct scx_dispatch_q *src_dsq,
  2458						 struct rq *dst_rq)
  2459	{
  2460		struct scx_dispatch_q *dst_dsq = &dst_rq->scx.local_dsq;
  2461	
  2462		/* @dsq is locked and @p is on @dst_rq */
  2463		lockdep_assert_held(&src_dsq->lock);
  2464		lockdep_assert_rq_held(dst_rq);
  2465	
  2466		WARN_ON_ONCE(p->scx.holding_cpu >= 0);
  2467	
  2468		if (enq_flags & (SCX_ENQ_HEAD | SCX_ENQ_PREEMPT))
  2469			list_add(&p->scx.dsq_list.node, &dst_dsq->list);
  2470		else
  2471			list_add_tail(&p->scx.dsq_list.node, &dst_dsq->list);
  2472	
  2473		dsq_mod_nr(dst_dsq, 1);
  2474		p->scx.dsq = dst_dsq;
  2475	}
  2476	
  2477	#ifdef CONFIG_SMP
  2478	/**
  2479	 * move_remote_task_to_local_dsq - Move a task from a foreign rq to a local DSQ
  2480	 * @p: task to move
  2481	 * @enq_flags: %SCX_ENQ_*
  2482	 * @src_rq: rq to move the task from, locked on entry, released on return
  2483	 * @dst_rq: rq to move the task into, locked on return
  2484	 *
  2485	 * Move @p which is currently on @src_rq to @dst_rq's local DSQ.
  2486	 */
  2487	static void move_remote_task_to_local_dsq(struct task_struct *p, u64 enq_flags,
  2488						  struct rq *src_rq, struct rq *dst_rq)
  2489	{
  2490		lockdep_assert_rq_held(src_rq);
  2491	
  2492		/* the following marks @p MIGRATING which excludes dequeue */
  2493		deactivate_task(src_rq, p, 0);
  2494		set_task_cpu(p, cpu_of(dst_rq));
  2495		p->scx.sticky_cpu = cpu_of(dst_rq);
  2496	
  2497		raw_spin_rq_unlock(src_rq);
  2498		raw_spin_rq_lock(dst_rq);
  2499	
  2500		/*
  2501		 * We want to pass scx-specific enq_flags but activate_task() will
  2502		 * truncate the upper 32 bit. As we own @rq, we can pass them through
  2503		 * @rq->scx.extra_enq_flags instead.
  2504		 */
  2505		WARN_ON_ONCE(!cpumask_test_cpu(cpu_of(dst_rq), p->cpus_ptr));
  2506		WARN_ON_ONCE(dst_rq->scx.extra_enq_flags);
  2507		dst_rq->scx.extra_enq_flags = enq_flags;
  2508		activate_task(dst_rq, p, 0);
  2509		dst_rq->scx.extra_enq_flags = 0;
  2510	}
  2511	
  2512	/*
  2513	 * Similar to kernel/sched/core.c::is_cpu_allowed(). However, there are two
  2514	 * differences:
  2515	 *
  2516	 * - is_cpu_allowed() asks "Can this task run on this CPU?" while
  2517	 *   task_can_run_on_remote_rq() asks "Can the BPF scheduler migrate the task to
  2518	 *   this CPU?".
  2519	 *
  2520	 *   While migration is disabled, is_cpu_allowed() has to say "yes" as the task
  2521	 *   must be allowed to finish on the CPU that it's currently on regardless of
  2522	 *   the CPU state. However, task_can_run_on_remote_rq() must say "no" as the
  2523	 *   BPF scheduler shouldn't attempt to migrate a task which has migration
  2524	 *   disabled.
  2525	 *
  2526	 * - The BPF scheduler is bypassed while the rq is offline and we can always say
  2527	 *   no to the BPF scheduler initiated migrations while offline.
  2528	 *
  2529	 * The caller must ensure that @p and @rq are on different CPUs.
  2530	 */
  2531	static bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq,
  2532					      bool enforce)
  2533	{
  2534		int cpu = cpu_of(rq);
  2535	
  2536		SCHED_WARN_ON(task_cpu(p) == cpu);
  2537	
  2538		/*
  2539		 * If @p has migration disabled, @p->cpus_ptr is updated to contain only
  2540		 * the pinned CPU in migrate_disable_switch() while @p is being switched
  2541		 * out. However, put_prev_task_scx() is called before @p->cpus_ptr is
  2542		 * updated and thus another CPU may see @p on a DSQ inbetween leading to
  2543		 * @p passing the below task_allowed_on_cpu() check while migration is
  2544		 * disabled.
  2545		 *
  2546		 * Test the migration disabled state first as the race window is narrow
  2547		 * and the BPF scheduler failing to check migration disabled state can
  2548		 * easily be masked if task_allowed_on_cpu() is done first.
  2549		 */
  2550		if (unlikely(is_migration_disabled(p))) {
  2551			if (enforce)
  2552				scx_ops_error("SCX_DSQ_LOCAL[_ON] cannot move migration disabled %s[%d] from CPU %d to %d",
  2553					      p->comm, p->pid, task_cpu(p), cpu);
  2554			return false;
  2555		}
  2556	
  2557		/*
  2558		 * We don't require the BPF scheduler to avoid dispatching to offline
  2559		 * CPUs mostly for convenience but also because CPUs can go offline
  2560		 * between scx_bpf_dsq_insert() calls and here. Trigger error iff the
  2561		 * picked CPU is outside the allowed mask.
  2562		 */
  2563		if (!task_allowed_on_cpu(p, cpu)) {
  2564			if (enforce)
  2565				scx_ops_error("SCX_DSQ_LOCAL[_ON] target CPU %d not allowed for %s[%d]",
  2566					      cpu, p->comm, p->pid);
  2567			return false;
  2568		}
  2569	
  2570		if (!scx_rq_online(rq)) {
  2571			if (enforce)
  2572				__scx_add_event(SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE, 1);
  2573			return false;
  2574		}
  2575	
  2576		return true;
  2577	}
  2578	
  2579	/**
  2580	 * unlink_dsq_and_lock_src_rq() - Unlink task from its DSQ and lock its task_rq
  2581	 * @p: target task
  2582	 * @dsq: locked DSQ @p is currently on
  2583	 * @src_rq: rq @p is currently on, stable with @dsq locked
  2584	 *
  2585	 * Called with @dsq locked but no rq's locked. We want to move @p to a different
  2586	 * DSQ, including any local DSQ, but are not locking @src_rq. Locking @src_rq is
  2587	 * required when transferring into a local DSQ. Even when transferring into a
  2588	 * non-local DSQ, it's better to use the same mechanism to protect against
  2589	 * dequeues and maintain the invariant that @p->scx.dsq can only change while
  2590	 * @src_rq is locked, which e.g. scx_dump_task() depends on.
  2591	 *
  2592	 * We want to grab @src_rq but that can deadlock if we try while locking @dsq,
  2593	 * so we want to unlink @p from @dsq, drop its lock and then lock @src_rq. As
  2594	 * this may race with dequeue, which can't drop the rq lock or fail, do a little
  2595	 * dancing from our side.
  2596	 *
  2597	 * @p->scx.holding_cpu is set to this CPU before @dsq is unlocked. If @p gets
  2598	 * dequeued after we unlock @dsq but before locking @src_rq, the holding_cpu
  2599	 * would be cleared to -1. While other cpus may have updated it to different
  2600	 * values afterwards, as this operation can't be preempted or recurse, the
  2601	 * holding_cpu can never become this CPU again before we're done. Thus, we can
  2602	 * tell whether we lost to dequeue by testing whether the holding_cpu still
  2603	 * points to this CPU. See dispatch_dequeue() for the counterpart.
  2604	 *
  2605	 * On return, @dsq is unlocked and @src_rq is locked. Returns %true if @p is
  2606	 * still valid. %false if lost to dequeue.
  2607	 */
  2608	static bool unlink_dsq_and_lock_src_rq(struct task_struct *p,
  2609					       struct scx_dispatch_q *dsq,
  2610					       struct rq *src_rq)
  2611	{
  2612		s32 cpu = raw_smp_processor_id();
  2613	
  2614		lockdep_assert_held(&dsq->lock);
  2615	
  2616		WARN_ON_ONCE(p->scx.holding_cpu >= 0);
  2617		task_unlink_from_dsq(p, dsq);
  2618		p->scx.holding_cpu = cpu;
  2619	
  2620		raw_spin_unlock(&dsq->lock);
  2621		raw_spin_rq_lock(src_rq);
  2622	
  2623		/* task_rq couldn't have changed if we're still the holding cpu */
  2624		return likely(p->scx.holding_cpu == cpu) &&
  2625			!WARN_ON_ONCE(src_rq != task_rq(p));
  2626	}
  2627	
  2628	static bool consume_remote_task(struct rq *this_rq, struct task_struct *p,
  2629					struct scx_dispatch_q *dsq, struct rq *src_rq)
  2630	{
  2631		raw_spin_rq_unlock(this_rq);
  2632	
  2633		if (unlink_dsq_and_lock_src_rq(p, dsq, src_rq)) {
  2634			move_remote_task_to_local_dsq(p, 0, src_rq, this_rq);
  2635			return true;
  2636		} else {
  2637			raw_spin_rq_unlock(src_rq);
  2638			raw_spin_rq_lock(this_rq);
  2639			return false;
  2640		}
  2641	}
  2642	#else	/* CONFIG_SMP */
  2643	static inline void move_remote_task_to_local_dsq(struct task_struct *p, u64 enq_flags, struct rq *src_rq, struct rq *dst_rq) { WARN_ON_ONCE(1); }
  2644	static inline bool task_can_run_on_remote_rq(struct task_struct *p, struct rq *rq, bool enforce) { return false; }
  2645	static inline bool consume_remote_task(struct rq *this_rq, struct task_struct *p, struct scx_dispatch_q *dsq, struct rq *task_rq) { return false; }
  2646	#endif	/* CONFIG_SMP */
  2647	
  2648	/**
  2649	 * move_task_between_dsqs() - Move a task from one DSQ to another
  2650	 * @p: target task
  2651	 * @enq_flags: %SCX_ENQ_*
  2652	 * @src_dsq: DSQ @p is currently on, must not be a local DSQ
  2653	 * @dst_dsq: DSQ @p is being moved to, can be any DSQ
  2654	 *
  2655	 * Must be called with @p's task_rq and @src_dsq locked. If @dst_dsq is a local
  2656	 * DSQ and @p is on a different CPU, @p will be migrated and thus its task_rq
  2657	 * will change. As @p's task_rq is locked, this function doesn't need to use the
  2658	 * holding_cpu mechanism.
  2659	 *
  2660	 * On return, @src_dsq is unlocked and only @p's new task_rq, which is the
  2661	 * return value, is locked.
  2662	 */
  2663	static struct rq *move_task_between_dsqs(struct task_struct *p, u64 enq_flags,
  2664						 struct scx_dispatch_q *src_dsq,
  2665						 struct scx_dispatch_q *dst_dsq)
  2666	{
  2667		struct rq *src_rq = task_rq(p), *dst_rq;
  2668	
  2669		BUG_ON(src_dsq->id == SCX_DSQ_LOCAL);
  2670		lockdep_assert_held(&src_dsq->lock);
  2671		lockdep_assert_rq_held(src_rq);
  2672	
  2673		if (dst_dsq->id == SCX_DSQ_LOCAL) {
  2674			dst_rq = container_of(dst_dsq, struct rq, scx.local_dsq);
  2675			if (src_rq != dst_rq &&
  2676			    unlikely(!task_can_run_on_remote_rq(p, dst_rq, true))) {
  2677				dst_dsq = find_global_dsq(p);
  2678				dst_rq = src_rq;
  2679			}
  2680		} else {
  2681			/* no need to migrate if destination is a non-local DSQ */
  2682			dst_rq = src_rq;
  2683		}
  2684	
  2685		/*
  2686		 * Move @p into $dst_dsq. If $dst_dsq is the local DSQ of a different
  2687		 * CPU, @p will be migrated.
  2688		 */
  2689		if (dst_dsq->id == SCX_DSQ_LOCAL) {
  2690			/* @p is going from a non-local DSQ to a local DSQ */
  2691			if (src_rq == dst_rq) {
  2692				task_unlink_from_dsq(p, src_dsq);
  2693				move_local_task_to_local_dsq(p, enq_flags,
  2694							     src_dsq, dst_rq);
  2695				raw_spin_unlock(&src_dsq->lock);
  2696			} else {
  2697				raw_spin_unlock(&src_dsq->lock);
  2698				move_remote_task_to_local_dsq(p, enq_flags,
  2699							      src_rq, dst_rq);
  2700			}
  2701		} else {
  2702			/*
  2703			 * @p is going from a non-local DSQ to a non-local DSQ. As
  2704			 * $src_dsq is already locked, do an abbreviated dequeue.
  2705			 */
  2706			task_unlink_from_dsq(p, src_dsq);
  2707			p->scx.dsq = NULL;
  2708			raw_spin_unlock(&src_dsq->lock);
  2709	
  2710			dispatch_enqueue(dst_dsq, p, enq_flags);
  2711		}
  2712	
  2713		return dst_rq;
  2714	}
  2715	
  2716	/*
  2717	 * A poorly behaving BPF scheduler can live-lock the system by e.g. incessantly
  2718	 * banging on the same DSQ on a large NUMA system to the point where switching
  2719	 * to the bypass mode can take a long time. Inject artificial delays while the
  2720	 * bypass mode is switching to guarantee timely completion.
  2721	 */
  2722	static void scx_ops_breather(struct rq *rq)
  2723	{
  2724		u64 until;
  2725	
  2726		lockdep_assert_rq_held(rq);
  2727	
  2728		if (likely(!atomic_read(&scx_ops_breather_depth)))
  2729			return;
  2730	
  2731		raw_spin_rq_unlock(rq);
  2732	
  2733		until = ktime_get_ns() + NSEC_PER_MSEC;
  2734	
  2735		do {
  2736			int cnt = 1024;
  2737			while (atomic_read(&scx_ops_breather_depth) && --cnt)
  2738				cpu_relax();
  2739		} while (atomic_read(&scx_ops_breather_depth) &&
  2740			 time_before64(ktime_get_ns(), until));
  2741	
  2742		raw_spin_rq_lock(rq);
  2743	}
  2744	
  2745	static bool consume_dispatch_q(struct rq *rq, struct scx_dispatch_q *dsq)
  2746	{
  2747		struct task_struct *p;
  2748	retry:
  2749		/*
  2750		 * This retry loop can repeatedly race against scx_ops_bypass()
  2751		 * dequeueing tasks from @dsq trying to put the system into the bypass
  2752		 * mode. On some multi-socket machines (e.g. 2x Intel 8480c), this can
  2753		 * live-lock the machine into soft lockups. Give a breather.
  2754		 */
  2755		scx_ops_breather(rq);
  2756	
  2757		/*
  2758		 * The caller can't expect to successfully consume a task if the task's
  2759		 * addition to @dsq isn't guaranteed to be visible somehow. Test
  2760		 * @dsq->list without locking and skip if it seems empty.
  2761		 */
  2762		if (list_empty(&dsq->list))
  2763			return false;
  2764	
  2765		raw_spin_lock(&dsq->lock);
  2766	
  2767		nldsq_for_each_task(p, dsq) {
  2768			struct rq *task_rq = task_rq(p);
  2769	
  2770			if (rq == task_rq) {
  2771				task_unlink_from_dsq(p, dsq);
  2772				move_local_task_to_local_dsq(p, 0, dsq, rq);
  2773				raw_spin_unlock(&dsq->lock);
  2774				return true;
  2775			}
  2776	
  2777			if (task_can_run_on_remote_rq(p, rq, false)) {
  2778				if (likely(consume_remote_task(rq, p, dsq, task_rq)))
  2779					return true;
  2780				goto retry;
  2781			}
  2782		}
  2783	
  2784		raw_spin_unlock(&dsq->lock);
  2785		return false;
  2786	}
  2787	
  2788	static bool consume_global_dsq(struct rq *rq)
  2789	{
  2790		int node = cpu_to_node(cpu_of(rq));
  2791	
  2792		return consume_dispatch_q(rq, global_dsqs[node]);
  2793	}
  2794	
  2795	/**
  2796	 * dispatch_to_local_dsq - Dispatch a task to a local dsq
  2797	 * @rq: current rq which is locked
  2798	 * @dst_dsq: destination DSQ
  2799	 * @p: task to dispatch
  2800	 * @enq_flags: %SCX_ENQ_*
  2801	 *
  2802	 * We're holding @rq lock and want to dispatch @p to @dst_dsq which is a local
  2803	 * DSQ. This function performs all the synchronization dancing needed because
  2804	 * local DSQs are protected with rq locks.
  2805	 *
  2806	 * The caller must have exclusive ownership of @p (e.g. through
  2807	 * %SCX_OPSS_DISPATCHING).
  2808	 */
  2809	static void dispatch_to_local_dsq(struct rq *rq, struct scx_dispatch_q *dst_dsq,
  2810					  struct task_struct *p, u64 enq_flags)
  2811	{
  2812		struct rq *src_rq = task_rq(p);
  2813		struct rq *dst_rq = container_of(dst_dsq, struct rq, scx.local_dsq);
  2814	#ifdef CONFIG_SMP
  2815		struct rq *locked_rq = rq;
  2816	#endif
  2817	
  2818		/*
  2819		 * We're synchronized against dequeue through DISPATCHING. As @p can't
  2820		 * be dequeued, its task_rq and cpus_allowed are stable too.
  2821		 *
  2822		 * If dispatching to @rq that @p is already on, no lock dancing needed.
  2823		 */
  2824		if (rq == src_rq && rq == dst_rq) {
  2825			dispatch_enqueue(dst_dsq, p, enq_flags | SCX_ENQ_CLEAR_OPSS);
  2826			return;
  2827		}
  2828	
  2829	#ifdef CONFIG_SMP
  2830		if (src_rq != dst_rq &&
  2831		    unlikely(!task_can_run_on_remote_rq(p, dst_rq, true))) {
  2832			dispatch_enqueue(find_global_dsq(p), p,
  2833					 enq_flags | SCX_ENQ_CLEAR_OPSS);
  2834			return;
  2835		}
  2836	
  2837		/*
  2838		 * @p is on a possibly remote @src_rq which we need to lock to move the
  2839		 * task. If dequeue is in progress, it'd be locking @src_rq and waiting
  2840		 * on DISPATCHING, so we can't grab @src_rq lock while holding
  2841		 * DISPATCHING.
  2842		 *
  2843		 * As DISPATCHING guarantees that @p is wholly ours, we can pretend that
  2844		 * we're moving from a DSQ and use the same mechanism - mark the task
  2845		 * under transfer with holding_cpu, release DISPATCHING and then follow
  2846		 * the same protocol. See unlink_dsq_and_lock_src_rq().
  2847		 */
  2848		p->scx.holding_cpu = raw_smp_processor_id();
  2849	
  2850		/* store_release ensures that dequeue sees the above */
  2851		atomic_long_set_release(&p->scx.ops_state, SCX_OPSS_NONE);
  2852	
  2853		/* switch to @src_rq lock */
  2854		if (locked_rq != src_rq) {
  2855			raw_spin_rq_unlock(locked_rq);
  2856			locked_rq = src_rq;
  2857			raw_spin_rq_lock(src_rq);
  2858		}
  2859	
  2860		/* task_rq couldn't have changed if we're still the holding cpu */
  2861		if (likely(p->scx.holding_cpu == raw_smp_processor_id()) &&
  2862		    !WARN_ON_ONCE(src_rq != task_rq(p))) {
  2863			/*
  2864			 * If @p is staying on the same rq, there's no need to go
  2865			 * through the full deactivate/activate cycle. Optimize by
  2866			 * abbreviating move_remote_task_to_local_dsq().
  2867			 */
  2868			if (src_rq == dst_rq) {
  2869				p->scx.holding_cpu = -1;
  2870				dispatch_enqueue(&dst_rq->scx.local_dsq, p, enq_flags);
  2871			} else {
  2872				move_remote_task_to_local_dsq(p, enq_flags,
  2873							      src_rq, dst_rq);
  2874				/* task has been moved to dst_rq, which is now locked */
  2875				locked_rq = dst_rq;
  2876			}
  2877	
  2878			/* if the destination CPU is idle, wake it up */
  2879			if (sched_class_above(p->sched_class, dst_rq->curr->sched_class))
  2880				resched_curr(dst_rq);
  2881		}
  2882	
  2883		/* switch back to @rq lock */
  2884		if (locked_rq != rq) {
  2885			raw_spin_rq_unlock(locked_rq);
  2886			raw_spin_rq_lock(rq);
  2887		}
  2888	#else	/* CONFIG_SMP */
  2889		BUG();	/* control can not reach here on UP */
  2890	#endif	/* CONFIG_SMP */
  2891	}
  2892	
  2893	/**
  2894	 * finish_dispatch - Asynchronously finish dispatching a task
  2895	 * @rq: current rq which is locked
  2896	 * @p: task to finish dispatching
  2897	 * @qseq_at_dispatch: qseq when @p started getting dispatched
  2898	 * @dsq_id: destination DSQ ID
  2899	 * @enq_flags: %SCX_ENQ_*
  2900	 *
  2901	 * Dispatching to local DSQs may need to wait for queueing to complete or
  2902	 * require rq lock dancing. As we don't wanna do either while inside
  2903	 * ops.dispatch() to avoid locking order inversion, we split dispatching into
  2904	 * two parts. scx_bpf_dsq_insert() which is called by ops.dispatch() records the
  2905	 * task and its qseq. Once ops.dispatch() returns, this function is called to
  2906	 * finish up.
  2907	 *
  2908	 * There is no guarantee that @p is still valid for dispatching or even that it
  2909	 * was valid in the first place. Make sure that the task is still owned by the
  2910	 * BPF scheduler and claim the ownership before dispatching.
  2911	 */
  2912	static void finish_dispatch(struct rq *rq, struct task_struct *p,
  2913				    unsigned long qseq_at_dispatch,
  2914				    u64 dsq_id, u64 enq_flags)
  2915	{
  2916		struct scx_dispatch_q *dsq;
  2917		unsigned long opss;
  2918	
  2919		touch_core_sched_dispatch(rq, p);
  2920	retry:
  2921		/*
  2922		 * No need for _acquire here. @p is accessed only after a successful
  2923		 * try_cmpxchg to DISPATCHING.
  2924		 */
  2925		opss = atomic_long_read(&p->scx.ops_state);
  2926	
  2927		switch (opss & SCX_OPSS_STATE_MASK) {
  2928		case SCX_OPSS_DISPATCHING:
  2929		case SCX_OPSS_NONE:
  2930			/* someone else already got to it */
  2931			return;
  2932		case SCX_OPSS_QUEUED:
  2933			/*
  2934			 * If qseq doesn't match, @p has gone through at least one
  2935			 * dispatch/dequeue and re-enqueue cycle between
  2936			 * scx_bpf_dsq_insert() and here and we have no claim on it.
  2937			 */
  2938			if ((opss & SCX_OPSS_QSEQ_MASK) != qseq_at_dispatch)
  2939				return;
  2940	
  2941			/*
  2942			 * While we know @p is accessible, we don't yet have a claim on
  2943			 * it - the BPF scheduler is allowed to dispatch tasks
  2944			 * spuriously and there can be a racing dequeue attempt. Let's
  2945			 * claim @p by atomically transitioning it from QUEUED to
  2946			 * DISPATCHING.
  2947			 */
  2948			if (likely(atomic_long_try_cmpxchg(&p->scx.ops_state, &opss,
  2949							   SCX_OPSS_DISPATCHING)))
  2950				break;
  2951			goto retry;
  2952		case SCX_OPSS_QUEUEING:
  2953			/*
  2954			 * do_enqueue_task() is in the process of transferring the task
  2955			 * to the BPF scheduler while holding @p's rq lock. As we aren't
  2956			 * holding any kernel or BPF resource that the enqueue path may
  2957			 * depend upon, it's safe to wait.
  2958			 */
  2959			wait_ops_state(p, opss);
  2960			goto retry;
  2961		}
  2962	
  2963		BUG_ON(!(p->scx.flags & SCX_TASK_QUEUED));
  2964	
  2965		dsq = find_dsq_for_dispatch(this_rq(), dsq_id, p);
  2966	
  2967		if (dsq->id == SCX_DSQ_LOCAL)
  2968			dispatch_to_local_dsq(rq, dsq, p, enq_flags);
  2969		else
  2970			dispatch_enqueue(dsq, p, enq_flags | SCX_ENQ_CLEAR_OPSS);
  2971	}
  2972	
  2973	static void flush_dispatch_buf(struct rq *rq)
  2974	{
  2975		struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
  2976		u32 u;
  2977	
  2978		for (u = 0; u < dspc->cursor; u++) {
  2979			struct scx_dsp_buf_ent *ent = &dspc->buf[u];
  2980	
  2981			finish_dispatch(rq, ent->task, ent->qseq, ent->dsq_id,
  2982					ent->enq_flags);
  2983		}
  2984	
  2985		dspc->nr_tasks += dspc->cursor;
  2986		dspc->cursor = 0;
  2987	}
  2988	
  2989	static int balance_one(struct rq *rq, struct task_struct *prev)
  2990	{
  2991		struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
  2992		bool prev_on_scx = prev->sched_class == &ext_sched_class;
  2993		bool prev_on_rq = prev->scx.flags & SCX_TASK_QUEUED;
  2994		int nr_loops = SCX_DSP_MAX_LOOPS;
  2995	
  2996		lockdep_assert_rq_held(rq);
  2997		rq->scx.flags |= SCX_RQ_IN_BALANCE;
  2998		rq->scx.flags &= ~(SCX_RQ_BAL_PENDING | SCX_RQ_BAL_KEEP);
  2999	
  3000		if (static_branch_unlikely(&scx_ops_cpu_preempt) &&
  3001		    unlikely(rq->scx.cpu_released)) {
  3002			/*
  3003			 * If the previous sched_class for the current CPU was not SCX,
  3004			 * notify the BPF scheduler that it again has control of the
  3005			 * core. This callback complements ->cpu_release(), which is
  3006			 * emitted in switch_class().
  3007			 */
  3008			if (SCX_HAS_OP(cpu_acquire))
  3009				SCX_CALL_OP(SCX_KF_REST, cpu_acquire, cpu_of(rq), NULL);
  3010			rq->scx.cpu_released = false;
  3011		}
  3012	
  3013		if (prev_on_scx) {
  3014			update_curr_scx(rq);
  3015	
  3016			/*
  3017			 * If @prev is runnable & has slice left, it has priority and
  3018			 * fetching more just increases latency for the fetched tasks.
  3019			 * Tell pick_task_scx() to keep running @prev. If the BPF
  3020			 * scheduler wants to handle this explicitly, it should
  3021			 * implement ->cpu_release().
  3022			 *
  3023			 * See scx_ops_disable_workfn() for the explanation on the
  3024			 * bypassing test.
  3025			 */
  3026			if (prev_on_rq && prev->scx.slice && !scx_rq_bypassing(rq)) {
  3027				rq->scx.flags |= SCX_RQ_BAL_KEEP;
  3028				goto has_tasks;
  3029			}
  3030		}
  3031	
  3032		/* if there already are tasks to run, nothing to do */
  3033		if (rq->scx.local_dsq.nr)
  3034			goto has_tasks;
  3035	
  3036		if (consume_global_dsq(rq))
  3037			goto has_tasks;
  3038	
  3039		if (!SCX_HAS_OP(dispatch) || scx_rq_bypassing(rq) || !scx_rq_online(rq))
  3040			goto no_tasks;
  3041	
  3042		dspc->rq = rq;
  3043	
  3044		/*
  3045		 * The dispatch loop. Because flush_dispatch_buf() may drop the rq lock,
  3046		 * the local DSQ might still end up empty after a successful
  3047		 * ops.dispatch(). If the local DSQ is empty even after ops.dispatch()
  3048		 * produced some tasks, retry. The BPF scheduler may depend on this
  3049		 * looping behavior to simplify its implementation.
  3050		 */
  3051		do {
  3052			dspc->nr_tasks = 0;
  3053	
  3054			SCX_CALL_OP(SCX_KF_DISPATCH, dispatch, cpu_of(rq),
  3055				    prev_on_scx ? prev : NULL);
  3056	
  3057			flush_dispatch_buf(rq);
  3058	
  3059			if (prev_on_rq && prev->scx.slice) {
  3060				rq->scx.flags |= SCX_RQ_BAL_KEEP;
  3061				goto has_tasks;
  3062			}
  3063			if (rq->scx.local_dsq.nr)
  3064				goto has_tasks;
  3065			if (consume_global_dsq(rq))
  3066				goto has_tasks;
  3067	
  3068			/*
  3069			 * ops.dispatch() can trap us in this loop by repeatedly
  3070			 * dispatching ineligible tasks. Break out once in a while to
  3071			 * allow the watchdog to run. As IRQ can't be enabled in
  3072			 * balance(), we want to complete this scheduling cycle and then
  3073			 * start a new one. IOW, we want to call resched_curr() on the
  3074			 * next, most likely idle, task, not the current one. Use
  3075			 * scx_bpf_kick_cpu() for deferred kicking.
  3076			 */
  3077			if (unlikely(!--nr_loops)) {
  3078				scx_bpf_kick_cpu(cpu_of(rq), 0);
  3079				break;
  3080			}
  3081		} while (dspc->nr_tasks);
  3082	
  3083	no_tasks:
  3084		/*
  3085		 * Didn't find another task to run. Keep running @prev unless
  3086		 * %SCX_OPS_ENQ_LAST is in effect.
  3087		 */
  3088		if (prev_on_rq && (!static_branch_unlikely(&scx_ops_enq_last) ||
  3089		     scx_rq_bypassing(rq))) {
  3090			rq->scx.flags |= SCX_RQ_BAL_KEEP;
  3091			__scx_add_event(SCX_EV_DISPATCH_KEEP_LAST, 1);
  3092			goto has_tasks;
  3093		}
  3094		rq->scx.flags &= ~SCX_RQ_IN_BALANCE;
  3095		return false;
  3096	
  3097	has_tasks:
  3098		rq->scx.flags &= ~SCX_RQ_IN_BALANCE;
  3099		return true;
  3100	}
  3101	
  3102	static int balance_scx(struct rq *rq, struct task_struct *prev,
  3103			       struct rq_flags *rf)
  3104	{
  3105		int ret;
  3106	
  3107		rq_unpin_lock(rq, rf);
  3108	
  3109		ret = balance_one(rq, prev);
  3110	
  3111	#ifdef CONFIG_SCHED_SMT
  3112		/*
  3113		 * When core-sched is enabled, this ops.balance() call will be followed
  3114		 * by pick_task_scx() on this CPU and the SMT siblings. Balance the
  3115		 * siblings too.
  3116		 */
  3117		if (sched_core_enabled(rq)) {
  3118			const struct cpumask *smt_mask = cpu_smt_mask(cpu_of(rq));
  3119			int scpu;
  3120	
  3121			for_each_cpu_andnot(scpu, smt_mask, cpumask_of(cpu_of(rq))) {
  3122				struct rq *srq = cpu_rq(scpu);
  3123				struct task_struct *sprev = srq->curr;
  3124	
  3125				WARN_ON_ONCE(__rq_lockp(rq) != __rq_lockp(srq));
  3126				update_rq_clock(srq);
  3127				balance_one(srq, sprev);
  3128			}
  3129		}
  3130	#endif
  3131		rq_repin_lock(rq, rf);
  3132	
  3133		return ret;
  3134	}
  3135	
  3136	static void process_ddsp_deferred_locals(struct rq *rq)
  3137	{
  3138		struct task_struct *p;
  3139	
  3140		lockdep_assert_rq_held(rq);
  3141	
  3142		/*
  3143		 * Now that @rq can be unlocked, execute the deferred enqueueing of
  3144		 * tasks directly dispatched to the local DSQs of other CPUs. See
  3145		 * direct_dispatch(). Keep popping from the head instead of using
  3146		 * list_for_each_entry_safe() as dispatch_local_dsq() may unlock @rq
  3147		 * temporarily.
  3148		 */
  3149		while ((p = list_first_entry_or_null(&rq->scx.ddsp_deferred_locals,
  3150					struct task_struct, scx.dsq_list.node))) {
  3151			struct scx_dispatch_q *dsq;
  3152	
  3153			list_del_init(&p->scx.dsq_list.node);
  3154	
  3155			dsq = find_dsq_for_dispatch(rq, p->scx.ddsp_dsq_id, p);
  3156			if (!WARN_ON_ONCE(dsq->id != SCX_DSQ_LOCAL))
  3157				dispatch_to_local_dsq(rq, dsq, p, p->scx.ddsp_enq_flags);
  3158		}
  3159	}
  3160	
  3161	static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
  3162	{
  3163		if (p->scx.flags & SCX_TASK_QUEUED) {
  3164			/*
  3165			 * Core-sched might decide to execute @p before it is
  3166			 * dispatched. Call ops_dequeue() to notify the BPF scheduler.
  3167			 */
  3168			ops_dequeue(p, SCX_DEQ_CORE_SCHED_EXEC);
  3169			dispatch_dequeue(rq, p);
  3170		}
  3171	
  3172		p->se.exec_start = rq_clock_task(rq);
  3173	
  3174		/* see dequeue_task_scx() on why we skip when !QUEUED */
  3175		if (SCX_HAS_OP(running) && (p->scx.flags & SCX_TASK_QUEUED))
  3176			SCX_CALL_OP_TASK(SCX_KF_REST, running, p);
  3177	
  3178		clr_task_runnable(p, true);
  3179	
  3180		/*
  3181		 * @p is getting newly scheduled or got kicked after someone updated its
  3182		 * slice. Refresh whether tick can be stopped. See scx_can_stop_tick().
  3183		 */
  3184		if ((p->scx.slice == SCX_SLICE_INF) !=
  3185		    (bool)(rq->scx.flags & SCX_RQ_CAN_STOP_TICK)) {
  3186			if (p->scx.slice == SCX_SLICE_INF)
  3187				rq->scx.flags |= SCX_RQ_CAN_STOP_TICK;
  3188			else
  3189				rq->scx.flags &= ~SCX_RQ_CAN_STOP_TICK;
  3190	
  3191			sched_update_tick_dependency(rq);
  3192	
  3193			/*
  3194			 * For now, let's refresh the load_avgs just when transitioning
  3195			 * in and out of nohz. In the future, we might want to add a
  3196			 * mechanism which calls the following periodically on
  3197			 * tick-stopped CPUs.
  3198			 */
  3199			update_other_load_avgs(rq);
  3200		}
  3201	}
  3202	
  3203	static enum scx_cpu_preempt_reason
  3204	preempt_reason_from_class(const struct sched_class *class)
  3205	{
  3206	#ifdef CONFIG_SMP
  3207		if (class == &stop_sched_class)
  3208			return SCX_CPU_PREEMPT_STOP;
  3209	#endif
  3210		if (class == &dl_sched_class)
  3211			return SCX_CPU_PREEMPT_DL;
  3212		if (class == &rt_sched_class)
  3213			return SCX_CPU_PREEMPT_RT;
  3214		return SCX_CPU_PREEMPT_UNKNOWN;
  3215	}
  3216	
  3217	static void switch_class(struct rq *rq, struct task_struct *next)
  3218	{
  3219		const struct sched_class *next_class = next->sched_class;
  3220	
  3221	#ifdef CONFIG_SMP
  3222		/*
  3223		 * Pairs with the smp_load_acquire() issued by a CPU in
  3224		 * kick_cpus_irq_workfn() who is waiting for this CPU to perform a
  3225		 * resched.
  3226		 */
  3227		smp_store_release(&rq->scx.pnt_seq, rq->scx.pnt_seq + 1);
  3228	#endif
  3229		if (!static_branch_unlikely(&scx_ops_cpu_preempt))
  3230			return;
  3231	
  3232		/*
  3233		 * The callback is conceptually meant to convey that the CPU is no
  3234		 * longer under the control of SCX. Therefore, don't invoke the callback
  3235		 * if the next class is below SCX (in which case the BPF scheduler has
  3236		 * actively decided not to schedule any tasks on the CPU).
  3237		 */
  3238		if (sched_class_above(&ext_sched_class, next_class))
  3239			return;
  3240	
  3241		/*
  3242		 * At this point we know that SCX was preempted by a higher priority
  3243		 * sched_class, so invoke the ->cpu_release() callback if we have not
  3244		 * done so already. We only send the callback once between SCX being
  3245		 * preempted, and it regaining control of the CPU.
  3246		 *
  3247		 * ->cpu_release() complements ->cpu_acquire(), which is emitted the
  3248		 *  next time that balance_scx() is invoked.
  3249		 */
  3250		if (!rq->scx.cpu_released) {
  3251			if (SCX_HAS_OP(cpu_release)) {
  3252				struct scx_cpu_release_args args = {
  3253					.reason = preempt_reason_from_class(next_class),
  3254					.task = next,
  3255				};
  3256	
  3257				SCX_CALL_OP(SCX_KF_CPU_RELEASE,
  3258					    cpu_release, cpu_of(rq), &args);
  3259			}
  3260			rq->scx.cpu_released = true;
  3261		}
  3262	}
  3263	
  3264	static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
  3265				      struct task_struct *next)
  3266	{
  3267		update_curr_scx(rq);
  3268	
  3269		/* see dequeue_task_scx() on why we skip when !QUEUED */
  3270		if (SCX_HAS_OP(stopping) && (p->scx.flags & SCX_TASK_QUEUED))
  3271			SCX_CALL_OP_TASK(SCX_KF_REST, stopping, p, true);
  3272	
  3273		if (p->scx.flags & SCX_TASK_QUEUED) {
  3274			set_task_runnable(rq, p);
  3275	
  3276			/*
  3277			 * If @p has slice left and is being put, @p is getting
  3278			 * preempted by a higher priority scheduler class or core-sched
  3279			 * forcing a different task. Leave it at the head of the local
  3280			 * DSQ.
  3281			 */
  3282			if (p->scx.slice && !scx_rq_bypassing(rq)) {
  3283				dispatch_enqueue(&rq->scx.local_dsq, p, SCX_ENQ_HEAD);
  3284				goto switch_class;
  3285			}
  3286	
  3287			/*
  3288			 * If @p is runnable but we're about to enter a lower
  3289			 * sched_class, %SCX_OPS_ENQ_LAST must be set. Tell
  3290			 * ops.enqueue() that @p is the only one available for this cpu,
  3291			 * which should trigger an explicit follow-up scheduling event.
  3292			 */
  3293			if (sched_class_above(&ext_sched_class, next->sched_class)) {
  3294				WARN_ON_ONCE(!static_branch_unlikely(&scx_ops_enq_last));
  3295				do_enqueue_task(rq, p, SCX_ENQ_LAST, -1);
  3296			} else {
  3297				do_enqueue_task(rq, p, 0, -1);
  3298			}
  3299		}
  3300	
  3301	switch_class:
  3302		if (next && next->sched_class != &ext_sched_class)
  3303			switch_class(rq, next);
  3304	}
  3305	
  3306	static struct task_struct *first_local_task(struct rq *rq)
  3307	{
  3308		return list_first_entry_or_null(&rq->scx.local_dsq.list,
  3309						struct task_struct, scx.dsq_list.node);
  3310	}
  3311	
  3312	static struct task_struct *pick_task_scx(struct rq *rq)
  3313	{
  3314		struct task_struct *prev = rq->curr;
  3315		struct task_struct *p;
  3316		bool prev_on_scx = prev->sched_class == &ext_sched_class;
  3317		bool keep_prev = rq->scx.flags & SCX_RQ_BAL_KEEP;
  3318		bool kick_idle = false;
  3319	
  3320		/*
  3321		 * WORKAROUND:
  3322		 *
  3323		 * %SCX_RQ_BAL_KEEP should be set iff $prev is on SCX as it must just
  3324		 * have gone through balance_scx(). Unfortunately, there currently is a
  3325		 * bug where fair could say yes on balance() but no on pick_task(),
  3326		 * which then ends up calling pick_task_scx() without preceding
  3327		 * balance_scx().
  3328		 *
  3329		 * Keep running @prev if possible and avoid stalling from entering idle
  3330		 * without balancing.
  3331		 *
  3332		 * Once fair is fixed, remove the workaround and trigger WARN_ON_ONCE()
  3333		 * if pick_task_scx() is called without preceding balance_scx().
  3334		 */
  3335		if (unlikely(rq->scx.flags & SCX_RQ_BAL_PENDING)) {
  3336			if (prev_on_scx) {
  3337				keep_prev = true;
  3338			} else {
  3339				keep_prev = false;
  3340				kick_idle = true;
  3341			}
  3342		} else if (unlikely(keep_prev && !prev_on_scx)) {
  3343			/* only allowed during transitions */
  3344			WARN_ON_ONCE(scx_ops_enable_state() == SCX_OPS_ENABLED);
  3345			keep_prev = false;
  3346		}
  3347	
  3348		/*
  3349		 * If balance_scx() is telling us to keep running @prev, replenish slice
  3350		 * if necessary and keep running @prev. Otherwise, pop the first one
  3351		 * from the local DSQ.
  3352		 */
  3353		if (keep_prev) {
  3354			p = prev;
  3355			if (!p->scx.slice) {
  3356				p->scx.slice = SCX_SLICE_DFL;
  3357				__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
  3358			}
  3359		} else {
  3360			p = first_local_task(rq);
  3361			if (!p) {
  3362				if (kick_idle)
  3363					scx_bpf_kick_cpu(cpu_of(rq), SCX_KICK_IDLE);
  3364				return NULL;
  3365			}
  3366	
  3367			if (unlikely(!p->scx.slice)) {
  3368				if (!scx_rq_bypassing(rq) && !scx_warned_zero_slice) {
  3369					printk_deferred(KERN_WARNING "sched_ext: %s[%d] has zero slice in %s()\n",
  3370							p->comm, p->pid, __func__);
  3371					scx_warned_zero_slice = true;
  3372				}
  3373				p->scx.slice = SCX_SLICE_DFL;
  3374				__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
  3375			}
  3376		}
  3377	
  3378		return p;
  3379	}
  3380	
  3381	#ifdef CONFIG_SCHED_CORE
  3382	/**
  3383	 * scx_prio_less - Task ordering for core-sched
  3384	 * @a: task A
  3385	 * @b: task B
  3386	 * @in_fi: in forced idle state
  3387	 *
  3388	 * Core-sched is implemented as an additional scheduling layer on top of the
  3389	 * usual sched_class'es and needs to find out the expected task ordering. For
  3390	 * SCX, core-sched calls this function to interrogate the task ordering.
  3391	 *
  3392	 * Unless overridden by ops.core_sched_before(), @p->scx.core_sched_at is used
  3393	 * to implement the default task ordering. The older the timestamp, the higher
  3394	 * priority the task - the global FIFO ordering matching the default scheduling
  3395	 * behavior.
  3396	 *
  3397	 * When ops.core_sched_before() is enabled, @p->scx.core_sched_at is used to
  3398	 * implement FIFO ordering within each local DSQ. See pick_task_scx().
  3399	 */
  3400	bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
  3401			   bool in_fi)
  3402	{
  3403		/*
  3404		 * The const qualifiers are dropped from task_struct pointers when
  3405		 * calling ops.core_sched_before(). Accesses are controlled by the
  3406		 * verifier.
  3407		 */
  3408		if (SCX_HAS_OP(core_sched_before) && !scx_rq_bypassing(task_rq(a)))
  3409			return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, core_sched_before,
  3410						      (struct task_struct *)a,
  3411						      (struct task_struct *)b);
  3412		else
  3413			return time_after64(a->scx.core_sched_at, b->scx.core_sched_at);
  3414	}
  3415	#endif	/* CONFIG_SCHED_CORE */
  3416	
  3417	#ifdef CONFIG_SMP
  3418	
  3419	static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flags)
  3420	{
  3421		bool rq_bypass;
  3422	
  3423		/*
  3424		 * sched_exec() calls with %WF_EXEC when @p is about to exec(2) as it
  3425		 * can be a good migration opportunity with low cache and memory
  3426		 * footprint. Returning a CPU different than @prev_cpu triggers
  3427		 * immediate rq migration. However, for SCX, as the current rq
  3428		 * association doesn't dictate where the task is going to run, this
  3429		 * doesn't fit well. If necessary, we can later add a dedicated method
  3430		 * which can decide to preempt self to force it through the regular
  3431		 * scheduling path.
  3432		 */
  3433		if (unlikely(wake_flags & WF_EXEC))
  3434			return prev_cpu;
  3435	
  3436		rq_bypass = scx_rq_bypassing(task_rq(p));
  3437		if (SCX_HAS_OP(select_cpu) && !rq_bypass) {
  3438			s32 cpu;
  3439			struct task_struct **ddsp_taskp;
  3440	
  3441			ddsp_taskp = this_cpu_ptr(&direct_dispatch_task);
  3442			WARN_ON_ONCE(*ddsp_taskp);
  3443			*ddsp_taskp = p;
  3444	
  3445			cpu = SCX_CALL_OP_TASK_RET(SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU,
  3446						   select_cpu, p, prev_cpu, wake_flags);
  3447			p->scx.selected_cpu = cpu;
  3448			*ddsp_taskp = NULL;
  3449			if (ops_cpu_valid(cpu, "from ops.select_cpu()"))
  3450				return cpu;
  3451			else
  3452				return prev_cpu;
  3453		} else {
  3454			bool found;
  3455			s32 cpu;
  3456	
  3457			cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, &found);
  3458			p->scx.selected_cpu = cpu;
  3459			if (found) {
  3460				p->scx.slice = SCX_SLICE_DFL;
  3461				p->scx.ddsp_dsq_id = SCX_DSQ_LOCAL;
  3462				__scx_add_event(SCX_EV_ENQ_SLICE_DFL, 1);
  3463			}
  3464	
  3465			if (rq_bypass)
  3466				__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
  3467			return cpu;
  3468		}
  3469	}
  3470	
  3471	static void task_woken_scx(struct rq *rq, struct task_struct *p)
  3472	{
  3473		run_deferred(rq);
  3474	}
  3475	
  3476	static void set_cpus_allowed_scx(struct task_struct *p,
  3477					 struct affinity_context *ac)
  3478	{
  3479		set_cpus_allowed_common(p, ac);
  3480	
  3481		/*
  3482		 * The effective cpumask is stored in @p->cpus_ptr which may temporarily
  3483		 * differ from the configured one in @p->cpus_mask. Always tell the bpf
  3484		 * scheduler the effective one.
  3485		 *
  3486		 * Fine-grained memory write control is enforced by BPF making the const
  3487		 * designation pointless. Cast it away when calling the operation.
  3488		 */
  3489		if (SCX_HAS_OP(set_cpumask))
  3490			SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, p,
  3491					 (struct cpumask *)p->cpus_ptr);
  3492	}
  3493	
  3494	static void handle_hotplug(struct rq *rq, bool online)
  3495	{
  3496		int cpu = cpu_of(rq);
  3497	
  3498		atomic_long_inc(&scx_hotplug_seq);
  3499	
  3500		if (scx_enabled())
  3501			scx_idle_update_selcpu_topology(&scx_ops);
  3502	
  3503		if (online && SCX_HAS_OP(cpu_online))
  3504			SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, cpu);
  3505		else if (!online && SCX_HAS_OP(cpu_offline))
  3506			SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, cpu);
  3507		else
  3508			scx_ops_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
  3509				     "cpu %d going %s, exiting scheduler", cpu,
  3510				     online ? "online" : "offline");
  3511	}
  3512	
  3513	void scx_rq_activate(struct rq *rq)
  3514	{
  3515		handle_hotplug(rq, true);
  3516	}
  3517	
  3518	void scx_rq_deactivate(struct rq *rq)
  3519	{
  3520		handle_hotplug(rq, false);
  3521	}
  3522	
  3523	static void rq_online_scx(struct rq *rq)
  3524	{
  3525		rq->scx.flags |= SCX_RQ_ONLINE;
  3526	}
  3527	
  3528	static void rq_offline_scx(struct rq *rq)
  3529	{
  3530		rq->scx.flags &= ~SCX_RQ_ONLINE;
  3531	}
  3532	
  3533	#endif	/* CONFIG_SMP */
  3534	
  3535	static bool check_rq_for_timeouts(struct rq *rq)
  3536	{
  3537		struct task_struct *p;
  3538		struct rq_flags rf;
  3539		bool timed_out = false;
  3540	
  3541		rq_lock_irqsave(rq, &rf);
  3542		list_for_each_entry(p, &rq->scx.runnable_list, scx.runnable_node) {
  3543			unsigned long last_runnable = p->scx.runnable_at;
  3544	
  3545			if (unlikely(time_after(jiffies,
  3546						last_runnable + scx_watchdog_timeout))) {
  3547				u32 dur_ms = jiffies_to_msecs(jiffies - last_runnable);
  3548	
  3549				scx_ops_error_kind(SCX_EXIT_ERROR_STALL,
  3550						   "%s[%d] failed to run for %u.%03us",
  3551						   p->comm, p->pid,
  3552						   dur_ms / 1000, dur_ms % 1000);
  3553				timed_out = true;
  3554				break;
  3555			}
  3556		}
  3557		rq_unlock_irqrestore(rq, &rf);
  3558	
  3559		return timed_out;
  3560	}
  3561	
  3562	static void scx_watchdog_workfn(struct work_struct *work)
  3563	{
  3564		int cpu;
  3565	
  3566		WRITE_ONCE(scx_watchdog_timestamp, jiffies);
  3567	
  3568		for_each_online_cpu(cpu) {
  3569			if (unlikely(check_rq_for_timeouts(cpu_rq(cpu))))
  3570				break;
  3571	
  3572			cond_resched();
  3573		}
  3574		queue_delayed_work(system_unbound_wq, to_delayed_work(work),
  3575				   scx_watchdog_timeout / 2);
  3576	}
  3577	
  3578	void scx_tick(struct rq *rq)
  3579	{
  3580		unsigned long last_check;
  3581	
  3582		if (!scx_enabled())
  3583			return;
  3584	
  3585		last_check = READ_ONCE(scx_watchdog_timestamp);
  3586		if (unlikely(time_after(jiffies,
  3587					last_check + READ_ONCE(scx_watchdog_timeout)))) {
  3588			u32 dur_ms = jiffies_to_msecs(jiffies - last_check);
  3589	
  3590			scx_ops_error_kind(SCX_EXIT_ERROR_STALL,
  3591					   "watchdog failed to check in for %u.%03us",
  3592					   dur_ms / 1000, dur_ms % 1000);
  3593		}
  3594	
  3595		update_other_load_avgs(rq);
  3596	}
  3597	
  3598	static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
  3599	{
  3600		update_curr_scx(rq);
  3601	
  3602		/*
  3603		 * While disabling, always resched and refresh core-sched timestamp as
  3604		 * we can't trust the slice management or ops.core_sched_before().
  3605		 */
  3606		if (scx_rq_bypassing(rq)) {
  3607			curr->scx.slice = 0;
  3608			touch_core_sched(rq, curr);
  3609		} else if (SCX_HAS_OP(tick)) {
  3610			SCX_CALL_OP_TASK(SCX_KF_REST, tick, curr);
  3611		}
  3612	
  3613		if (!curr->scx.slice)
  3614			resched_curr(rq);
  3615	}
  3616	
  3617	#ifdef CONFIG_EXT_GROUP_SCHED
  3618	static struct cgroup *tg_cgrp(struct task_group *tg)
  3619	{
  3620		/*
  3621		 * If CGROUP_SCHED is disabled, @tg is NULL. If @tg is an autogroup,
  3622		 * @tg->css.cgroup is NULL. In both cases, @tg can be treated as the
  3623		 * root cgroup.
  3624		 */
  3625		if (tg && tg->css.cgroup)
  3626			return tg->css.cgroup;
  3627		else
  3628			return &cgrp_dfl_root.cgrp;
  3629	}
  3630	
  3631	#define SCX_INIT_TASK_ARGS_CGROUP(tg)		.cgroup = tg_cgrp(tg),
  3632	
  3633	#else	/* CONFIG_EXT_GROUP_SCHED */
  3634	
  3635	#define SCX_INIT_TASK_ARGS_CGROUP(tg)
  3636	
  3637	#endif	/* CONFIG_EXT_GROUP_SCHED */
  3638	
  3639	static enum scx_task_state scx_get_task_state(const struct task_struct *p)
  3640	{
  3641		return (p->scx.flags & SCX_TASK_STATE_MASK) >> SCX_TASK_STATE_SHIFT;
  3642	}
  3643	
  3644	static void scx_set_task_state(struct task_struct *p, enum scx_task_state state)
  3645	{
  3646		enum scx_task_state prev_state = scx_get_task_state(p);
  3647		bool warn = false;
  3648	
  3649		BUILD_BUG_ON(SCX_TASK_NR_STATES > (1 << SCX_TASK_STATE_BITS));
  3650	
  3651		switch (state) {
  3652		case SCX_TASK_NONE:
  3653			break;
  3654		case SCX_TASK_INIT:
  3655			warn = prev_state != SCX_TASK_NONE;
  3656			break;
  3657		case SCX_TASK_READY:
  3658			warn = prev_state == SCX_TASK_NONE;
  3659			break;
  3660		case SCX_TASK_ENABLED:
  3661			warn = prev_state != SCX_TASK_READY;
  3662			break;
  3663		default:
  3664			warn = true;
  3665			return;
  3666		}
  3667	
  3668		WARN_ONCE(warn, "sched_ext: Invalid task state transition %d -> %d for %s[%d]",
  3669			  prev_state, state, p->comm, p->pid);
  3670	
  3671		p->scx.flags &= ~SCX_TASK_STATE_MASK;
  3672		p->scx.flags |= state << SCX_TASK_STATE_SHIFT;
  3673	}
  3674	
  3675	static int scx_ops_init_task(struct task_struct *p, struct task_group *tg, bool fork)
  3676	{
  3677		int ret;
  3678	
  3679		p->scx.disallow = false;
  3680	
  3681		if (SCX_HAS_OP(init_task)) {
  3682			struct scx_init_task_args args = {
  3683				SCX_INIT_TASK_ARGS_CGROUP(tg)
  3684				.fork = fork,
  3685			};
  3686	
  3687			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init_task, p, &args);
  3688			if (unlikely(ret)) {
  3689				ret = ops_sanitize_err("init_task", ret);
  3690				return ret;
  3691			}
  3692		}
  3693	
  3694		scx_set_task_state(p, SCX_TASK_INIT);
  3695	
  3696		if (p->scx.disallow) {
  3697			if (!fork) {
  3698				struct rq *rq;
  3699				struct rq_flags rf;
  3700	
  3701				rq = task_rq_lock(p, &rf);
  3702	
  3703				/*
  3704				 * We're in the load path and @p->policy will be applied
  3705				 * right after. Reverting @p->policy here and rejecting
  3706				 * %SCHED_EXT transitions from scx_check_setscheduler()
  3707				 * guarantees that if ops.init_task() sets @p->disallow,
  3708				 * @p can never be in SCX.
  3709				 */
  3710				if (p->policy == SCHED_EXT) {
  3711					p->policy = SCHED_NORMAL;
  3712					atomic_long_inc(&scx_nr_rejected);
  3713				}
  3714	
  3715				task_rq_unlock(rq, p, &rf);
  3716			} else if (p->policy == SCHED_EXT) {
  3717				scx_ops_error("ops.init_task() set task->scx.disallow for %s[%d] during fork",
  3718					      p->comm, p->pid);
  3719			}
  3720		}
  3721	
  3722		p->scx.flags |= SCX_TASK_RESET_RUNNABLE_AT;
  3723		return 0;
  3724	}
  3725	
  3726	static void scx_ops_enable_task(struct task_struct *p)
  3727	{
  3728		u32 weight;
  3729	
  3730		lockdep_assert_rq_held(task_rq(p));
  3731	
  3732		/*
  3733		 * Set the weight before calling ops.enable() so that the scheduler
  3734		 * doesn't see a stale value if they inspect the task struct.
  3735		 */
  3736		if (task_has_idle_policy(p))
  3737			weight = WEIGHT_IDLEPRIO;
  3738		else
  3739			weight = sched_prio_to_weight[p->static_prio - MAX_RT_PRIO];
  3740	
  3741		p->scx.weight = sched_weight_to_cgroup(weight);
  3742	
  3743		if (SCX_HAS_OP(enable))
  3744			SCX_CALL_OP_TASK(SCX_KF_REST, enable, p);
  3745		scx_set_task_state(p, SCX_TASK_ENABLED);
  3746	
  3747		if (SCX_HAS_OP(set_weight))
  3748			SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, p, p->scx.weight);
  3749	}
  3750	
  3751	static void scx_ops_disable_task(struct task_struct *p)
  3752	{
  3753		lockdep_assert_rq_held(task_rq(p));
  3754		WARN_ON_ONCE(scx_get_task_state(p) != SCX_TASK_ENABLED);
  3755	
  3756		if (SCX_HAS_OP(disable))
  3757			SCX_CALL_OP_TASK(SCX_KF_REST, disable, p);
  3758		scx_set_task_state(p, SCX_TASK_READY);
  3759	}
  3760	
  3761	static void scx_ops_exit_task(struct task_struct *p)
  3762	{
  3763		struct scx_exit_task_args args = {
  3764			.cancelled = false,
  3765		};
  3766	
  3767		lockdep_assert_rq_held(task_rq(p));
  3768	
  3769		switch (scx_get_task_state(p)) {
  3770		case SCX_TASK_NONE:
  3771			return;
  3772		case SCX_TASK_INIT:
  3773			args.cancelled = true;
  3774			break;
  3775		case SCX_TASK_READY:
  3776			break;
  3777		case SCX_TASK_ENABLED:
  3778			scx_ops_disable_task(p);
  3779			break;
  3780		default:
  3781			WARN_ON_ONCE(true);
  3782			return;
  3783		}
  3784	
  3785		if (SCX_HAS_OP(exit_task))
  3786			SCX_CALL_OP_TASK(SCX_KF_REST, exit_task, p, &args);
  3787		scx_set_task_state(p, SCX_TASK_NONE);
  3788	}
  3789	
  3790	void init_scx_entity(struct sched_ext_entity *scx)
  3791	{
  3792		memset(scx, 0, sizeof(*scx));
  3793		INIT_LIST_HEAD(&scx->dsq_list.node);
  3794		RB_CLEAR_NODE(&scx->dsq_priq);
  3795		scx->sticky_cpu = -1;
  3796		scx->holding_cpu = -1;
  3797		INIT_LIST_HEAD(&scx->runnable_node);
  3798		scx->runnable_at = jiffies;
  3799		scx->ddsp_dsq_id = SCX_DSQ_INVALID;
  3800		scx->slice = SCX_SLICE_DFL;
  3801	}
  3802	
  3803	void scx_pre_fork(struct task_struct *p)
  3804	{
  3805		/*
  3806		 * BPF scheduler enable/disable paths want to be able to iterate and
  3807		 * update all tasks which can become complex when racing forks. As
  3808		 * enable/disable are very cold paths, let's use a percpu_rwsem to
  3809		 * exclude forks.
  3810		 */
  3811		percpu_down_read(&scx_fork_rwsem);
  3812	}
  3813	
  3814	int scx_fork(struct task_struct *p)
  3815	{
  3816		percpu_rwsem_assert_held(&scx_fork_rwsem);
  3817	
  3818		if (scx_ops_init_task_enabled)
  3819			return scx_ops_init_task(p, task_group(p), true);
  3820		else
  3821			return 0;
  3822	}
  3823	
  3824	void scx_post_fork(struct task_struct *p)
  3825	{
  3826		if (scx_ops_init_task_enabled) {
  3827			scx_set_task_state(p, SCX_TASK_READY);
  3828	
  3829			/*
  3830			 * Enable the task immediately if it's running on sched_ext.
  3831			 * Otherwise, it'll be enabled in switching_to_scx() if and
  3832			 * when it's ever configured to run with a SCHED_EXT policy.
  3833			 */
  3834			if (p->sched_class == &ext_sched_class) {
  3835				struct rq_flags rf;
  3836				struct rq *rq;
  3837	
  3838				rq = task_rq_lock(p, &rf);
  3839				scx_ops_enable_task(p);
  3840				task_rq_unlock(rq, p, &rf);
  3841			}
  3842		}
  3843	
  3844		spin_lock_irq(&scx_tasks_lock);
  3845		list_add_tail(&p->scx.tasks_node, &scx_tasks);
  3846		spin_unlock_irq(&scx_tasks_lock);
  3847	
  3848		percpu_up_read(&scx_fork_rwsem);
  3849	}
  3850	
  3851	void scx_cancel_fork(struct task_struct *p)
  3852	{
  3853		if (scx_enabled()) {
  3854			struct rq *rq;
  3855			struct rq_flags rf;
  3856	
  3857			rq = task_rq_lock(p, &rf);
  3858			WARN_ON_ONCE(scx_get_task_state(p) >= SCX_TASK_READY);
  3859			scx_ops_exit_task(p);
  3860			task_rq_unlock(rq, p, &rf);
  3861		}
  3862	
  3863		percpu_up_read(&scx_fork_rwsem);
  3864	}
  3865	
  3866	void sched_ext_free(struct task_struct *p)
  3867	{
  3868		unsigned long flags;
  3869	
  3870		spin_lock_irqsave(&scx_tasks_lock, flags);
  3871		list_del_init(&p->scx.tasks_node);
  3872		spin_unlock_irqrestore(&scx_tasks_lock, flags);
  3873	
  3874		/*
  3875		 * @p is off scx_tasks and wholly ours. scx_ops_enable()'s READY ->
  3876		 * ENABLED transitions can't race us. Disable ops for @p.
  3877		 */
  3878		if (scx_get_task_state(p) != SCX_TASK_NONE) {
  3879			struct rq_flags rf;
  3880			struct rq *rq;
  3881	
  3882			rq = task_rq_lock(p, &rf);
  3883			scx_ops_exit_task(p);
  3884			task_rq_unlock(rq, p, &rf);
  3885		}
  3886	}
  3887	
  3888	static void reweight_task_scx(struct rq *rq, struct task_struct *p,
  3889				      const struct load_weight *lw)
  3890	{
  3891		lockdep_assert_rq_held(task_rq(p));
  3892	
  3893		p->scx.weight = sched_weight_to_cgroup(scale_load_down(lw->weight));
  3894		if (SCX_HAS_OP(set_weight))
  3895			SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, p, p->scx.weight);
  3896	}
  3897	
  3898	static void prio_changed_scx(struct rq *rq, struct task_struct *p, int oldprio)
  3899	{
  3900	}
  3901	
  3902	static void switching_to_scx(struct rq *rq, struct task_struct *p)
  3903	{
  3904		scx_ops_enable_task(p);
  3905	
  3906		/*
  3907		 * set_cpus_allowed_scx() is not called while @p is associated with a
  3908		 * different scheduler class. Keep the BPF scheduler up-to-date.
  3909		 */
  3910		if (SCX_HAS_OP(set_cpumask))
  3911			SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, p,
  3912					 (struct cpumask *)p->cpus_ptr);
  3913	}
  3914	
  3915	static void switched_from_scx(struct rq *rq, struct task_struct *p)
  3916	{
  3917		scx_ops_disable_task(p);
  3918	}
  3919	
  3920	static void wakeup_preempt_scx(struct rq *rq, struct task_struct *p,int wake_flags) {}
  3921	static void switched_to_scx(struct rq *rq, struct task_struct *p) {}
  3922	
  3923	int scx_check_setscheduler(struct task_struct *p, int policy)
  3924	{
  3925		lockdep_assert_rq_held(task_rq(p));
  3926	
  3927		/* if disallow, reject transitioning into SCX */
  3928		if (scx_enabled() && READ_ONCE(p->scx.disallow) &&
  3929		    p->policy != policy && policy == SCHED_EXT)
  3930			return -EACCES;
  3931	
  3932		return 0;
  3933	}
  3934	
  3935	#ifdef CONFIG_NO_HZ_FULL
  3936	bool scx_can_stop_tick(struct rq *rq)
  3937	{
  3938		struct task_struct *p = rq->curr;
  3939	
  3940		if (scx_rq_bypassing(rq))
  3941			return false;
  3942	
  3943		if (p->sched_class != &ext_sched_class)
  3944			return true;
  3945	
  3946		/*
  3947		 * @rq can dispatch from different DSQs, so we can't tell whether it
  3948		 * needs the tick or not by looking at nr_running. Allow stopping ticks
  3949		 * iff the BPF scheduler indicated so. See set_next_task_scx().
  3950		 */
  3951		return rq->scx.flags & SCX_RQ_CAN_STOP_TICK;
  3952	}
  3953	#endif
  3954	
  3955	#ifdef CONFIG_EXT_GROUP_SCHED
  3956	
  3957	DEFINE_STATIC_PERCPU_RWSEM(scx_cgroup_rwsem);
  3958	static bool scx_cgroup_enabled;
  3959	static bool cgroup_warned_missing_weight;
  3960	static bool cgroup_warned_missing_idle;
  3961	
  3962	static void scx_cgroup_warn_missing_weight(struct task_group *tg)
  3963	{
  3964		if (scx_ops_enable_state() == SCX_OPS_DISABLED ||
  3965		    cgroup_warned_missing_weight)
  3966			return;
  3967	
  3968		if ((scx_ops.flags & SCX_OPS_HAS_CGROUP_WEIGHT) || !tg->css.parent)
  3969			return;
  3970	
  3971		pr_warn("sched_ext: \"%s\" does not implement cgroup cpu.weight\n",
  3972			scx_ops.name);
  3973		cgroup_warned_missing_weight = true;
  3974	}
  3975	
  3976	static void scx_cgroup_warn_missing_idle(struct task_group *tg)
  3977	{
  3978		if (!scx_cgroup_enabled || cgroup_warned_missing_idle)
  3979			return;
  3980	
  3981		if (!tg->idle)
  3982			return;
  3983	
  3984		pr_warn("sched_ext: \"%s\" does not implement cgroup cpu.idle\n",
  3985			scx_ops.name);
  3986		cgroup_warned_missing_idle = true;
  3987	}
  3988	
  3989	int scx_tg_online(struct task_group *tg)
  3990	{
  3991		int ret = 0;
  3992	
  3993		WARN_ON_ONCE(tg->scx_flags & (SCX_TG_ONLINE | SCX_TG_INITED));
  3994	
  3995		percpu_down_read(&scx_cgroup_rwsem);
  3996	
  3997		scx_cgroup_warn_missing_weight(tg);
  3998	
  3999		if (scx_cgroup_enabled) {
  4000			if (SCX_HAS_OP(cgroup_init)) {
  4001				struct scx_cgroup_init_args args =
  4002					{ .weight = tg->scx_weight };
  4003	
  4004				ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init,
  4005						      tg->css.cgroup, &args);
  4006				if (ret)
  4007					ret = ops_sanitize_err("cgroup_init", ret);
  4008			}
  4009			if (ret == 0)
  4010				tg->scx_flags |= SCX_TG_ONLINE | SCX_TG_INITED;
  4011		} else {
  4012			tg->scx_flags |= SCX_TG_ONLINE;
  4013		}
  4014	
  4015		percpu_up_read(&scx_cgroup_rwsem);
  4016		return ret;
  4017	}
  4018	
  4019	void scx_tg_offline(struct task_group *tg)
  4020	{
  4021		WARN_ON_ONCE(!(tg->scx_flags & SCX_TG_ONLINE));
  4022	
  4023		percpu_down_read(&scx_cgroup_rwsem);
  4024	
  4025		if (SCX_HAS_OP(cgroup_exit) && (tg->scx_flags & SCX_TG_INITED))
  4026			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, tg->css.cgroup);
  4027		tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
  4028	
  4029		percpu_up_read(&scx_cgroup_rwsem);
  4030	}
  4031	
  4032	int scx_cgroup_can_attach(struct cgroup_taskset *tset)
  4033	{
  4034		struct cgroup_subsys_state *css;
  4035		struct task_struct *p;
  4036		int ret;
  4037	
  4038		/* released in scx_finish/cancel_attach() */
  4039		percpu_down_read(&scx_cgroup_rwsem);
  4040	
  4041		if (!scx_cgroup_enabled)
  4042			return 0;
  4043	
  4044		cgroup_taskset_for_each(p, css, tset) {
  4045			struct cgroup *from = tg_cgrp(task_group(p));
  4046			struct cgroup *to = tg_cgrp(css_tg(css));
  4047	
  4048			WARN_ON_ONCE(p->scx.cgrp_moving_from);
  4049	
  4050			/*
  4051			 * sched_move_task() omits identity migrations. Let's match the
  4052			 * behavior so that ops.cgroup_prep_move() and ops.cgroup_move()
  4053			 * always match one-to-one.
  4054			 */
  4055			if (from == to)
  4056				continue;
  4057	
  4058			if (SCX_HAS_OP(cgroup_prep_move)) {
  4059				ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_prep_move,
  4060						      p, from, css->cgroup);
  4061				if (ret)
  4062					goto err;
  4063			}
  4064	
  4065			p->scx.cgrp_moving_from = from;
  4066		}
  4067	
  4068		return 0;
  4069	
  4070	err:
  4071		cgroup_taskset_for_each(p, css, tset) {
  4072			if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
  4073				SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, p,
  4074					    p->scx.cgrp_moving_from, css->cgroup);
  4075			p->scx.cgrp_moving_from = NULL;
  4076		}
  4077	
  4078		percpu_up_read(&scx_cgroup_rwsem);
  4079		return ops_sanitize_err("cgroup_prep_move", ret);
  4080	}
  4081	
  4082	void scx_cgroup_move_task(struct task_struct *p)
  4083	{
  4084		if (!scx_cgroup_enabled)
  4085			return;
  4086	
  4087		/*
  4088		 * @p must have ops.cgroup_prep_move() called on it and thus
  4089		 * cgrp_moving_from set.
  4090		 */
  4091		if (SCX_HAS_OP(cgroup_move) && !WARN_ON_ONCE(!p->scx.cgrp_moving_from))
  4092			SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, cgroup_move, p,
  4093				p->scx.cgrp_moving_from, tg_cgrp(task_group(p)));
  4094		p->scx.cgrp_moving_from = NULL;
  4095	}
  4096	
  4097	void scx_cgroup_finish_attach(void)
  4098	{
  4099		percpu_up_read(&scx_cgroup_rwsem);
  4100	}
  4101	
  4102	void scx_cgroup_cancel_attach(struct cgroup_taskset *tset)
  4103	{
  4104		struct cgroup_subsys_state *css;
  4105		struct task_struct *p;
  4106	
  4107		if (!scx_cgroup_enabled)
  4108			goto out_unlock;
  4109	
  4110		cgroup_taskset_for_each(p, css, tset) {
  4111			if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
  4112				SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, p,
  4113					    p->scx.cgrp_moving_from, css->cgroup);
  4114			p->scx.cgrp_moving_from = NULL;
  4115		}
  4116	out_unlock:
  4117		percpu_up_read(&scx_cgroup_rwsem);
  4118	}
  4119	
  4120	void scx_group_set_weight(struct task_group *tg, unsigned long weight)
  4121	{
  4122		percpu_down_read(&scx_cgroup_rwsem);
  4123	
  4124		if (scx_cgroup_enabled && tg->scx_weight != weight) {
  4125			if (SCX_HAS_OP(cgroup_set_weight))
  4126				SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_set_weight,
  4127					    tg_cgrp(tg), weight);
  4128			tg->scx_weight = weight;
  4129		}
  4130	
  4131		percpu_up_read(&scx_cgroup_rwsem);
  4132	}
  4133	
  4134	void scx_group_set_idle(struct task_group *tg, bool idle)
  4135	{
  4136		percpu_down_read(&scx_cgroup_rwsem);
  4137		scx_cgroup_warn_missing_idle(tg);
  4138		percpu_up_read(&scx_cgroup_rwsem);
  4139	}
  4140	
  4141	static void scx_cgroup_lock(void)
  4142	{
  4143		percpu_down_write(&scx_cgroup_rwsem);
  4144	}
  4145	
  4146	static void scx_cgroup_unlock(void)
  4147	{
  4148		percpu_up_write(&scx_cgroup_rwsem);
  4149	}
  4150	
  4151	#else	/* CONFIG_EXT_GROUP_SCHED */
  4152	
  4153	static inline void scx_cgroup_lock(void) {}
  4154	static inline void scx_cgroup_unlock(void) {}
  4155	
  4156	#endif	/* CONFIG_EXT_GROUP_SCHED */
  4157	
  4158	/*
  4159	 * Omitted operations:
  4160	 *
  4161	 * - wakeup_preempt: NOOP as it isn't useful in the wakeup path because the task
  4162	 *   isn't tied to the CPU at that point. Preemption is implemented by resetting
  4163	 *   the victim task's slice to 0 and triggering reschedule on the target CPU.
  4164	 *
  4165	 * - migrate_task_rq: Unnecessary as task to cpu mapping is transient.
  4166	 *
  4167	 * - task_fork/dead: We need fork/dead notifications for all tasks regardless of
  4168	 *   their current sched_class. Call them directly from sched core instead.
  4169	 */
  4170	DEFINE_SCHED_CLASS(ext) = {
  4171		.enqueue_task		= enqueue_task_scx,
  4172		.dequeue_task		= dequeue_task_scx,
  4173		.yield_task		= yield_task_scx,
  4174		.yield_to_task		= yield_to_task_scx,
  4175	
  4176		.wakeup_preempt		= wakeup_preempt_scx,
  4177	
  4178		.balance		= balance_scx,
  4179		.pick_task		= pick_task_scx,
  4180	
  4181		.put_prev_task		= put_prev_task_scx,
  4182		.set_next_task		= set_next_task_scx,
  4183	
  4184	#ifdef CONFIG_SMP
  4185		.select_task_rq		= select_task_rq_scx,
  4186		.task_woken		= task_woken_scx,
  4187		.set_cpus_allowed	= set_cpus_allowed_scx,
  4188	
  4189		.rq_online		= rq_online_scx,
  4190		.rq_offline		= rq_offline_scx,
  4191	#endif
  4192	
  4193		.task_tick		= task_tick_scx,
  4194	
  4195		.switching_to		= switching_to_scx,
  4196		.switched_from		= switched_from_scx,
  4197		.switched_to		= switched_to_scx,
  4198		.reweight_task		= reweight_task_scx,
  4199		.prio_changed		= prio_changed_scx,
  4200	
  4201		.update_curr		= update_curr_scx,
  4202	
  4203	#ifdef CONFIG_UCLAMP_TASK
  4204		.uclamp_enabled		= 1,
  4205	#endif
  4206	};
  4207	
  4208	static void init_dsq(struct scx_dispatch_q *dsq, u64 dsq_id)
  4209	{
  4210		memset(dsq, 0, sizeof(*dsq));
  4211	
  4212		raw_spin_lock_init(&dsq->lock);
  4213		INIT_LIST_HEAD(&dsq->list);
  4214		dsq->id = dsq_id;
  4215	}
  4216	
  4217	static struct scx_dispatch_q *create_dsq(u64 dsq_id, int node)
  4218	{
  4219		struct scx_dispatch_q *dsq;
  4220		int ret;
  4221	
  4222		if (dsq_id & SCX_DSQ_FLAG_BUILTIN)
  4223			return ERR_PTR(-EINVAL);
  4224	
  4225		dsq = kmalloc_node(sizeof(*dsq), GFP_KERNEL, node);
  4226		if (!dsq)
  4227			return ERR_PTR(-ENOMEM);
  4228	
  4229		init_dsq(dsq, dsq_id);
  4230	
  4231		ret = rhashtable_insert_fast(&dsq_hash, &dsq->hash_node,
  4232					     dsq_hash_params);
  4233		if (ret) {
  4234			kfree(dsq);
  4235			return ERR_PTR(ret);
  4236		}
  4237		return dsq;
  4238	}
  4239	
  4240	static void free_dsq_irq_workfn(struct irq_work *irq_work)
  4241	{
  4242		struct llist_node *to_free = llist_del_all(&dsqs_to_free);
  4243		struct scx_dispatch_q *dsq, *tmp_dsq;
  4244	
  4245		llist_for_each_entry_safe(dsq, tmp_dsq, to_free, free_node)
  4246			kfree_rcu(dsq, rcu);
  4247	}
  4248	
  4249	static DEFINE_IRQ_WORK(free_dsq_irq_work, free_dsq_irq_workfn);
  4250	
  4251	static void destroy_dsq(u64 dsq_id)
  4252	{
  4253		struct scx_dispatch_q *dsq;
  4254		unsigned long flags;
  4255	
  4256		rcu_read_lock();
  4257	
  4258		dsq = find_user_dsq(dsq_id);
  4259		if (!dsq)
  4260			goto out_unlock_rcu;
  4261	
  4262		raw_spin_lock_irqsave(&dsq->lock, flags);
  4263	
  4264		if (dsq->nr) {
  4265			scx_ops_error("attempting to destroy in-use dsq 0x%016llx (nr=%u)",
  4266				      dsq->id, dsq->nr);
  4267			goto out_unlock_dsq;
  4268		}
  4269	
  4270		if (rhashtable_remove_fast(&dsq_hash, &dsq->hash_node, dsq_hash_params))
  4271			goto out_unlock_dsq;
  4272	
  4273		/*
  4274		 * Mark dead by invalidating ->id to prevent dispatch_enqueue() from
  4275		 * queueing more tasks. As this function can be called from anywhere,
  4276		 * freeing is bounced through an irq work to avoid nesting RCU
  4277		 * operations inside scheduler locks.
  4278		 */
  4279		dsq->id = SCX_DSQ_INVALID;
  4280		llist_add(&dsq->free_node, &dsqs_to_free);
  4281		irq_work_queue(&free_dsq_irq_work);
  4282	
  4283	out_unlock_dsq:
  4284		raw_spin_unlock_irqrestore(&dsq->lock, flags);
  4285	out_unlock_rcu:
  4286		rcu_read_unlock();
  4287	}
  4288	
  4289	#ifdef CONFIG_EXT_GROUP_SCHED
  4290	static void scx_cgroup_exit(void)
  4291	{
  4292		struct cgroup_subsys_state *css;
  4293	
  4294		percpu_rwsem_assert_held(&scx_cgroup_rwsem);
  4295	
  4296		scx_cgroup_enabled = false;
  4297	
  4298		/*
  4299		 * scx_tg_on/offline() are excluded through scx_cgroup_rwsem. If we walk
  4300		 * cgroups and exit all the inited ones, all online cgroups are exited.
  4301		 */
  4302		rcu_read_lock();
  4303		css_for_each_descendant_post(css, &root_task_group.css) {
  4304			struct task_group *tg = css_tg(css);
  4305	
  4306			if (!(tg->scx_flags & SCX_TG_INITED))
  4307				continue;
  4308			tg->scx_flags &= ~SCX_TG_INITED;
  4309	
  4310			if (!scx_ops.cgroup_exit)
  4311				continue;
  4312	
  4313			if (WARN_ON_ONCE(!css_tryget(css)))
  4314				continue;
  4315			rcu_read_unlock();
  4316	
  4317			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, css->cgroup);
  4318	
  4319			rcu_read_lock();
  4320			css_put(css);
  4321		}
  4322		rcu_read_unlock();
  4323	}
  4324	
  4325	static int scx_cgroup_init(void)
  4326	{
  4327		struct cgroup_subsys_state *css;
  4328		int ret;
  4329	
  4330		percpu_rwsem_assert_held(&scx_cgroup_rwsem);
  4331	
  4332		cgroup_warned_missing_weight = false;
  4333		cgroup_warned_missing_idle = false;
  4334	
  4335		/*
  4336		 * scx_tg_on/offline() are excluded through scx_cgroup_rwsem. If we walk
  4337		 * cgroups and init, all online cgroups are initialized.
  4338		 */
  4339		rcu_read_lock();
  4340		css_for_each_descendant_pre(css, &root_task_group.css) {
  4341			struct task_group *tg = css_tg(css);
  4342			struct scx_cgroup_init_args args = { .weight = tg->scx_weight };
  4343	
  4344			scx_cgroup_warn_missing_weight(tg);
  4345			scx_cgroup_warn_missing_idle(tg);
  4346	
  4347			if ((tg->scx_flags &
  4348			     (SCX_TG_ONLINE | SCX_TG_INITED)) != SCX_TG_ONLINE)
  4349				continue;
  4350	
  4351			if (!scx_ops.cgroup_init) {
  4352				tg->scx_flags |= SCX_TG_INITED;
  4353				continue;
  4354			}
  4355	
  4356			if (WARN_ON_ONCE(!css_tryget(css)))
  4357				continue;
  4358			rcu_read_unlock();
  4359	
  4360			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init,
  4361					      css->cgroup, &args);
  4362			if (ret) {
  4363				css_put(css);
  4364				scx_ops_error("ops.cgroup_init() failed (%d)", ret);
  4365				return ret;
  4366			}
  4367			tg->scx_flags |= SCX_TG_INITED;
  4368	
  4369			rcu_read_lock();
  4370			css_put(css);
  4371		}
  4372		rcu_read_unlock();
  4373	
  4374		WARN_ON_ONCE(scx_cgroup_enabled);
  4375		scx_cgroup_enabled = true;
  4376	
  4377		return 0;
  4378	}
  4379	
  4380	#else
  4381	static void scx_cgroup_exit(void) {}
  4382	static int scx_cgroup_init(void) { return 0; }
  4383	#endif
  4384	
  4385	
  4386	/********************************************************************************
  4387	 * Sysfs interface and ops enable/disable.
  4388	 */
  4389	
  4390	#define SCX_ATTR(_name)								\
  4391		static struct kobj_attribute scx_attr_##_name = {			\
  4392			.attr = { .name = __stringify(_name), .mode = 0444 },		\
  4393			.show = scx_attr_##_name##_show,				\
  4394		}
  4395	
  4396	static ssize_t scx_attr_state_show(struct kobject *kobj,
  4397					   struct kobj_attribute *ka, char *buf)
  4398	{
  4399		return sysfs_emit(buf, "%s\n",
  4400				  scx_ops_enable_state_str[scx_ops_enable_state()]);
  4401	}
  4402	SCX_ATTR(state);
  4403	
  4404	static ssize_t scx_attr_switch_all_show(struct kobject *kobj,
  4405						struct kobj_attribute *ka, char *buf)
  4406	{
  4407		return sysfs_emit(buf, "%d\n", READ_ONCE(scx_switching_all));
  4408	}
  4409	SCX_ATTR(switch_all);
  4410	
  4411	static ssize_t scx_attr_nr_rejected_show(struct kobject *kobj,
  4412						 struct kobj_attribute *ka, char *buf)
  4413	{
  4414		return sysfs_emit(buf, "%ld\n", atomic_long_read(&scx_nr_rejected));
  4415	}
  4416	SCX_ATTR(nr_rejected);
  4417	
  4418	static ssize_t scx_attr_hotplug_seq_show(struct kobject *kobj,
  4419						 struct kobj_attribute *ka, char *buf)
  4420	{
  4421		return sysfs_emit(buf, "%ld\n", atomic_long_read(&scx_hotplug_seq));
  4422	}
  4423	SCX_ATTR(hotplug_seq);
  4424	
  4425	static ssize_t scx_attr_enable_seq_show(struct kobject *kobj,
  4426						struct kobj_attribute *ka, char *buf)
  4427	{
  4428		return sysfs_emit(buf, "%ld\n", atomic_long_read(&scx_enable_seq));
  4429	}
  4430	SCX_ATTR(enable_seq);
  4431	
  4432	static struct attribute *scx_global_attrs[] = {
  4433		&scx_attr_state.attr,
  4434		&scx_attr_switch_all.attr,
  4435		&scx_attr_nr_rejected.attr,
  4436		&scx_attr_hotplug_seq.attr,
  4437		&scx_attr_enable_seq.attr,
  4438		NULL,
  4439	};
  4440	
  4441	static const struct attribute_group scx_global_attr_group = {
  4442		.attrs = scx_global_attrs,
  4443	};
  4444	
  4445	static void scx_kobj_release(struct kobject *kobj)
  4446	{
  4447		kfree(kobj);
  4448	}
  4449	
  4450	static ssize_t scx_attr_ops_show(struct kobject *kobj,
  4451					 struct kobj_attribute *ka, char *buf)
  4452	{
  4453		return sysfs_emit(buf, "%s\n", scx_ops.name);
  4454	}
  4455	SCX_ATTR(ops);
  4456	
  4457	#define scx_attr_event_show(buf, at, events, kind) ({				\
  4458		sysfs_emit_at(buf, at, "%s %llu\n", #kind, (events)->kind);		\
  4459	})
  4460	
  4461	static ssize_t scx_attr_events_show(struct kobject *kobj,
  4462					    struct kobj_attribute *ka, char *buf)
  4463	{
  4464		struct scx_event_stats events;
  4465		int at = 0;
  4466	
  4467		scx_bpf_events(&events, sizeof(events));
  4468		at += scx_attr_event_show(buf, at, &events, SCX_EV_SELECT_CPU_FALLBACK);
  4469		at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
  4470		at += scx_attr_event_show(buf, at, &events, SCX_EV_DISPATCH_KEEP_LAST);
  4471		at += scx_attr_event_show(buf, at, &events, SCX_EV_ENQ_SKIP_EXITING);
  4472		at += scx_attr_event_show(buf, at, &events, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED);
  4473		at += scx_attr_event_show(buf, at, &events, SCX_EV_ENQ_SLICE_DFL);
  4474		at += scx_attr_event_show(buf, at, &events, SCX_EV_BYPASS_DURATION);
  4475		at += scx_attr_event_show(buf, at, &events, SCX_EV_BYPASS_DISPATCH);
  4476		at += scx_attr_event_show(buf, at, &events, SCX_EV_BYPASS_ACTIVATE);
  4477		return at;
  4478	}
  4479	SCX_ATTR(events);
  4480	
  4481	static struct attribute *scx_sched_attrs[] = {
  4482		&scx_attr_ops.attr,
  4483		&scx_attr_events.attr,
  4484		NULL,
  4485	};
  4486	ATTRIBUTE_GROUPS(scx_sched);
  4487	
  4488	static const struct kobj_type scx_ktype = {
  4489		.release = scx_kobj_release,
  4490		.sysfs_ops = &kobj_sysfs_ops,
  4491		.default_groups = scx_sched_groups,
  4492	};
  4493	
  4494	static int scx_uevent(const struct kobject *kobj, struct kobj_uevent_env *env)
  4495	{
  4496		return add_uevent_var(env, "SCXOPS=%s", scx_ops.name);
  4497	}
  4498	
  4499	static const struct kset_uevent_ops scx_uevent_ops = {
  4500		.uevent = scx_uevent,
  4501	};
  4502	
  4503	/*
  4504	 * Used by sched_fork() and __setscheduler_prio() to pick the matching
  4505	 * sched_class. dl/rt are already handled.
  4506	 */
  4507	bool task_should_scx(int policy)
  4508	{
  4509		if (!scx_enabled() ||
  4510		    unlikely(scx_ops_enable_state() == SCX_OPS_DISABLING))
  4511			return false;
  4512		if (READ_ONCE(scx_switching_all))
  4513			return true;
  4514		return policy == SCHED_EXT;
  4515	}
  4516	
  4517	/**
  4518	 * scx_softlockup - sched_ext softlockup handler
  4519	 * @dur_s: number of seconds of CPU stuck due to soft lockup
  4520	 *
  4521	 * On some multi-socket setups (e.g. 2x Intel 8480c), the BPF scheduler can
  4522	 * live-lock the system by making many CPUs target the same DSQ to the point
  4523	 * where soft-lockup detection triggers. This function is called from
  4524	 * soft-lockup watchdog when the triggering point is close and tries to unjam
  4525	 * the system by enabling the breather and aborting the BPF scheduler.
  4526	 */
  4527	void scx_softlockup(u32 dur_s)
  4528	{
  4529		switch (scx_ops_enable_state()) {
  4530		case SCX_OPS_ENABLING:
  4531		case SCX_OPS_ENABLED:
  4532			break;
  4533		default:
  4534			return;
  4535		}
  4536	
  4537		/* allow only one instance, cleared at the end of scx_ops_bypass() */
  4538		if (test_and_set_bit(0, &scx_in_softlockup))
  4539			return;
  4540	
  4541		printk_deferred(KERN_ERR "sched_ext: Soft lockup - CPU%d stuck for %us, disabling \"%s\"\n",
  4542				smp_processor_id(), dur_s, scx_ops.name);
  4543	
  4544		/*
  4545		 * Some CPUs may be trapped in the dispatch paths. Enable breather
  4546		 * immediately; otherwise, we might even be able to get to
  4547		 * scx_ops_bypass().
  4548		 */
  4549		atomic_inc(&scx_ops_breather_depth);
  4550	
  4551		scx_ops_error("soft lockup - CPU#%d stuck for %us",
  4552			      smp_processor_id(), dur_s);
  4553	}
  4554	
  4555	static void scx_clear_softlockup(void)
  4556	{
  4557		if (test_and_clear_bit(0, &scx_in_softlockup))
  4558			atomic_dec(&scx_ops_breather_depth);
  4559	}
  4560	
  4561	/**
  4562	 * scx_ops_bypass - [Un]bypass scx_ops and guarantee forward progress
  4563	 * @bypass: true for bypass, false for unbypass
  4564	 *
  4565	 * Bypassing guarantees that all runnable tasks make forward progress without
  4566	 * trusting the BPF scheduler. We can't grab any mutexes or rwsems as they might
  4567	 * be held by tasks that the BPF scheduler is forgetting to run, which
  4568	 * unfortunately also excludes toggling the static branches.
  4569	 *
  4570	 * Let's work around by overriding a couple ops and modifying behaviors based on
  4571	 * the DISABLING state and then cycling the queued tasks through dequeue/enqueue
  4572	 * to force global FIFO scheduling.
  4573	 *
  4574	 * - ops.select_cpu() is ignored and the default select_cpu() is used.
  4575	 *
  4576	 * - ops.enqueue() is ignored and tasks are queued in simple global FIFO order.
  4577	 *   %SCX_OPS_ENQ_LAST is also ignored.
  4578	 *
  4579	 * - ops.dispatch() is ignored.
  4580	 *
  4581	 * - balance_scx() does not set %SCX_RQ_BAL_KEEP on non-zero slice as slice
  4582	 *   can't be trusted. Whenever a tick triggers, the running task is rotated to
  4583	 *   the tail of the queue with core_sched_at touched.
  4584	 *
  4585	 * - pick_next_task() suppresses zero slice warning.
  4586	 *
  4587	 * - scx_bpf_kick_cpu() is disabled to avoid irq_work malfunction during PM
  4588	 *   operations.
  4589	 *
  4590	 * - scx_prio_less() reverts to the default core_sched_at order.
  4591	 */
  4592	static void scx_ops_bypass(bool bypass)
  4593	{
  4594		static DEFINE_RAW_SPINLOCK(bypass_lock);
  4595		static unsigned long bypass_timestamp;
  4596	
  4597		int cpu;
  4598		unsigned long flags;
  4599	
  4600		raw_spin_lock_irqsave(&bypass_lock, flags);
  4601		if (bypass) {
  4602			scx_ops_bypass_depth++;
  4603			WARN_ON_ONCE(scx_ops_bypass_depth <= 0);
  4604			if (scx_ops_bypass_depth != 1)
  4605				goto unlock;
  4606			bypass_timestamp = ktime_get_ns();
  4607			scx_add_event(SCX_EV_BYPASS_ACTIVATE, 1);
  4608		} else {
  4609			scx_ops_bypass_depth--;
  4610			WARN_ON_ONCE(scx_ops_bypass_depth < 0);
  4611			if (scx_ops_bypass_depth != 0)
  4612				goto unlock;
  4613			scx_add_event(SCX_EV_BYPASS_DURATION,
  4614				      ktime_get_ns() - bypass_timestamp);
  4615		}
  4616	
  4617		atomic_inc(&scx_ops_breather_depth);
  4618	
  4619		/*
  4620		 * No task property is changing. We just need to make sure all currently
  4621		 * queued tasks are re-queued according to the new scx_rq_bypassing()
  4622		 * state. As an optimization, walk each rq's runnable_list instead of
  4623		 * the scx_tasks list.
  4624		 *
  4625		 * This function can't trust the scheduler and thus can't use
  4626		 * cpus_read_lock(). Walk all possible CPUs instead of online.
  4627		 */
  4628		for_each_possible_cpu(cpu) {
  4629			struct rq *rq = cpu_rq(cpu);
  4630			struct task_struct *p, *n;
  4631	
  4632			raw_spin_rq_lock(rq);
  4633	
  4634			if (bypass) {
  4635				WARN_ON_ONCE(rq->scx.flags & SCX_RQ_BYPASSING);
  4636				rq->scx.flags |= SCX_RQ_BYPASSING;
  4637			} else {
  4638				WARN_ON_ONCE(!(rq->scx.flags & SCX_RQ_BYPASSING));
  4639				rq->scx.flags &= ~SCX_RQ_BYPASSING;
  4640			}
  4641	
  4642			/*
  4643			 * We need to guarantee that no tasks are on the BPF scheduler
  4644			 * while bypassing. Either we see enabled or the enable path
  4645			 * sees scx_rq_bypassing() before moving tasks to SCX.
  4646			 */
  4647			if (!scx_enabled()) {
  4648				raw_spin_rq_unlock(rq);
  4649				continue;
  4650			}
  4651	
  4652			/*
  4653			 * The use of list_for_each_entry_safe_reverse() is required
  4654			 * because each task is going to be removed from and added back
  4655			 * to the runnable_list during iteration. Because they're added
  4656			 * to the tail of the list, safe reverse iteration can still
  4657			 * visit all nodes.
  4658			 */
  4659			list_for_each_entry_safe_reverse(p, n, &rq->scx.runnable_list,
  4660							 scx.runnable_node) {
  4661				struct sched_enq_and_set_ctx ctx;
  4662	
  4663				/* cycling deq/enq is enough, see the function comment */
  4664				sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE, &ctx);
  4665				sched_enq_and_set_task(&ctx);
  4666			}
  4667	
  4668			/* resched to restore ticks and idle state */
  4669			if (cpu_online(cpu) || cpu == smp_processor_id())
  4670				resched_curr(rq);
  4671	
  4672			raw_spin_rq_unlock(rq);
  4673		}
  4674	
  4675		atomic_dec(&scx_ops_breather_depth);
  4676	unlock:
  4677		raw_spin_unlock_irqrestore(&bypass_lock, flags);
  4678		scx_clear_softlockup();
  4679	}
  4680	
  4681	static void free_exit_info(struct scx_exit_info *ei)
  4682	{
  4683		kfree(ei->dump);
  4684		kfree(ei->msg);
  4685		kfree(ei->bt);
  4686		kfree(ei);
  4687	}
  4688	
  4689	static struct scx_exit_info *alloc_exit_info(size_t exit_dump_len)
  4690	{
  4691		struct scx_exit_info *ei;
  4692	
  4693		ei = kzalloc(sizeof(*ei), GFP_KERNEL);
  4694		if (!ei)
  4695			return NULL;
  4696	
  4697		ei->bt = kcalloc(SCX_EXIT_BT_LEN, sizeof(ei->bt[0]), GFP_KERNEL);
  4698		ei->msg = kzalloc(SCX_EXIT_MSG_LEN, GFP_KERNEL);
  4699		ei->dump = kzalloc(exit_dump_len, GFP_KERNEL);
  4700	
  4701		if (!ei->bt || !ei->msg || !ei->dump) {
  4702			free_exit_info(ei);
  4703			return NULL;
  4704		}
  4705	
  4706		return ei;
  4707	}
  4708	
  4709	static const char *scx_exit_reason(enum scx_exit_kind kind)
  4710	{
  4711		switch (kind) {
  4712		case SCX_EXIT_UNREG:
  4713			return "unregistered from user space";
  4714		case SCX_EXIT_UNREG_BPF:
  4715			return "unregistered from BPF";
  4716		case SCX_EXIT_UNREG_KERN:
  4717			return "unregistered from the main kernel";
  4718		case SCX_EXIT_SYSRQ:
  4719			return "disabled by sysrq-S";
  4720		case SCX_EXIT_ERROR:
  4721			return "runtime error";
  4722		case SCX_EXIT_ERROR_BPF:
  4723			return "scx_bpf_error";
  4724		case SCX_EXIT_ERROR_STALL:
  4725			return "runnable task stall";
  4726		default:
  4727			return "<UNKNOWN>";
  4728		}
  4729	}
  4730	
  4731	static void scx_ops_disable_workfn(struct kthread_work *work)
  4732	{
  4733		struct scx_exit_info *ei = scx_exit_info;
  4734		struct scx_task_iter sti;
  4735		struct task_struct *p;
  4736		struct rhashtable_iter rht_iter;
  4737		struct scx_dispatch_q *dsq;
  4738		int i, kind, cpu;
  4739	
  4740		kind = atomic_read(&scx_exit_kind);
  4741		while (true) {
  4742			/*
  4743			 * NONE indicates that a new scx_ops has been registered since
  4744			 * disable was scheduled - don't kill the new ops. DONE
  4745			 * indicates that the ops has already been disabled.
  4746			 */
  4747			if (kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE)
  4748				return;
  4749			if (atomic_try_cmpxchg(&scx_exit_kind, &kind, SCX_EXIT_DONE))
  4750				break;
  4751		}
  4752		ei->kind = kind;
  4753		ei->reason = scx_exit_reason(ei->kind);
  4754	
  4755		/* guarantee forward progress by bypassing scx_ops */
  4756		scx_ops_bypass(true);
  4757	
  4758		switch (scx_ops_set_enable_state(SCX_OPS_DISABLING)) {
  4759		case SCX_OPS_DISABLING:
  4760			WARN_ONCE(true, "sched_ext: duplicate disabling instance?");
  4761			break;
  4762		case SCX_OPS_DISABLED:
  4763			pr_warn("sched_ext: ops error detected without ops (%s)\n",
  4764				scx_exit_info->msg);
  4765			WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_DISABLED) !=
  4766				     SCX_OPS_DISABLING);
  4767			goto done;
  4768		default:
  4769			break;
  4770		}
  4771	
  4772		/*
  4773		 * Here, every runnable task is guaranteed to make forward progress and
  4774		 * we can safely use blocking synchronization constructs. Actually
  4775		 * disable ops.
  4776		 */
  4777		mutex_lock(&scx_ops_enable_mutex);
  4778	
  4779		static_branch_disable(&__scx_switched_all);
  4780		WRITE_ONCE(scx_switching_all, false);
  4781	
  4782		/*
  4783		 * Shut down cgroup support before tasks so that the cgroup attach path
  4784		 * doesn't race against scx_ops_exit_task().
  4785		 */
  4786		scx_cgroup_lock();
  4787		scx_cgroup_exit();
  4788		scx_cgroup_unlock();
  4789	
  4790		/*
  4791		 * The BPF scheduler is going away. All tasks including %TASK_DEAD ones
  4792		 * must be switched out and exited synchronously.
  4793		 */
  4794		percpu_down_write(&scx_fork_rwsem);
  4795	
  4796		scx_ops_init_task_enabled = false;
  4797	
  4798		scx_task_iter_start(&sti);
  4799		while ((p = scx_task_iter_next_locked(&sti))) {
  4800			const struct sched_class *old_class = p->sched_class;
  4801			const struct sched_class *new_class =
  4802				__setscheduler_class(p->policy, p->prio);
  4803			struct sched_enq_and_set_ctx ctx;
  4804	
  4805			if (old_class != new_class && p->se.sched_delayed)
  4806				dequeue_task(task_rq(p), p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
  4807	
  4808			sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE, &ctx);
  4809	
  4810			p->sched_class = new_class;
  4811			check_class_changing(task_rq(p), p, old_class);
  4812	
  4813			sched_enq_and_set_task(&ctx);
  4814	
  4815			check_class_changed(task_rq(p), p, old_class, p->prio);
  4816			scx_ops_exit_task(p);
  4817		}
  4818		scx_task_iter_stop(&sti);
  4819		percpu_up_write(&scx_fork_rwsem);
  4820	
  4821		/*
  4822		 * Invalidate all the rq clocks to prevent getting outdated
  4823		 * rq clocks from a previous scx scheduler.
  4824		 */
  4825		for_each_possible_cpu(cpu) {
  4826			struct rq *rq = cpu_rq(cpu);
  4827			scx_rq_clock_invalidate(rq);
  4828		}
  4829	
  4830		/* no task is on scx, turn off all the switches and flush in-progress calls */
  4831		static_branch_disable(&__scx_ops_enabled);
  4832		for (i = SCX_OPI_BEGIN; i < SCX_OPI_END; i++)
  4833			static_branch_disable(&scx_has_op[i]);
  4834		static_branch_disable(&scx_ops_allow_queued_wakeup);
  4835		static_branch_disable(&scx_ops_enq_last);
  4836		static_branch_disable(&scx_ops_enq_exiting);
  4837		static_branch_disable(&scx_ops_enq_migration_disabled);
  4838		static_branch_disable(&scx_ops_cpu_preempt);
  4839		scx_idle_disable();
  4840		synchronize_rcu();
  4841	
  4842		if (ei->kind >= SCX_EXIT_ERROR) {
  4843			pr_err("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
  4844			       scx_ops.name, ei->reason);
  4845	
  4846			if (ei->msg[0] != '\0')
  4847				pr_err("sched_ext: %s: %s\n", scx_ops.name, ei->msg);
  4848	#ifdef CONFIG_STACKTRACE
  4849			stack_trace_print(ei->bt, ei->bt_len, 2);
  4850	#endif
  4851		} else {
  4852			pr_info("sched_ext: BPF scheduler \"%s\" disabled (%s)\n",
  4853				scx_ops.name, ei->reason);
  4854		}
  4855	
  4856		if (scx_ops.exit)
  4857			SCX_CALL_OP(SCX_KF_UNLOCKED, exit, ei);
  4858	
  4859		cancel_delayed_work_sync(&scx_watchdog_work);
  4860	
  4861		/*
  4862		 * Delete the kobject from the hierarchy eagerly in addition to just
  4863		 * dropping a reference. Otherwise, if the object is deleted
  4864		 * asynchronously, sysfs could observe an object of the same name still
  4865		 * in the hierarchy when another scheduler is loaded.
  4866		 */
  4867		kobject_del(scx_root_kobj);
  4868		kobject_put(scx_root_kobj);
  4869		scx_root_kobj = NULL;
  4870	
  4871		memset(&scx_ops, 0, sizeof(scx_ops));
  4872	
  4873		rhashtable_walk_enter(&dsq_hash, &rht_iter);
  4874		do {
  4875			rhashtable_walk_start(&rht_iter);
  4876	
  4877			while ((dsq = rhashtable_walk_next(&rht_iter)) && !IS_ERR(dsq))
  4878				destroy_dsq(dsq->id);
  4879	
  4880			rhashtable_walk_stop(&rht_iter);
  4881		} while (dsq == ERR_PTR(-EAGAIN));
  4882		rhashtable_walk_exit(&rht_iter);
  4883	
  4884		free_percpu(scx_dsp_ctx);
  4885		scx_dsp_ctx = NULL;
  4886		scx_dsp_max_batch = 0;
  4887	
  4888		free_exit_info(scx_exit_info);
  4889		scx_exit_info = NULL;
  4890	
  4891		mutex_unlock(&scx_ops_enable_mutex);
  4892	
  4893		WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_DISABLED) !=
  4894			     SCX_OPS_DISABLING);
  4895	done:
  4896		scx_ops_bypass(false);
  4897	}
  4898	
  4899	static DEFINE_KTHREAD_WORK(scx_ops_disable_work, scx_ops_disable_workfn);
  4900	
  4901	static void schedule_scx_ops_disable_work(void)
  4902	{
  4903		struct kthread_worker *helper = READ_ONCE(scx_ops_helper);
  4904	
  4905		/*
  4906		 * We may be called spuriously before the first bpf_sched_ext_reg(). If
  4907		 * scx_ops_helper isn't set up yet, there's nothing to do.
  4908		 */
  4909		if (helper)
  4910			kthread_queue_work(helper, &scx_ops_disable_work);
  4911	}
  4912	
  4913	static void scx_ops_disable(enum scx_exit_kind kind)
  4914	{
  4915		int none = SCX_EXIT_NONE;
  4916	
  4917		if (WARN_ON_ONCE(kind == SCX_EXIT_NONE || kind == SCX_EXIT_DONE))
  4918			kind = SCX_EXIT_ERROR;
  4919	
  4920		atomic_try_cmpxchg(&scx_exit_kind, &none, kind);
  4921	
  4922		schedule_scx_ops_disable_work();
  4923	}
  4924	
  4925	static void dump_newline(struct seq_buf *s)
  4926	{
  4927		trace_sched_ext_dump("");
  4928	
  4929		/* @s may be zero sized and seq_buf triggers WARN if so */
  4930		if (s->size)
  4931			seq_buf_putc(s, '\n');
  4932	}
  4933	
  4934	static __printf(2, 3) void dump_line(struct seq_buf *s, const char *fmt, ...)
  4935	{
  4936		va_list args;
  4937	
  4938	#ifdef CONFIG_TRACEPOINTS
  4939		if (trace_sched_ext_dump_enabled()) {
  4940			/* protected by scx_dump_state()::dump_lock */
  4941			static char line_buf[SCX_EXIT_MSG_LEN];
  4942	
  4943			va_start(args, fmt);
  4944			vscnprintf(line_buf, sizeof(line_buf), fmt, args);
  4945			va_end(args);
  4946	
  4947			trace_sched_ext_dump(line_buf);
  4948		}
  4949	#endif
  4950		/* @s may be zero sized and seq_buf triggers WARN if so */
  4951		if (s->size) {
  4952			va_start(args, fmt);
  4953			seq_buf_vprintf(s, fmt, args);
  4954			va_end(args);
  4955	
  4956			seq_buf_putc(s, '\n');
  4957		}
  4958	}
  4959	
  4960	static void dump_stack_trace(struct seq_buf *s, const char *prefix,
  4961				     const unsigned long *bt, unsigned int len)
  4962	{
  4963		unsigned int i;
  4964	
  4965		for (i = 0; i < len; i++)
  4966			dump_line(s, "%s%pS", prefix, (void *)bt[i]);
  4967	}
  4968	
  4969	static void ops_dump_init(struct seq_buf *s, const char *prefix)
  4970	{
  4971		struct scx_dump_data *dd = &scx_dump_data;
  4972	
  4973		lockdep_assert_irqs_disabled();
  4974	
  4975		dd->cpu = smp_processor_id();		/* allow scx_bpf_dump() */
  4976		dd->first = true;
  4977		dd->cursor = 0;
  4978		dd->s = s;
  4979		dd->prefix = prefix;
  4980	}
  4981	
  4982	static void ops_dump_flush(void)
  4983	{
  4984		struct scx_dump_data *dd = &scx_dump_data;
  4985		char *line = dd->buf.line;
  4986	
  4987		if (!dd->cursor)
  4988			return;
  4989	
  4990		/*
  4991		 * There's something to flush and this is the first line. Insert a blank
  4992		 * line to distinguish ops dump.
  4993		 */
  4994		if (dd->first) {
  4995			dump_newline(dd->s);
  4996			dd->first = false;
  4997		}
  4998	
  4999		/*
  5000		 * There may be multiple lines in $line. Scan and emit each line
  5001		 * separately.
  5002		 */
  5003		while (true) {
  5004			char *end = line;
  5005			char c;
  5006	
  5007			while (*end != '\n' && *end != '\0')
  5008				end++;
  5009	
  5010			/*
  5011			 * If $line overflowed, it may not have newline at the end.
  5012			 * Always emit with a newline.
  5013			 */
  5014			c = *end;
  5015			*end = '\0';
  5016			dump_line(dd->s, "%s%s", dd->prefix, line);
  5017			if (c == '\0')
  5018				break;
  5019	
  5020			/* move to the next line */
  5021			end++;
  5022			if (*end == '\0')
  5023				break;
  5024			line = end;
  5025		}
  5026	
  5027		dd->cursor = 0;
  5028	}
  5029	
  5030	static void ops_dump_exit(void)
  5031	{
  5032		ops_dump_flush();
  5033		scx_dump_data.cpu = -1;
  5034	}
  5035	
  5036	static void scx_dump_task(struct seq_buf *s, struct scx_dump_ctx *dctx,
  5037				  struct task_struct *p, char marker)
  5038	{
  5039		static unsigned long bt[SCX_EXIT_BT_LEN];
  5040		char dsq_id_buf[19] = "(n/a)";
  5041		unsigned long ops_state = atomic_long_read(&p->scx.ops_state);
  5042		unsigned int bt_len = 0;
  5043	
  5044		if (p->scx.dsq)
  5045			scnprintf(dsq_id_buf, sizeof(dsq_id_buf), "0x%llx",
  5046				  (unsigned long long)p->scx.dsq->id);
  5047	
  5048		dump_newline(s);
  5049		dump_line(s, " %c%c %s[%d] %+ldms",
  5050			  marker, task_state_to_char(p), p->comm, p->pid,
  5051			  jiffies_delta_msecs(p->scx.runnable_at, dctx->at_jiffies));
  5052		dump_line(s, "      scx_state/flags=%u/0x%x dsq_flags=0x%x ops_state/qseq=%lu/%lu",
  5053			  scx_get_task_state(p), p->scx.flags & ~SCX_TASK_STATE_MASK,
  5054			  p->scx.dsq_flags, ops_state & SCX_OPSS_STATE_MASK,
  5055			  ops_state >> SCX_OPSS_QSEQ_SHIFT);
  5056		dump_line(s, "      sticky/holding_cpu=%d/%d dsq_id=%s",
  5057			  p->scx.sticky_cpu, p->scx.holding_cpu, dsq_id_buf);
  5058		dump_line(s, "      dsq_vtime=%llu slice=%llu weight=%u",
  5059			  p->scx.dsq_vtime, p->scx.slice, p->scx.weight);
  5060		dump_line(s, "      cpus=%*pb", cpumask_pr_args(p->cpus_ptr));
  5061	
  5062		if (SCX_HAS_OP(dump_task)) {
  5063			ops_dump_init(s, "    ");
  5064			SCX_CALL_OP(SCX_KF_REST, dump_task, dctx, p);
  5065			ops_dump_exit();
  5066		}
  5067	
  5068	#ifdef CONFIG_STACKTRACE
  5069		bt_len = stack_trace_save_tsk(p, bt, SCX_EXIT_BT_LEN, 1);
  5070	#endif
  5071		if (bt_len) {
  5072			dump_newline(s);
  5073			dump_stack_trace(s, "    ", bt, bt_len);
  5074		}
  5075	}
  5076	
  5077	static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
  5078	{
  5079		static DEFINE_SPINLOCK(dump_lock);
  5080		static const char trunc_marker[] = "\n\n~~~~ TRUNCATED ~~~~\n";
  5081		struct scx_dump_ctx dctx = {
  5082			.kind = ei->kind,
  5083			.exit_code = ei->exit_code,
  5084			.reason = ei->reason,
  5085			.at_ns = ktime_get_ns(),
  5086			.at_jiffies = jiffies,
  5087		};
  5088		struct seq_buf s;
  5089		struct scx_event_stats events;
  5090		unsigned long flags;
  5091		char *buf;
  5092		int cpu;
  5093	
  5094		spin_lock_irqsave(&dump_lock, flags);
  5095	
  5096		seq_buf_init(&s, ei->dump, dump_len);
  5097	
  5098		if (ei->kind == SCX_EXIT_NONE) {
  5099			dump_line(&s, "Debug dump triggered by %s", ei->reason);
  5100		} else {
  5101			dump_line(&s, "%s[%d] triggered exit kind %d:",
  5102				  current->comm, current->pid, ei->kind);
  5103			dump_line(&s, "  %s (%s)", ei->reason, ei->msg);
  5104			dump_newline(&s);
  5105			dump_line(&s, "Backtrace:");
  5106			dump_stack_trace(&s, "  ", ei->bt, ei->bt_len);
  5107		}
  5108	
  5109		if (SCX_HAS_OP(dump)) {
  5110			ops_dump_init(&s, "");
  5111			SCX_CALL_OP(SCX_KF_UNLOCKED, dump, &dctx);
  5112			ops_dump_exit();
  5113		}
  5114	
  5115		dump_newline(&s);
  5116		dump_line(&s, "CPU states");
  5117		dump_line(&s, "----------");
  5118	
  5119		for_each_possible_cpu(cpu) {
  5120			struct rq *rq = cpu_rq(cpu);
  5121			struct rq_flags rf;
  5122			struct task_struct *p;
  5123			struct seq_buf ns;
  5124			size_t avail, used;
  5125			bool idle;
  5126	
  5127			rq_lock(rq, &rf);
  5128	
  5129			idle = list_empty(&rq->scx.runnable_list) &&
  5130				rq->curr->sched_class == &idle_sched_class;
  5131	
  5132			if (idle && !SCX_HAS_OP(dump_cpu))
  5133				goto next;
  5134	
  5135			/*
  5136			 * We don't yet know whether ops.dump_cpu() will produce output
  5137			 * and we may want to skip the default CPU dump if it doesn't.
  5138			 * Use a nested seq_buf to generate the standard dump so that we
  5139			 * can decide whether to commit later.
  5140			 */
  5141			avail = seq_buf_get_buf(&s, &buf);
  5142			seq_buf_init(&ns, buf, avail);
  5143	
  5144			dump_newline(&ns);
  5145			dump_line(&ns, "CPU %-4d: nr_run=%u flags=0x%x cpu_rel=%d ops_qseq=%lu pnt_seq=%lu",
  5146				  cpu, rq->scx.nr_running, rq->scx.flags,
  5147				  rq->scx.cpu_released, rq->scx.ops_qseq,
  5148				  rq->scx.pnt_seq);
  5149			dump_line(&ns, "          curr=%s[%d] class=%ps",
  5150				  rq->curr->comm, rq->curr->pid,
  5151				  rq->curr->sched_class);
  5152			if (!cpumask_empty(rq->scx.cpus_to_kick))
  5153				dump_line(&ns, "  cpus_to_kick   : %*pb",
  5154					  cpumask_pr_args(rq->scx.cpus_to_kick));
  5155			if (!cpumask_empty(rq->scx.cpus_to_kick_if_idle))
  5156				dump_line(&ns, "  idle_to_kick   : %*pb",
  5157					  cpumask_pr_args(rq->scx.cpus_to_kick_if_idle));
  5158			if (!cpumask_empty(rq->scx.cpus_to_preempt))
  5159				dump_line(&ns, "  cpus_to_preempt: %*pb",
  5160					  cpumask_pr_args(rq->scx.cpus_to_preempt));
  5161			if (!cpumask_empty(rq->scx.cpus_to_wait))
  5162				dump_line(&ns, "  cpus_to_wait   : %*pb",
  5163					  cpumask_pr_args(rq->scx.cpus_to_wait));
  5164	
  5165			used = seq_buf_used(&ns);
  5166			if (SCX_HAS_OP(dump_cpu)) {
  5167				ops_dump_init(&ns, "  ");
  5168				SCX_CALL_OP(SCX_KF_REST, dump_cpu, &dctx, cpu, idle);
  5169				ops_dump_exit();
  5170			}
  5171	
  5172			/*
  5173			 * If idle && nothing generated by ops.dump_cpu(), there's
  5174			 * nothing interesting. Skip.
  5175			 */
  5176			if (idle && used == seq_buf_used(&ns))
  5177				goto next;
  5178	
  5179			/*
  5180			 * $s may already have overflowed when $ns was created. If so,
  5181			 * calling commit on it will trigger BUG.
  5182			 */
  5183			if (avail) {
  5184				seq_buf_commit(&s, seq_buf_used(&ns));
  5185				if (seq_buf_has_overflowed(&ns))
  5186					seq_buf_set_overflow(&s);
  5187			}
  5188	
  5189			if (rq->curr->sched_class == &ext_sched_class)
  5190				scx_dump_task(&s, &dctx, rq->curr, '*');
  5191	
  5192			list_for_each_entry(p, &rq->scx.runnable_list, scx.runnable_node)
  5193				scx_dump_task(&s, &dctx, p, ' ');
  5194		next:
  5195			rq_unlock(rq, &rf);
  5196		}
  5197	
  5198		dump_newline(&s);
  5199		dump_line(&s, "Event counters");
  5200		dump_line(&s, "--------------");
  5201	
  5202		scx_bpf_events(&events, sizeof(events));
  5203		scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
  5204		scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
  5205		scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
  5206		scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
  5207		scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED);
  5208		scx_dump_event(s, &events, SCX_EV_ENQ_SLICE_DFL);
  5209		scx_dump_event(s, &events, SCX_EV_BYPASS_DURATION);
  5210		scx_dump_event(s, &events, SCX_EV_BYPASS_DISPATCH);
  5211		scx_dump_event(s, &events, SCX_EV_BYPASS_ACTIVATE);
  5212	
  5213		if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
  5214			memcpy(ei->dump + dump_len - sizeof(trunc_marker),
  5215			       trunc_marker, sizeof(trunc_marker));
  5216	
  5217		spin_unlock_irqrestore(&dump_lock, flags);
  5218	}
  5219	
  5220	static void scx_ops_error_irq_workfn(struct irq_work *irq_work)
  5221	{
  5222		struct scx_exit_info *ei = scx_exit_info;
  5223	
  5224		if (ei->kind >= SCX_EXIT_ERROR)
  5225			scx_dump_state(ei, scx_ops.exit_dump_len);
  5226	
  5227		schedule_scx_ops_disable_work();
  5228	}
  5229	
  5230	static DEFINE_IRQ_WORK(scx_ops_error_irq_work, scx_ops_error_irq_workfn);
  5231	
  5232	static __printf(3, 4) void scx_ops_exit_kind(enum scx_exit_kind kind,
  5233						     s64 exit_code,
  5234						     const char *fmt, ...)
  5235	{
  5236		struct scx_exit_info *ei = scx_exit_info;
  5237		int none = SCX_EXIT_NONE;
  5238		va_list args;
  5239	
  5240		if (!atomic_try_cmpxchg(&scx_exit_kind, &none, kind))
  5241			return;
  5242	
  5243		ei->exit_code = exit_code;
  5244	#ifdef CONFIG_STACKTRACE
  5245		if (kind >= SCX_EXIT_ERROR)
  5246			ei->bt_len = stack_trace_save(ei->bt, SCX_EXIT_BT_LEN, 1);
  5247	#endif
  5248		va_start(args, fmt);
  5249		vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
  5250		va_end(args);
  5251	
  5252		/*
  5253		 * Set ei->kind and ->reason for scx_dump_state(). They'll be set again
  5254		 * in scx_ops_disable_workfn().
  5255		 */
  5256		ei->kind = kind;
  5257		ei->reason = scx_exit_reason(ei->kind);
  5258	
  5259		irq_work_queue(&scx_ops_error_irq_work);
  5260	}
  5261	
  5262	static struct kthread_worker *scx_create_rt_helper(const char *name)
  5263	{
  5264		struct kthread_worker *helper;
  5265	
  5266		helper = kthread_run_worker(0, name);
  5267		if (helper)
  5268			sched_set_fifo(helper->task);
  5269		return helper;
  5270	}
  5271	
  5272	static void check_hotplug_seq(const struct sched_ext_ops *ops)
  5273	{
  5274		unsigned long long global_hotplug_seq;
  5275	
  5276		/*
  5277		 * If a hotplug event has occurred between when a scheduler was
  5278		 * initialized, and when we were able to attach, exit and notify user
  5279		 * space about it.
  5280		 */
  5281		if (ops->hotplug_seq) {
  5282			global_hotplug_seq = atomic_long_read(&scx_hotplug_seq);
  5283			if (ops->hotplug_seq != global_hotplug_seq) {
  5284				scx_ops_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
  5285					     "expected hotplug seq %llu did not match actual %llu",
  5286					     ops->hotplug_seq, global_hotplug_seq);
  5287			}
  5288		}
  5289	}
  5290	
  5291	static int validate_ops(const struct sched_ext_ops *ops)
  5292	{
  5293		/*
  5294		 * It doesn't make sense to specify the SCX_OPS_ENQ_LAST flag if the
  5295		 * ops.enqueue() callback isn't implemented.
  5296		 */
  5297		if ((ops->flags & SCX_OPS_ENQ_LAST) && !ops->enqueue) {
  5298			scx_ops_error("SCX_OPS_ENQ_LAST requires ops.enqueue() to be implemented");
  5299			return -EINVAL;
  5300		}
  5301	
  5302		/*
  5303		 * SCX_OPS_BUILTIN_IDLE_PER_NODE requires built-in CPU idle
  5304		 * selection policy to be enabled.
  5305		 */
  5306		if ((ops->flags & SCX_OPS_BUILTIN_IDLE_PER_NODE) &&
  5307		    (ops->update_idle && !(ops->flags & SCX_OPS_KEEP_BUILTIN_IDLE))) {
  5308			scx_ops_error("SCX_OPS_BUILTIN_IDLE_PER_NODE requires CPU idle selection enabled");
  5309			return -EINVAL;
  5310		}
  5311	
  5312		return 0;
  5313	}
  5314	
  5315	static int scx_ops_enable(struct sched_ext_ops *ops, struct bpf_link *link)
  5316	{
  5317		struct scx_task_iter sti;
  5318		struct task_struct *p;
  5319		unsigned long timeout;
  5320		int i, cpu, node, ret;
  5321	
  5322		if (!cpumask_equal(housekeeping_cpumask(HK_TYPE_DOMAIN),
  5323				   cpu_possible_mask)) {
  5324			pr_err("sched_ext: Not compatible with \"isolcpus=\" domain isolation\n");
  5325			return -EINVAL;
  5326		}
  5327	
  5328		mutex_lock(&scx_ops_enable_mutex);
  5329	
  5330		/*
  5331		 * Clear event counters so a new scx scheduler gets
  5332		 * fresh event counter values.
  5333		 */
  5334		for_each_possible_cpu(cpu) {
  5335			struct scx_event_stats *e = per_cpu_ptr(&event_stats_cpu, cpu);
  5336			memset(e, 0, sizeof(*e));
  5337		}
  5338	
  5339		if (!scx_ops_helper) {
  5340			WRITE_ONCE(scx_ops_helper,
  5341				   scx_create_rt_helper("sched_ext_ops_helper"));
  5342			if (!scx_ops_helper) {
  5343				ret = -ENOMEM;
  5344				goto err_unlock;
  5345			}
  5346		}
  5347	
  5348		if (!global_dsqs) {
  5349			struct scx_dispatch_q **dsqs;
  5350	
  5351			dsqs = kcalloc(nr_node_ids, sizeof(dsqs[0]), GFP_KERNEL);
  5352			if (!dsqs) {
  5353				ret = -ENOMEM;
  5354				goto err_unlock;
  5355			}
  5356	
  5357			for_each_node_state(node, N_POSSIBLE) {
  5358				struct scx_dispatch_q *dsq;
  5359	
  5360				dsq = kzalloc_node(sizeof(*dsq), GFP_KERNEL, node);
  5361				if (!dsq) {
  5362					for_each_node_state(node, N_POSSIBLE)
  5363						kfree(dsqs[node]);
  5364					kfree(dsqs);
  5365					ret = -ENOMEM;
  5366					goto err_unlock;
  5367				}
  5368	
  5369				init_dsq(dsq, SCX_DSQ_GLOBAL);
  5370				dsqs[node] = dsq;
  5371			}
  5372	
  5373			global_dsqs = dsqs;
  5374		}
  5375	
  5376		if (scx_ops_enable_state() != SCX_OPS_DISABLED) {
  5377			ret = -EBUSY;
  5378			goto err_unlock;
  5379		}
  5380	
  5381		scx_root_kobj = kzalloc(sizeof(*scx_root_kobj), GFP_KERNEL);
  5382		if (!scx_root_kobj) {
  5383			ret = -ENOMEM;
  5384			goto err_unlock;
  5385		}
  5386	
  5387		scx_root_kobj->kset = scx_kset;
  5388		ret = kobject_init_and_add(scx_root_kobj, &scx_ktype, NULL, "root");
  5389		if (ret < 0)
  5390			goto err;
  5391	
  5392		scx_exit_info = alloc_exit_info(ops->exit_dump_len);
  5393		if (!scx_exit_info) {
  5394			ret = -ENOMEM;
  5395			goto err_del;
  5396		}
  5397	
  5398		/*
  5399		 * Set scx_ops, transition to ENABLING and clear exit info to arm the
  5400		 * disable path. Failure triggers full disabling from here on.
  5401		 */
  5402		scx_ops = *ops;
  5403	
  5404		WARN_ON_ONCE(scx_ops_set_enable_state(SCX_OPS_ENABLING) !=
  5405			     SCX_OPS_DISABLED);
  5406	
  5407		atomic_set(&scx_exit_kind, SCX_EXIT_NONE);
  5408		scx_warned_zero_slice = false;
  5409	
  5410		atomic_long_set(&scx_nr_rejected, 0);
  5411	
  5412		for_each_possible_cpu(cpu)
  5413			cpu_rq(cpu)->scx.cpuperf_target = SCX_CPUPERF_ONE;
  5414	
  5415		/*
  5416		 * Keep CPUs stable during enable so that the BPF scheduler can track
  5417		 * online CPUs by watching ->on/offline_cpu() after ->init().
  5418		 */
  5419		cpus_read_lock();
  5420	
  5421		if (scx_ops.init) {
  5422			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init);
  5423			if (ret) {
  5424				ret = ops_sanitize_err("init", ret);
  5425				cpus_read_unlock();
  5426				scx_ops_error("ops.init() failed (%d)", ret);
  5427				goto err_disable;
  5428			}
  5429		}
  5430	
  5431		for (i = SCX_OPI_CPU_HOTPLUG_BEGIN; i < SCX_OPI_CPU_HOTPLUG_END; i++)
  5432			if (((void (**)(void))ops)[i])
  5433				static_branch_enable_cpuslocked(&scx_has_op[i]);
  5434	
  5435		check_hotplug_seq(ops);
  5436		scx_idle_update_selcpu_topology(ops);
  5437	
  5438		cpus_read_unlock();
  5439	
  5440		ret = validate_ops(ops);
  5441		if (ret)
  5442			goto err_disable;
  5443	
  5444		WARN_ON_ONCE(scx_dsp_ctx);
  5445		scx_dsp_max_batch = ops->dispatch_max_batch ?: SCX_DSP_DFL_MAX_BATCH;
  5446		scx_dsp_ctx = __alloc_percpu(struct_size_t(struct scx_dsp_ctx, buf,
  5447							   scx_dsp_max_batch),
  5448					     __alignof__(struct scx_dsp_ctx));
  5449		if (!scx_dsp_ctx) {
  5450			ret = -ENOMEM;
  5451			goto err_disable;
  5452		}
  5453	
  5454		if (ops->timeout_ms)
  5455			timeout = msecs_to_jiffies(ops->timeout_ms);
  5456		else
  5457			timeout = SCX_WATCHDOG_MAX_TIMEOUT;
  5458	
  5459		WRITE_ONCE(scx_watchdog_timeout, timeout);
  5460		WRITE_ONCE(scx_watchdog_timestamp, jiffies);
  5461		queue_delayed_work(system_unbound_wq, &scx_watchdog_work,
  5462				   scx_watchdog_timeout / 2);
  5463	
  5464		/*
  5465		 * Once __scx_ops_enabled is set, %current can be switched to SCX
  5466		 * anytime. This can lead to stalls as some BPF schedulers (e.g.
  5467		 * userspace scheduling) may not function correctly before all tasks are
  5468		 * switched. Init in bypass mode to guarantee forward progress.
  5469		 */
  5470		scx_ops_bypass(true);
  5471	
  5472		for (i = SCX_OPI_NORMAL_BEGIN; i < SCX_OPI_NORMAL_END; i++)
  5473			if (((void (**)(void))ops)[i])
  5474				static_branch_enable(&scx_has_op[i]);
  5475	
  5476		if (ops->flags & SCX_OPS_ALLOW_QUEUED_WAKEUP)
  5477			static_branch_enable(&scx_ops_allow_queued_wakeup);
  5478		if (ops->flags & SCX_OPS_ENQ_LAST)
  5479			static_branch_enable(&scx_ops_enq_last);
  5480		if (ops->flags & SCX_OPS_ENQ_EXITING)
  5481			static_branch_enable(&scx_ops_enq_exiting);
  5482		if (ops->flags & SCX_OPS_ENQ_MIGRATION_DISABLED)
  5483			static_branch_enable(&scx_ops_enq_migration_disabled);
  5484		if (scx_ops.cpu_acquire || scx_ops.cpu_release)
  5485			static_branch_enable(&scx_ops_cpu_preempt);
  5486	
  5487		scx_idle_enable(ops);
  5488	
  5489		/*
  5490		 * Lock out forks, cgroup on/offlining and moves before opening the
  5491		 * floodgate so that they don't wander into the operations prematurely.
  5492		 */
  5493		percpu_down_write(&scx_fork_rwsem);
  5494	
  5495		WARN_ON_ONCE(scx_ops_init_task_enabled);
  5496		scx_ops_init_task_enabled = true;
  5497	
  5498		/*
  5499		 * Enable ops for every task. Fork is excluded by scx_fork_rwsem
  5500		 * preventing new tasks from being added. No need to exclude tasks
  5501		 * leaving as sched_ext_free() can handle both prepped and enabled
  5502		 * tasks. Prep all tasks first and then enable them with preemption
  5503		 * disabled.
  5504		 *
  5505		 * All cgroups should be initialized before scx_ops_init_task() so that
  5506		 * the BPF scheduler can reliably track each task's cgroup membership
  5507		 * from scx_ops_init_task(). Lock out cgroup on/offlining and task
  5508		 * migrations while tasks are being initialized so that
  5509		 * scx_cgroup_can_attach() never sees uninitialized tasks.
  5510		 */
  5511		scx_cgroup_lock();
  5512		ret = scx_cgroup_init();
  5513		if (ret)
  5514			goto err_disable_unlock_all;
  5515	
  5516		scx_task_iter_start(&sti);
  5517		while ((p = scx_task_iter_next_locked(&sti))) {
  5518			/*
  5519			 * @p may already be dead, have lost all its usages counts and
  5520			 * be waiting for RCU grace period before being freed. @p can't
  5521			 * be initialized for SCX in such cases and should be ignored.
  5522			 */
  5523			if (!tryget_task_struct(p))
  5524				continue;
  5525	
  5526			scx_task_iter_unlock(&sti);
  5527	
  5528			ret = scx_ops_init_task(p, task_group(p), false);
  5529			if (ret) {
  5530				put_task_struct(p);
  5531				scx_task_iter_relock(&sti);
  5532				scx_task_iter_stop(&sti);
  5533				scx_ops_error("ops.init_task() failed (%d) for %s[%d]",
  5534					      ret, p->comm, p->pid);
  5535				goto err_disable_unlock_all;
  5536			}
  5537	
  5538			scx_set_task_state(p, SCX_TASK_READY);
  5539	
  5540			put_task_struct(p);
  5541			scx_task_iter_relock(&sti);
  5542		}
  5543		scx_task_iter_stop(&sti);
  5544		scx_cgroup_unlock();
  5545		percpu_up_write(&scx_fork_rwsem);
  5546	
  5547		/*
  5548		 * All tasks are READY. It's safe to turn on scx_enabled() and switch
  5549		 * all eligible tasks.
  5550		 */
  5551		WRITE_ONCE(scx_switching_all, !(ops->flags & SCX_OPS_SWITCH_PARTIAL));
  5552		static_branch_enable(&__scx_ops_enabled);
  5553	
  5554		/*
  5555		 * We're fully committed and can't fail. The task READY -> ENABLED
  5556		 * transitions here are synchronized against sched_ext_free() through
  5557		 * scx_tasks_lock.
  5558		 */
  5559		percpu_down_write(&scx_fork_rwsem);
  5560		scx_task_iter_start(&sti);
  5561		while ((p = scx_task_iter_next_locked(&sti))) {
  5562			const struct sched_class *old_class = p->sched_class;
  5563			const struct sched_class *new_class =
  5564				__setscheduler_class(p->policy, p->prio);
  5565			struct sched_enq_and_set_ctx ctx;
  5566	
  5567			if (old_class != new_class && p->se.sched_delayed)
  5568				dequeue_task(task_rq(p), p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
  5569	
  5570			sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE, &ctx);
  5571	
  5572			p->scx.slice = SCX_SLICE_DFL;
  5573			p->sched_class = new_class;
  5574			check_class_changing(task_rq(p), p, old_class);
  5575	
  5576			sched_enq_and_set_task(&ctx);
  5577	
  5578			check_class_changed(task_rq(p), p, old_class, p->prio);
  5579		}
  5580		scx_task_iter_stop(&sti);
  5581		percpu_up_write(&scx_fork_rwsem);
  5582	
  5583		scx_ops_bypass(false);
  5584	
  5585		if (!scx_ops_tryset_enable_state(SCX_OPS_ENABLED, SCX_OPS_ENABLING)) {
  5586			WARN_ON_ONCE(atomic_read(&scx_exit_kind) == SCX_EXIT_NONE);
  5587			goto err_disable;
  5588		}
  5589	
  5590		if (!(ops->flags & SCX_OPS_SWITCH_PARTIAL))
  5591			static_branch_enable(&__scx_switched_all);
  5592	
  5593		pr_info("sched_ext: BPF scheduler \"%s\" enabled%s\n",
  5594			scx_ops.name, scx_switched_all() ? "" : " (partial)");
  5595		kobject_uevent(scx_root_kobj, KOBJ_ADD);
  5596		mutex_unlock(&scx_ops_enable_mutex);
  5597	
  5598		atomic_long_inc(&scx_enable_seq);
  5599	
  5600		return 0;
  5601	
  5602	err_del:
  5603		kobject_del(scx_root_kobj);
  5604	err:
  5605		kobject_put(scx_root_kobj);
  5606		scx_root_kobj = NULL;
  5607		if (scx_exit_info) {
  5608			free_exit_info(scx_exit_info);
  5609			scx_exit_info = NULL;
  5610		}
  5611	err_unlock:
  5612		mutex_unlock(&scx_ops_enable_mutex);
  5613		return ret;
  5614	
  5615	err_disable_unlock_all:
  5616		scx_cgroup_unlock();
  5617		percpu_up_write(&scx_fork_rwsem);
  5618		scx_ops_bypass(false);
  5619	err_disable:
  5620		mutex_unlock(&scx_ops_enable_mutex);
  5621		/*
  5622		 * Returning an error code here would not pass all the error information
  5623		 * to userspace. Record errno using scx_ops_error() for cases
  5624		 * scx_ops_error() wasn't already invoked and exit indicating success so
  5625		 * that the error is notified through ops.exit() with all the details.
  5626		 *
  5627		 * Flush scx_ops_disable_work to ensure that error is reported before
  5628		 * init completion.
  5629		 */
  5630		scx_ops_error("scx_ops_enable() failed (%d)", ret);
  5631		kthread_flush_work(&scx_ops_disable_work);
  5632		return 0;
  5633	}
  5634	
  5635	
  5636	/********************************************************************************
  5637	 * bpf_struct_ops plumbing.
  5638	 */
  5639	#include <linux/bpf_verifier.h>
  5640	#include <linux/bpf.h>
  5641	#include <linux/btf.h>
  5642	
  5643	static const struct btf_type *task_struct_type;
  5644	
  5645	static bool bpf_scx_is_valid_access(int off, int size,
  5646					    enum bpf_access_type type,
  5647					    const struct bpf_prog *prog,
  5648					    struct bpf_insn_access_aux *info)
  5649	{
  5650		if (type != BPF_READ)
  5651			return false;
  5652		if (off < 0 || off >= sizeof(__u64) * MAX_BPF_FUNC_ARGS)
  5653			return false;
  5654		if (off % size != 0)
  5655			return false;
  5656	
  5657		return btf_ctx_access(off, size, type, prog, info);
  5658	}
  5659	
  5660	static int bpf_scx_btf_struct_access(struct bpf_verifier_log *log,
  5661					     const struct bpf_reg_state *reg, int off,
  5662					     int size)
  5663	{
  5664		const struct btf_type *t;
  5665	
  5666		t = btf_type_by_id(reg->btf, reg->btf_id);
  5667		if (t == task_struct_type) {
  5668			if (off >= offsetof(struct task_struct, scx.slice) &&
  5669			    off + size <= offsetofend(struct task_struct, scx.slice))
  5670				return SCALAR_VALUE;
  5671			if (off >= offsetof(struct task_struct, scx.dsq_vtime) &&
  5672			    off + size <= offsetofend(struct task_struct, scx.dsq_vtime))
  5673				return SCALAR_VALUE;
  5674			if (off >= offsetof(struct task_struct, scx.disallow) &&
  5675			    off + size <= offsetofend(struct task_struct, scx.disallow))
  5676				return SCALAR_VALUE;
  5677		}
  5678	
  5679		return -EACCES;
  5680	}
  5681	
  5682	static const struct bpf_func_proto *
  5683	bpf_scx_get_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
  5684	{
  5685		switch (func_id) {
  5686		case BPF_FUNC_task_storage_get:
  5687			return &bpf_task_storage_get_proto;
  5688		case BPF_FUNC_task_storage_delete:
  5689			return &bpf_task_storage_delete_proto;
  5690		default:
  5691			return bpf_base_func_proto(func_id, prog);
  5692		}
  5693	}
  5694	
  5695	static const struct bpf_verifier_ops bpf_scx_verifier_ops = {
  5696		.get_func_proto = bpf_scx_get_func_proto,
  5697		.is_valid_access = bpf_scx_is_valid_access,
  5698		.btf_struct_access = bpf_scx_btf_struct_access,
  5699	};
  5700	
  5701	static int bpf_scx_init_member(const struct btf_type *t,
  5702				       const struct btf_member *member,
  5703				       void *kdata, const void *udata)
  5704	{
  5705		const struct sched_ext_ops *uops = udata;
  5706		struct sched_ext_ops *ops = kdata;
  5707		u32 moff = __btf_member_bit_offset(t, member) / 8;
  5708		int ret;
  5709	
  5710		switch (moff) {
  5711		case offsetof(struct sched_ext_ops, dispatch_max_batch):
  5712			if (*(u32 *)(udata + moff) > INT_MAX)
  5713				return -E2BIG;
  5714			ops->dispatch_max_batch = *(u32 *)(udata + moff);
  5715			return 1;
  5716		case offsetof(struct sched_ext_ops, flags):
  5717			if (*(u64 *)(udata + moff) & ~SCX_OPS_ALL_FLAGS)
  5718				return -EINVAL;
  5719			ops->flags = *(u64 *)(udata + moff);
  5720			return 1;
  5721		case offsetof(struct sched_ext_ops, name):
  5722			ret = bpf_obj_name_cpy(ops->name, uops->name,
  5723					       sizeof(ops->name));
  5724			if (ret < 0)
  5725				return ret;
  5726			if (ret == 0)
  5727				return -EINVAL;
  5728			return 1;
  5729		case offsetof(struct sched_ext_ops, timeout_ms):
  5730			if (msecs_to_jiffies(*(u32 *)(udata + moff)) >
  5731			    SCX_WATCHDOG_MAX_TIMEOUT)
  5732				return -E2BIG;
  5733			ops->timeout_ms = *(u32 *)(udata + moff);
  5734			return 1;
  5735		case offsetof(struct sched_ext_ops, exit_dump_len):
  5736			ops->exit_dump_len =
  5737				*(u32 *)(udata + moff) ?: SCX_EXIT_DUMP_DFL_LEN;
  5738			return 1;
  5739		case offsetof(struct sched_ext_ops, hotplug_seq):
  5740			ops->hotplug_seq = *(u64 *)(udata + moff);
  5741			return 1;
  5742		}
  5743	
  5744		return 0;
  5745	}
  5746	
  5747	static int bpf_scx_check_member(const struct btf_type *t,
  5748					const struct btf_member *member,
  5749					const struct bpf_prog *prog)
  5750	{
  5751		u32 moff = __btf_member_bit_offset(t, member) / 8;
  5752	
  5753		switch (moff) {
  5754		case offsetof(struct sched_ext_ops, init_task):
  5755	#ifdef CONFIG_EXT_GROUP_SCHED
  5756		case offsetof(struct sched_ext_ops, cgroup_init):
  5757		case offsetof(struct sched_ext_ops, cgroup_exit):
  5758		case offsetof(struct sched_ext_ops, cgroup_prep_move):
  5759	#endif
  5760		case offsetof(struct sched_ext_ops, cpu_online):
  5761		case offsetof(struct sched_ext_ops, cpu_offline):
  5762		case offsetof(struct sched_ext_ops, init):
  5763		case offsetof(struct sched_ext_ops, exit):
  5764			break;
  5765		default:
  5766			if (prog->sleepable)
  5767				return -EINVAL;
  5768		}
  5769	
  5770		return 0;
  5771	}
  5772	
  5773	static int bpf_scx_reg(void *kdata, struct bpf_link *link)
  5774	{
  5775		return scx_ops_enable(kdata, link);
  5776	}
  5777	
  5778	static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
  5779	{
  5780		scx_ops_disable(SCX_EXIT_UNREG);
  5781		kthread_flush_work(&scx_ops_disable_work);
  5782	}
  5783	
  5784	static int bpf_scx_init(struct btf *btf)
  5785	{
  5786		task_struct_type = btf_type_by_id(btf, btf_tracing_ids[BTF_TRACING_TYPE_TASK]);
  5787	
  5788		return 0;
  5789	}
  5790	
  5791	static int bpf_scx_update(void *kdata, void *old_kdata, struct bpf_link *link)
  5792	{
  5793		/*
  5794		 * sched_ext does not support updating the actively-loaded BPF
  5795		 * scheduler, as registering a BPF scheduler can always fail if the
  5796		 * scheduler returns an error code for e.g. ops.init(), ops.init_task(),
  5797		 * etc. Similarly, we can always race with unregistration happening
  5798		 * elsewhere, such as with sysrq.
  5799		 */
  5800		return -EOPNOTSUPP;
  5801	}
  5802	
  5803	static int bpf_scx_validate(void *kdata)
  5804	{
  5805		return 0;
  5806	}
  5807	
  5808	static s32 sched_ext_ops__select_cpu(struct task_struct *p, s32 prev_cpu, u64 wake_flags) { return -EINVAL; }
  5809	static void sched_ext_ops__enqueue(struct task_struct *p, u64 enq_flags) {}
  5810	static void sched_ext_ops__dequeue(struct task_struct *p, u64 enq_flags) {}
  5811	static void sched_ext_ops__dispatch(s32 prev_cpu, struct task_struct *prev__nullable) {}
  5812	static void sched_ext_ops__tick(struct task_struct *p) {}
  5813	static void sched_ext_ops__runnable(struct task_struct *p, u64 enq_flags) {}
  5814	static void sched_ext_ops__running(struct task_struct *p) {}
  5815	static void sched_ext_ops__stopping(struct task_struct *p, bool runnable) {}
  5816	static void sched_ext_ops__quiescent(struct task_struct *p, u64 deq_flags) {}
  5817	static bool sched_ext_ops__yield(struct task_struct *from, struct task_struct *to__nullable) { return false; }
  5818	static bool sched_ext_ops__core_sched_before(struct task_struct *a, struct task_struct *b) { return false; }
  5819	static void sched_ext_ops__set_weight(struct task_struct *p, u32 weight) {}
  5820	static void sched_ext_ops__set_cpumask(struct task_struct *p, const struct cpumask *mask) {}
  5821	static void sched_ext_ops__update_idle(s32 cpu, bool idle) {}
  5822	static void sched_ext_ops__cpu_acquire(s32 cpu, struct scx_cpu_acquire_args *args) {}
  5823	static void sched_ext_ops__cpu_release(s32 cpu, struct scx_cpu_release_args *args) {}
  5824	static s32 sched_ext_ops__init_task(struct task_struct *p, struct scx_init_task_args *args) { return -EINVAL; }
  5825	static void sched_ext_ops__exit_task(struct task_struct *p, struct scx_exit_task_args *args) {}
  5826	static void sched_ext_ops__enable(struct task_struct *p) {}
  5827	static void sched_ext_ops__disable(struct task_struct *p) {}
  5828	#ifdef CONFIG_EXT_GROUP_SCHED
  5829	static s32 sched_ext_ops__cgroup_init(struct cgroup *cgrp, struct scx_cgroup_init_args *args) { return -EINVAL; }
  5830	static void sched_ext_ops__cgroup_exit(struct cgroup *cgrp) {}
  5831	static s32 sched_ext_ops__cgroup_prep_move(struct task_struct *p, struct cgroup *from, struct cgroup *to) { return -EINVAL; }
  5832	static void sched_ext_ops__cgroup_move(struct task_struct *p, struct cgroup *from, struct cgroup *to) {}
  5833	static void sched_ext_ops__cgroup_cancel_move(struct task_struct *p, struct cgroup *from, struct cgroup *to) {}
  5834	static void sched_ext_ops__cgroup_set_weight(struct cgroup *cgrp, u32 weight) {}
  5835	#endif
  5836	static void sched_ext_ops__cpu_online(s32 cpu) {}
  5837	static void sched_ext_ops__cpu_offline(s32 cpu) {}
  5838	static s32 sched_ext_ops__init(void) { return -EINVAL; }
  5839	static void sched_ext_ops__exit(struct scx_exit_info *info) {}
  5840	static void sched_ext_ops__dump(struct scx_dump_ctx *ctx) {}
  5841	static void sched_ext_ops__dump_cpu(struct scx_dump_ctx *ctx, s32 cpu, bool idle) {}
  5842	static void sched_ext_ops__dump_task(struct scx_dump_ctx *ctx, struct task_struct *p) {}
  5843	
  5844	static struct sched_ext_ops __bpf_ops_sched_ext_ops = {
  5845		.select_cpu		= sched_ext_ops__select_cpu,
  5846		.enqueue		= sched_ext_ops__enqueue,
  5847		.dequeue		= sched_ext_ops__dequeue,
  5848		.dispatch		= sched_ext_ops__dispatch,
  5849		.tick			= sched_ext_ops__tick,
  5850		.runnable		= sched_ext_ops__runnable,
  5851		.running		= sched_ext_ops__running,
  5852		.stopping		= sched_ext_ops__stopping,
  5853		.quiescent		= sched_ext_ops__quiescent,
  5854		.yield			= sched_ext_ops__yield,
  5855		.core_sched_before	= sched_ext_ops__core_sched_before,
  5856		.set_weight		= sched_ext_ops__set_weight,
  5857		.set_cpumask		= sched_ext_ops__set_cpumask,
  5858		.update_idle		= sched_ext_ops__update_idle,
  5859		.cpu_acquire		= sched_ext_ops__cpu_acquire,
  5860		.cpu_release		= sched_ext_ops__cpu_release,
  5861		.init_task		= sched_ext_ops__init_task,
  5862		.exit_task		= sched_ext_ops__exit_task,
  5863		.enable			= sched_ext_ops__enable,
  5864		.disable		= sched_ext_ops__disable,
  5865	#ifdef CONFIG_EXT_GROUP_SCHED
  5866		.cgroup_init		= sched_ext_ops__cgroup_init,
  5867		.cgroup_exit		= sched_ext_ops__cgroup_exit,
  5868		.cgroup_prep_move	= sched_ext_ops__cgroup_prep_move,
  5869		.cgroup_move		= sched_ext_ops__cgroup_move,
  5870		.cgroup_cancel_move	= sched_ext_ops__cgroup_cancel_move,
  5871		.cgroup_set_weight	= sched_ext_ops__cgroup_set_weight,
  5872	#endif
  5873		.cpu_online		= sched_ext_ops__cpu_online,
  5874		.cpu_offline		= sched_ext_ops__cpu_offline,
  5875		.init			= sched_ext_ops__init,
  5876		.exit			= sched_ext_ops__exit,
  5877		.dump			= sched_ext_ops__dump,
  5878		.dump_cpu		= sched_ext_ops__dump_cpu,
  5879		.dump_task		= sched_ext_ops__dump_task,
  5880	};
  5881	
  5882	static struct bpf_struct_ops bpf_sched_ext_ops = {
  5883		.verifier_ops = &bpf_scx_verifier_ops,
  5884		.reg = bpf_scx_reg,
  5885		.unreg = bpf_scx_unreg,
  5886		.check_member = bpf_scx_check_member,
  5887		.init_member = bpf_scx_init_member,
  5888		.init = bpf_scx_init,
  5889		.update = bpf_scx_update,
  5890		.validate = bpf_scx_validate,
  5891		.name = "sched_ext_ops",
  5892		.owner = THIS_MODULE,
  5893		.cfi_stubs = &__bpf_ops_sched_ext_ops
  5894	};
  5895	
  5896	
  5897	/********************************************************************************
  5898	 * System integration and init.
  5899	 */
  5900	
  5901	static void sysrq_handle_sched_ext_reset(u8 key)
  5902	{
  5903		if (scx_ops_helper)
  5904			scx_ops_disable(SCX_EXIT_SYSRQ);
  5905		else
  5906			pr_info("sched_ext: BPF scheduler not yet used\n");
  5907	}
  5908	
  5909	static const struct sysrq_key_op sysrq_sched_ext_reset_op = {
  5910		.handler	= sysrq_handle_sched_ext_reset,
  5911		.help_msg	= "reset-sched-ext(S)",
  5912		.action_msg	= "Disable sched_ext and revert all tasks to CFS",
  5913		.enable_mask	= SYSRQ_ENABLE_RTNICE,
  5914	};
  5915	
  5916	static void sysrq_handle_sched_ext_dump(u8 key)
  5917	{
  5918		struct scx_exit_info ei = { .kind = SCX_EXIT_NONE, .reason = "SysRq-D" };
  5919	
  5920		if (scx_enabled())
  5921			scx_dump_state(&ei, 0);
  5922	}
  5923	
  5924	static const struct sysrq_key_op sysrq_sched_ext_dump_op = {
  5925		.handler	= sysrq_handle_sched_ext_dump,
  5926		.help_msg	= "dump-sched-ext(D)",
  5927		.action_msg	= "Trigger sched_ext debug dump",
  5928		.enable_mask	= SYSRQ_ENABLE_RTNICE,
  5929	};
  5930	
  5931	static bool can_skip_idle_kick(struct rq *rq)
  5932	{
  5933		lockdep_assert_rq_held(rq);
  5934	
  5935		/*
  5936		 * We can skip idle kicking if @rq is going to go through at least one
  5937		 * full SCX scheduling cycle before going idle. Just checking whether
  5938		 * curr is not idle is insufficient because we could be racing
  5939		 * balance_one() trying to pull the next task from a remote rq, which
  5940		 * may fail, and @rq may become idle afterwards.
  5941		 *
  5942		 * The race window is small and we don't and can't guarantee that @rq is
  5943		 * only kicked while idle anyway. Skip only when sure.
  5944		 */
  5945		return !is_idle_task(rq->curr) && !(rq->scx.flags & SCX_RQ_IN_BALANCE);
  5946	}
  5947	
  5948	static bool kick_one_cpu(s32 cpu, struct rq *this_rq, unsigned long *pseqs)
  5949	{
  5950		struct rq *rq = cpu_rq(cpu);
  5951		struct scx_rq *this_scx = &this_rq->scx;
  5952		bool should_wait = false;
  5953		unsigned long flags;
  5954	
  5955		raw_spin_rq_lock_irqsave(rq, flags);
  5956	
  5957		/*
  5958		 * During CPU hotplug, a CPU may depend on kicking itself to make
  5959		 * forward progress. Allow kicking self regardless of online state.
  5960		 */
  5961		if (cpu_online(cpu) || cpu == cpu_of(this_rq)) {
  5962			if (cpumask_test_cpu(cpu, this_scx->cpus_to_preempt)) {
  5963				if (rq->curr->sched_class == &ext_sched_class)
  5964					rq->curr->scx.slice = 0;
  5965				cpumask_clear_cpu(cpu, this_scx->cpus_to_preempt);
  5966			}
  5967	
  5968			if (cpumask_test_cpu(cpu, this_scx->cpus_to_wait)) {
  5969				pseqs[cpu] = rq->scx.pnt_seq;
  5970				should_wait = true;
  5971			}
  5972	
  5973			resched_curr(rq);
  5974		} else {
  5975			cpumask_clear_cpu(cpu, this_scx->cpus_to_preempt);
  5976			cpumask_clear_cpu(cpu, this_scx->cpus_to_wait);
  5977		}
  5978	
  5979		raw_spin_rq_unlock_irqrestore(rq, flags);
  5980	
  5981		return should_wait;
  5982	}
  5983	
  5984	static void kick_one_cpu_if_idle(s32 cpu, struct rq *this_rq)
  5985	{
  5986		struct rq *rq = cpu_rq(cpu);
  5987		unsigned long flags;
  5988	
  5989		raw_spin_rq_lock_irqsave(rq, flags);
  5990	
  5991		if (!can_skip_idle_kick(rq) &&
  5992		    (cpu_online(cpu) || cpu == cpu_of(this_rq)))
  5993			resched_curr(rq);
  5994	
  5995		raw_spin_rq_unlock_irqrestore(rq, flags);
  5996	}
  5997	
  5998	static void kick_cpus_irq_workfn(struct irq_work *irq_work)
  5999	{
  6000		struct rq *this_rq = this_rq();
  6001		struct scx_rq *this_scx = &this_rq->scx;
  6002		unsigned long *pseqs = this_cpu_ptr(scx_kick_cpus_pnt_seqs);
  6003		bool should_wait = false;
  6004		s32 cpu;
  6005	
  6006		for_each_cpu(cpu, this_scx->cpus_to_kick) {
  6007			should_wait |= kick_one_cpu(cpu, this_rq, pseqs);
  6008			cpumask_clear_cpu(cpu, this_scx->cpus_to_kick);
  6009			cpumask_clear_cpu(cpu, this_scx->cpus_to_kick_if_idle);
  6010		}
  6011	
  6012		for_each_cpu(cpu, this_scx->cpus_to_kick_if_idle) {
  6013			kick_one_cpu_if_idle(cpu, this_rq);
  6014			cpumask_clear_cpu(cpu, this_scx->cpus_to_kick_if_idle);
  6015		}
  6016	
  6017		if (!should_wait)
  6018			return;
  6019	
  6020		for_each_cpu(cpu, this_scx->cpus_to_wait) {
  6021			unsigned long *wait_pnt_seq = &cpu_rq(cpu)->scx.pnt_seq;
  6022	
  6023			if (cpu != cpu_of(this_rq)) {
  6024				/*
  6025				 * Pairs with smp_store_release() issued by this CPU in
  6026				 * switch_class() on the resched path.
  6027				 *
  6028				 * We busy-wait here to guarantee that no other task can
  6029				 * be scheduled on our core before the target CPU has
  6030				 * entered the resched path.
  6031				 */
  6032				while (smp_load_acquire(wait_pnt_seq) == pseqs[cpu])
  6033					cpu_relax();
  6034			}
  6035	
  6036			cpumask_clear_cpu(cpu, this_scx->cpus_to_wait);
  6037		}
  6038	}
  6039	
  6040	/**
  6041	 * print_scx_info - print out sched_ext scheduler state
  6042	 * @log_lvl: the log level to use when printing
  6043	 * @p: target task
  6044	 *
  6045	 * If a sched_ext scheduler is enabled, print the name and state of the
  6046	 * scheduler. If @p is on sched_ext, print further information about the task.
  6047	 *
  6048	 * This function can be safely called on any task as long as the task_struct
  6049	 * itself is accessible. While safe, this function isn't synchronized and may
  6050	 * print out mixups or garbages of limited length.
  6051	 */
  6052	void print_scx_info(const char *log_lvl, struct task_struct *p)
  6053	{
  6054		enum scx_ops_enable_state state = scx_ops_enable_state();
  6055		const char *all = READ_ONCE(scx_switching_all) ? "+all" : "";
  6056		char runnable_at_buf[22] = "?";
  6057		struct sched_class *class;
  6058		unsigned long runnable_at;
  6059	
  6060		if (state == SCX_OPS_DISABLED)
  6061			return;
  6062	
  6063		/*
  6064		 * Carefully check if the task was running on sched_ext, and then
  6065		 * carefully copy the time it's been runnable, and its state.
  6066		 */
  6067		if (copy_from_kernel_nofault(&class, &p->sched_class, sizeof(class)) ||
  6068		    class != &ext_sched_class) {
  6069			printk("%sSched_ext: %s (%s%s)", log_lvl, scx_ops.name,
  6070			       scx_ops_enable_state_str[state], all);
  6071			return;
  6072		}
  6073	
  6074		if (!copy_from_kernel_nofault(&runnable_at, &p->scx.runnable_at,
  6075					      sizeof(runnable_at)))
  6076			scnprintf(runnable_at_buf, sizeof(runnable_at_buf), "%+ldms",
  6077				  jiffies_delta_msecs(runnable_at, jiffies));
  6078	
  6079		/* print everything onto one line to conserve console space */
  6080		printk("%sSched_ext: %s (%s%s), task: runnable_at=%s",
  6081		       log_lvl, scx_ops.name, scx_ops_enable_state_str[state], all,
  6082		       runnable_at_buf);
  6083	}
  6084	
  6085	static int scx_pm_handler(struct notifier_block *nb, unsigned long event, void *ptr)
  6086	{
  6087		/*
  6088		 * SCX schedulers often have userspace components which are sometimes
  6089		 * involved in critial scheduling paths. PM operations involve freezing
  6090		 * userspace which can lead to scheduling misbehaviors including stalls.
  6091		 * Let's bypass while PM operations are in progress.
  6092		 */
  6093		switch (event) {
  6094		case PM_HIBERNATION_PREPARE:
  6095		case PM_SUSPEND_PREPARE:
  6096		case PM_RESTORE_PREPARE:
  6097			scx_ops_bypass(true);
  6098			break;
  6099		case PM_POST_HIBERNATION:
  6100		case PM_POST_SUSPEND:
  6101		case PM_POST_RESTORE:
  6102			scx_ops_bypass(false);
  6103			break;
  6104		}
  6105	
  6106		return NOTIFY_OK;
  6107	}
  6108	
  6109	static struct notifier_block scx_pm_notifier = {
  6110		.notifier_call = scx_pm_handler,
  6111	};
  6112	
  6113	void __init init_sched_ext_class(void)
  6114	{
  6115		s32 cpu, v;
  6116	
  6117		/*
  6118		 * The following is to prevent the compiler from optimizing out the enum
  6119		 * definitions so that BPF scheduler implementations can use them
  6120		 * through the generated vmlinux.h.
  6121		 */
  6122		WRITE_ONCE(v, SCX_ENQ_WAKEUP | SCX_DEQ_SLEEP | SCX_KICK_PREEMPT |
  6123			   SCX_TG_ONLINE);
  6124	
  6125		BUG_ON(rhashtable_init(&dsq_hash, &dsq_hash_params));
  6126		scx_idle_init_masks();
  6127	
  6128		scx_kick_cpus_pnt_seqs =
  6129			__alloc_percpu(sizeof(scx_kick_cpus_pnt_seqs[0]) * nr_cpu_ids,
  6130				       __alignof__(scx_kick_cpus_pnt_seqs[0]));
  6131		BUG_ON(!scx_kick_cpus_pnt_seqs);
  6132	
  6133		for_each_possible_cpu(cpu) {
  6134			struct rq *rq = cpu_rq(cpu);
  6135			int  n = cpu_to_node(cpu);
  6136	
  6137			init_dsq(&rq->scx.local_dsq, SCX_DSQ_LOCAL);
  6138			INIT_LIST_HEAD(&rq->scx.runnable_list);
  6139			INIT_LIST_HEAD(&rq->scx.ddsp_deferred_locals);
  6140	
  6141			BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_kick, GFP_KERNEL, n));
  6142			BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_kick_if_idle, GFP_KERNEL, n));
  6143			BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_preempt, GFP_KERNEL, n));
  6144			BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_wait, GFP_KERNEL, n));
  6145			init_irq_work(&rq->scx.deferred_irq_work, deferred_irq_workfn);
  6146			init_irq_work(&rq->scx.kick_cpus_irq_work, kick_cpus_irq_workfn);
  6147	
  6148			if (cpu_online(cpu))
  6149				cpu_rq(cpu)->scx.flags |= SCX_RQ_ONLINE;
  6150		}
  6151	
  6152		register_sysrq_key('S', &sysrq_sched_ext_reset_op);
  6153		register_sysrq_key('D', &sysrq_sched_ext_dump_op);
  6154		INIT_DELAYED_WORK(&scx_watchdog_work, scx_watchdog_workfn);
  6155	}
  6156	
  6157	
  6158	/********************************************************************************
  6159	 * Helpers that can be called from the BPF scheduler.
  6160	 */
  6161	static bool scx_dsq_insert_preamble(struct task_struct *p, u64 enq_flags)
  6162	{
  6163		if (!scx_kf_allowed(SCX_KF_ENQUEUE | SCX_KF_DISPATCH))
  6164			return false;
  6165	
  6166		lockdep_assert_irqs_disabled();
  6167	
  6168		if (unlikely(!p)) {
  6169			scx_ops_error("called with NULL task");
  6170			return false;
  6171		}
  6172	
  6173		if (unlikely(enq_flags & __SCX_ENQ_INTERNAL_MASK)) {
  6174			scx_ops_error("invalid enq_flags 0x%llx", enq_flags);
  6175			return false;
  6176		}
  6177	
  6178		return true;
  6179	}
  6180	
  6181	static void scx_dsq_insert_commit(struct task_struct *p, u64 dsq_id,
  6182					  u64 enq_flags)
  6183	{
  6184		struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
  6185		struct task_struct *ddsp_task;
  6186	
  6187		ddsp_task = __this_cpu_read(direct_dispatch_task);
  6188		if (ddsp_task) {
  6189			mark_direct_dispatch(ddsp_task, p, dsq_id, enq_flags);
  6190			return;
  6191		}
  6192	
  6193		if (unlikely(dspc->cursor >= scx_dsp_max_batch)) {
  6194			scx_ops_error("dispatch buffer overflow");
  6195			return;
  6196		}
  6197	
  6198		dspc->buf[dspc->cursor++] = (struct scx_dsp_buf_ent){
  6199			.task = p,
  6200			.qseq = atomic_long_read(&p->scx.ops_state) & SCX_OPSS_QSEQ_MASK,
  6201			.dsq_id = dsq_id,
  6202			.enq_flags = enq_flags,
  6203		};
  6204	}
  6205	
  6206	__bpf_kfunc_start_defs();
  6207	
  6208	/**
  6209	 * scx_bpf_dsq_insert - Insert a task into the FIFO queue of a DSQ
  6210	 * @p: task_struct to insert
  6211	 * @dsq_id: DSQ to insert into
  6212	 * @slice: duration @p can run for in nsecs, 0 to keep the current value
  6213	 * @enq_flags: SCX_ENQ_*
  6214	 *
  6215	 * Insert @p into the FIFO queue of the DSQ identified by @dsq_id. It is safe to
  6216	 * call this function spuriously. Can be called from ops.enqueue(),
  6217	 * ops.select_cpu(), and ops.dispatch().
  6218	 *
  6219	 * When called from ops.select_cpu() or ops.enqueue(), it's for direct dispatch
  6220	 * and @p must match the task being enqueued.
  6221	 *
  6222	 * When called from ops.select_cpu(), @enq_flags and @dsp_id are stored, and @p
  6223	 * will be directly inserted into the corresponding dispatch queue after
  6224	 * ops.select_cpu() returns. If @p is inserted into SCX_DSQ_LOCAL, it will be
  6225	 * inserted into the local DSQ of the CPU returned by ops.select_cpu().
  6226	 * @enq_flags are OR'd with the enqueue flags on the enqueue path before the
  6227	 * task is inserted.
  6228	 *
  6229	 * When called from ops.dispatch(), there are no restrictions on @p or @dsq_id
  6230	 * and this function can be called upto ops.dispatch_max_batch times to insert
  6231	 * multiple tasks. scx_bpf_dispatch_nr_slots() returns the number of the
  6232	 * remaining slots. scx_bpf_consume() flushes the batch and resets the counter.
  6233	 *
  6234	 * This function doesn't have any locking restrictions and may be called under
  6235	 * BPF locks (in the future when BPF introduces more flexible locking).
  6236	 *
  6237	 * @p is allowed to run for @slice. The scheduling path is triggered on slice
  6238	 * exhaustion. If zero, the current residual slice is maintained. If
  6239	 * %SCX_SLICE_INF, @p never expires and the BPF scheduler must kick the CPU with
  6240	 * scx_bpf_kick_cpu() to trigger scheduling.
  6241	 */
  6242	__bpf_kfunc void scx_bpf_dsq_insert(struct task_struct *p, u64 dsq_id, u64 slice,
  6243					    u64 enq_flags)
  6244	{
  6245		if (!scx_dsq_insert_preamble(p, enq_flags))
  6246			return;
  6247	
  6248		if (slice)
  6249			p->scx.slice = slice;
  6250		else
  6251			p->scx.slice = p->scx.slice ?: 1;
  6252	
  6253		scx_dsq_insert_commit(p, dsq_id, enq_flags);
  6254	}
  6255	
  6256	/* for backward compatibility, will be removed in v6.15 */
  6257	__bpf_kfunc void scx_bpf_dispatch(struct task_struct *p, u64 dsq_id, u64 slice,
  6258					  u64 enq_flags)
  6259	{
  6260		printk_deferred_once(KERN_WARNING "sched_ext: scx_bpf_dispatch() renamed to scx_bpf_dsq_insert()");
  6261		scx_bpf_dsq_insert(p, dsq_id, slice, enq_flags);
  6262	}
  6263	
  6264	/**
  6265	 * scx_bpf_dsq_insert_vtime - Insert a task into the vtime priority queue of a DSQ
  6266	 * @p: task_struct to insert
  6267	 * @dsq_id: DSQ to insert into
  6268	 * @slice: duration @p can run for in nsecs, 0 to keep the current value
  6269	 * @vtime: @p's ordering inside the vtime-sorted queue of the target DSQ
  6270	 * @enq_flags: SCX_ENQ_*
  6271	 *
  6272	 * Insert @p into the vtime priority queue of the DSQ identified by @dsq_id.
  6273	 * Tasks queued into the priority queue are ordered by @vtime. All other aspects
  6274	 * are identical to scx_bpf_dsq_insert().
  6275	 *
  6276	 * @vtime ordering is according to time_before64() which considers wrapping. A
  6277	 * numerically larger vtime may indicate an earlier position in the ordering and
  6278	 * vice-versa.
  6279	 *
  6280	 * A DSQ can only be used as a FIFO or priority queue at any given time and this
  6281	 * function must not be called on a DSQ which already has one or more FIFO tasks
  6282	 * queued and vice-versa. Also, the built-in DSQs (SCX_DSQ_LOCAL and
  6283	 * SCX_DSQ_GLOBAL) cannot be used as priority queues.
  6284	 */
  6285	__bpf_kfunc void scx_bpf_dsq_insert_vtime(struct task_struct *p, u64 dsq_id,
  6286						  u64 slice, u64 vtime, u64 enq_flags)
  6287	{
  6288		if (!scx_dsq_insert_preamble(p, enq_flags))
  6289			return;
  6290	
  6291		if (slice)
  6292			p->scx.slice = slice;
  6293		else
  6294			p->scx.slice = p->scx.slice ?: 1;
  6295	
  6296		p->scx.dsq_vtime = vtime;
  6297	
  6298		scx_dsq_insert_commit(p, dsq_id, enq_flags | SCX_ENQ_DSQ_PRIQ);
  6299	}
  6300	
  6301	/* for backward compatibility, will be removed in v6.15 */
  6302	__bpf_kfunc void scx_bpf_dispatch_vtime(struct task_struct *p, u64 dsq_id,
  6303						u64 slice, u64 vtime, u64 enq_flags)
  6304	{
  6305		printk_deferred_once(KERN_WARNING "sched_ext: scx_bpf_dispatch_vtime() renamed to scx_bpf_dsq_insert_vtime()");
  6306		scx_bpf_dsq_insert_vtime(p, dsq_id, slice, vtime, enq_flags);
  6307	}
  6308	
  6309	__bpf_kfunc_end_defs();
  6310	
  6311	BTF_KFUNCS_START(scx_kfunc_ids_enqueue_dispatch)
  6312	BTF_ID_FLAGS(func, scx_bpf_dsq_insert, KF_RCU)
  6313	BTF_ID_FLAGS(func, scx_bpf_dsq_insert_vtime, KF_RCU)
  6314	BTF_ID_FLAGS(func, scx_bpf_dispatch, KF_RCU)
  6315	BTF_ID_FLAGS(func, scx_bpf_dispatch_vtime, KF_RCU)
  6316	BTF_KFUNCS_END(scx_kfunc_ids_enqueue_dispatch)
  6317	
  6318	static const struct btf_kfunc_id_set scx_kfunc_set_enqueue_dispatch = {
  6319		.owner			= THIS_MODULE,
  6320		.set			= &scx_kfunc_ids_enqueue_dispatch,
  6321	};
  6322	
  6323	static bool scx_dsq_move(struct bpf_iter_scx_dsq_kern *kit,
  6324				 struct task_struct *p, u64 dsq_id, u64 enq_flags)
  6325	{
  6326		struct scx_dispatch_q *src_dsq = kit->dsq, *dst_dsq;
  6327		struct rq *this_rq, *src_rq, *locked_rq;
  6328		bool dispatched = false;
  6329		bool in_balance;
  6330		unsigned long flags;
  6331	
  6332		if (!scx_kf_allowed_if_unlocked() && !scx_kf_allowed(SCX_KF_DISPATCH))
  6333			return false;
  6334	
  6335		/*
  6336		 * Can be called from either ops.dispatch() locking this_rq() or any
  6337		 * context where no rq lock is held. If latter, lock @p's task_rq which
  6338		 * we'll likely need anyway.
  6339		 */
  6340		src_rq = task_rq(p);
  6341	
  6342		local_irq_save(flags);
  6343		this_rq = this_rq();
  6344		in_balance = this_rq->scx.flags & SCX_RQ_IN_BALANCE;
  6345	
  6346		if (in_balance) {
  6347			if (this_rq != src_rq) {
  6348				raw_spin_rq_unlock(this_rq);
  6349				raw_spin_rq_lock(src_rq);
  6350			}
  6351		} else {
  6352			raw_spin_rq_lock(src_rq);
  6353		}
  6354	
  6355		/*
  6356		 * If the BPF scheduler keeps calling this function repeatedly, it can
  6357		 * cause similar live-lock conditions as consume_dispatch_q(). Insert a
  6358		 * breather if necessary.
  6359		 */
  6360		scx_ops_breather(src_rq);
  6361	
  6362		locked_rq = src_rq;
  6363		raw_spin_lock(&src_dsq->lock);
  6364	
  6365		/*
  6366		 * Did someone else get to it? @p could have already left $src_dsq, got
  6367		 * re-enqueud, or be in the process of being consumed by someone else.
  6368		 */
  6369		if (unlikely(p->scx.dsq != src_dsq ||
  6370			     u32_before(kit->cursor.priv, p->scx.dsq_seq) ||
  6371			     p->scx.holding_cpu >= 0) ||
  6372		    WARN_ON_ONCE(src_rq != task_rq(p))) {
  6373			raw_spin_unlock(&src_dsq->lock);
  6374			goto out;
  6375		}
  6376	
  6377		/* @p is still on $src_dsq and stable, determine the destination */
  6378		dst_dsq = find_dsq_for_dispatch(this_rq, dsq_id, p);
  6379	
  6380		/*
  6381		 * Apply vtime and slice updates before moving so that the new time is
  6382		 * visible before inserting into $dst_dsq. @p is still on $src_dsq but
  6383		 * this is safe as we're locking it.
  6384		 */
  6385		if (kit->cursor.flags & __SCX_DSQ_ITER_HAS_VTIME)
  6386			p->scx.dsq_vtime = kit->vtime;
  6387		if (kit->cursor.flags & __SCX_DSQ_ITER_HAS_SLICE)
  6388			p->scx.slice = kit->slice;
  6389	
  6390		/* execute move */
  6391		locked_rq = move_task_between_dsqs(p, enq_flags, src_dsq, dst_dsq);
  6392		dispatched = true;
  6393	out:
  6394		if (in_balance) {
  6395			if (this_rq != locked_rq) {
  6396				raw_spin_rq_unlock(locked_rq);
  6397				raw_spin_rq_lock(this_rq);
  6398			}
  6399		} else {
  6400			raw_spin_rq_unlock_irqrestore(locked_rq, flags);
  6401		}
  6402	
  6403		kit->cursor.flags &= ~(__SCX_DSQ_ITER_HAS_SLICE |
  6404				       __SCX_DSQ_ITER_HAS_VTIME);
  6405		return dispatched;
  6406	}
  6407	
  6408	__bpf_kfunc_start_defs();
  6409	
  6410	/**
  6411	 * scx_bpf_dispatch_nr_slots - Return the number of remaining dispatch slots
  6412	 *
  6413	 * Can only be called from ops.dispatch().
  6414	 */
  6415	__bpf_kfunc u32 scx_bpf_dispatch_nr_slots(void)
  6416	{
  6417		if (!scx_kf_allowed(SCX_KF_DISPATCH))
  6418			return 0;
  6419	
  6420		return scx_dsp_max_batch - __this_cpu_read(scx_dsp_ctx->cursor);
  6421	}
  6422	
  6423	/**
  6424	 * scx_bpf_dispatch_cancel - Cancel the latest dispatch
  6425	 *
  6426	 * Cancel the latest dispatch. Can be called multiple times to cancel further
  6427	 * dispatches. Can only be called from ops.dispatch().
  6428	 */
  6429	__bpf_kfunc void scx_bpf_dispatch_cancel(void)
  6430	{
  6431		struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
  6432	
  6433		if (!scx_kf_allowed(SCX_KF_DISPATCH))
  6434			return;
  6435	
  6436		if (dspc->cursor > 0)
  6437			dspc->cursor--;
  6438		else
  6439			scx_ops_error("dispatch buffer underflow");
  6440	}
  6441	
  6442	/**
  6443	 * scx_bpf_dsq_move_to_local - move a task from a DSQ to the current CPU's local DSQ
  6444	 * @dsq_id: DSQ to move task from
  6445	 *
  6446	 * Move a task from the non-local DSQ identified by @dsq_id to the current CPU's
  6447	 * local DSQ for execution. Can only be called from ops.dispatch().
  6448	 *
  6449	 * This function flushes the in-flight dispatches from scx_bpf_dsq_insert()
  6450	 * before trying to move from the specified DSQ. It may also grab rq locks and
  6451	 * thus can't be called under any BPF locks.
  6452	 *
  6453	 * Returns %true if a task has been moved, %false if there isn't any task to
  6454	 * move.
  6455	 */
  6456	__bpf_kfunc bool scx_bpf_dsq_move_to_local(u64 dsq_id)
  6457	{
  6458		struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
  6459		struct scx_dispatch_q *dsq;
  6460	
  6461		if (!scx_kf_allowed(SCX_KF_DISPATCH))
  6462			return false;
  6463	
  6464		flush_dispatch_buf(dspc->rq);
  6465	
  6466		dsq = find_user_dsq(dsq_id);
  6467		if (unlikely(!dsq)) {
  6468			scx_ops_error("invalid DSQ ID 0x%016llx", dsq_id);
  6469			return false;
  6470		}
  6471	
  6472		if (consume_dispatch_q(dspc->rq, dsq)) {
  6473			/*
  6474			 * A successfully consumed task can be dequeued before it starts
  6475			 * running while the CPU is trying to migrate other dispatched
  6476			 * tasks. Bump nr_tasks to tell balance_scx() to retry on empty
  6477			 * local DSQ.
  6478			 */
  6479			dspc->nr_tasks++;
  6480			return true;
  6481		} else {
  6482			return false;
  6483		}
  6484	}
  6485	
  6486	/* for backward compatibility, will be removed in v6.15 */
  6487	__bpf_kfunc bool scx_bpf_consume(u64 dsq_id)
  6488	{
  6489		printk_deferred_once(KERN_WARNING "sched_ext: scx_bpf_consume() renamed to scx_bpf_dsq_move_to_local()");
  6490		return scx_bpf_dsq_move_to_local(dsq_id);
  6491	}
  6492	
  6493	/**
  6494	 * scx_bpf_dsq_move_set_slice - Override slice when moving between DSQs
  6495	 * @it__iter: DSQ iterator in progress
  6496	 * @slice: duration the moved task can run for in nsecs
  6497	 *
  6498	 * Override the slice of the next task that will be moved from @it__iter using
  6499	 * scx_bpf_dsq_move[_vtime](). If this function is not called, the previous
  6500	 * slice duration is kept.
  6501	 */
  6502	__bpf_kfunc void scx_bpf_dsq_move_set_slice(struct bpf_iter_scx_dsq *it__iter,
  6503						    u64 slice)
  6504	{
  6505		struct bpf_iter_scx_dsq_kern *kit = (void *)it__iter;
  6506	
  6507		kit->slice = slice;
  6508		kit->cursor.flags |= __SCX_DSQ_ITER_HAS_SLICE;
  6509	}
  6510	
  6511	/* for backward compatibility, will be removed in v6.15 */
  6512	__bpf_kfunc void scx_bpf_dispatch_from_dsq_set_slice(
  6513				struct bpf_iter_scx_dsq *it__iter, u64 slice)
  6514	{
  6515		printk_deferred_once(KERN_WARNING "sched_ext: scx_bpf_dispatch_from_dsq_set_slice() renamed to scx_bpf_dsq_move_set_slice()");
  6516		scx_bpf_dsq_move_set_slice(it__iter, slice);
  6517	}
  6518	
  6519	/**
  6520	 * scx_bpf_dsq_move_set_vtime - Override vtime when moving between DSQs
  6521	 * @it__iter: DSQ iterator in progress
  6522	 * @vtime: task's ordering inside the vtime-sorted queue of the target DSQ
  6523	 *
  6524	 * Override the vtime of the next task that will be moved from @it__iter using
  6525	 * scx_bpf_dsq_move_vtime(). If this function is not called, the previous slice
  6526	 * vtime is kept. If scx_bpf_dsq_move() is used to dispatch the next task, the
  6527	 * override is ignored and cleared.
  6528	 */
  6529	__bpf_kfunc void scx_bpf_dsq_move_set_vtime(struct bpf_iter_scx_dsq *it__iter,
  6530						    u64 vtime)
  6531	{
  6532		struct bpf_iter_scx_dsq_kern *kit = (void *)it__iter;
  6533	
  6534		kit->vtime = vtime;
  6535		kit->cursor.flags |= __SCX_DSQ_ITER_HAS_VTIME;
  6536	}
  6537	
  6538	/* for backward compatibility, will be removed in v6.15 */
  6539	__bpf_kfunc void scx_bpf_dispatch_from_dsq_set_vtime(
  6540				struct bpf_iter_scx_dsq *it__iter, u64 vtime)
  6541	{
  6542		printk_deferred_once(KERN_WARNING "sched_ext: scx_bpf_dispatch_from_dsq_set_vtime() renamed to scx_bpf_dsq_move_set_vtime()");
  6543		scx_bpf_dsq_move_set_vtime(it__iter, vtime);
  6544	}
  6545	
  6546	/**
  6547	 * scx_bpf_dsq_move - Move a task from DSQ iteration to a DSQ
  6548	 * @it__iter: DSQ iterator in progress
  6549	 * @p: task to transfer
  6550	 * @dsq_id: DSQ to move @p to
  6551	 * @enq_flags: SCX_ENQ_*
  6552	 *
  6553	 * Transfer @p which is on the DSQ currently iterated by @it__iter to the DSQ
  6554	 * specified by @dsq_id. All DSQs - local DSQs, global DSQ and user DSQs - can
  6555	 * be the destination.
  6556	 *
  6557	 * For the transfer to be successful, @p must still be on the DSQ and have been
  6558	 * queued before the DSQ iteration started. This function doesn't care whether
  6559	 * @p was obtained from the DSQ iteration. @p just has to be on the DSQ and have
  6560	 * been queued before the iteration started.
  6561	 *
  6562	 * @p's slice is kept by default. Use scx_bpf_dsq_move_set_slice() to update.
  6563	 *
  6564	 * Can be called from ops.dispatch() or any BPF context which doesn't hold a rq
  6565	 * lock (e.g. BPF timers or SYSCALL programs).
  6566	 *
  6567	 * Returns %true if @p has been consumed, %false if @p had already been consumed
  6568	 * or dequeued.
  6569	 */
  6570	__bpf_kfunc bool scx_bpf_dsq_move(struct bpf_iter_scx_dsq *it__iter,
  6571					  struct task_struct *p, u64 dsq_id,
  6572					  u64 enq_flags)
  6573	{
  6574		return scx_dsq_move((struct bpf_iter_scx_dsq_kern *)it__iter,
  6575				    p, dsq_id, enq_flags);
  6576	}
  6577	
  6578	/* for backward compatibility, will be removed in v6.15 */
  6579	__bpf_kfunc bool scx_bpf_dispatch_from_dsq(struct bpf_iter_scx_dsq *it__iter,
  6580						   struct task_struct *p, u64 dsq_id,
  6581						   u64 enq_flags)
  6582	{
  6583		printk_deferred_once(KERN_WARNING "sched_ext: scx_bpf_dispatch_from_dsq() renamed to scx_bpf_dsq_move()");
  6584		return scx_bpf_dsq_move(it__iter, p, dsq_id, enq_flags);
  6585	}
  6586	
  6587	/**
  6588	 * scx_bpf_dsq_move_vtime - Move a task from DSQ iteration to a PRIQ DSQ
  6589	 * @it__iter: DSQ iterator in progress
  6590	 * @p: task to transfer
  6591	 * @dsq_id: DSQ to move @p to
  6592	 * @enq_flags: SCX_ENQ_*
  6593	 *
  6594	 * Transfer @p which is on the DSQ currently iterated by @it__iter to the
  6595	 * priority queue of the DSQ specified by @dsq_id. The destination must be a
  6596	 * user DSQ as only user DSQs support priority queue.
  6597	 *
  6598	 * @p's slice and vtime are kept by default. Use scx_bpf_dsq_move_set_slice()
  6599	 * and scx_bpf_dsq_move_set_vtime() to update.
  6600	 *
  6601	 * All other aspects are identical to scx_bpf_dsq_move(). See
  6602	 * scx_bpf_dsq_insert_vtime() for more information on @vtime.
  6603	 */
  6604	__bpf_kfunc bool scx_bpf_dsq_move_vtime(struct bpf_iter_scx_dsq *it__iter,
  6605						struct task_struct *p, u64 dsq_id,
  6606						u64 enq_flags)
  6607	{
  6608		return scx_dsq_move((struct bpf_iter_scx_dsq_kern *)it__iter,
  6609				    p, dsq_id, enq_flags | SCX_ENQ_DSQ_PRIQ);
  6610	}
  6611	
  6612	/* for backward compatibility, will be removed in v6.15 */
  6613	__bpf_kfunc bool scx_bpf_dispatch_vtime_from_dsq(struct bpf_iter_scx_dsq *it__iter,
  6614							 struct task_struct *p, u64 dsq_id,
  6615							 u64 enq_flags)
  6616	{
  6617		printk_deferred_once(KERN_WARNING "sched_ext: scx_bpf_dispatch_from_dsq_vtime() renamed to scx_bpf_dsq_move_vtime()");
  6618		return scx_bpf_dsq_move_vtime(it__iter, p, dsq_id, enq_flags);
  6619	}
  6620	
  6621	__bpf_kfunc_end_defs();
  6622	
  6623	BTF_KFUNCS_START(scx_kfunc_ids_dispatch)
  6624	BTF_ID_FLAGS(func, scx_bpf_dispatch_nr_slots)
  6625	BTF_ID_FLAGS(func, scx_bpf_dispatch_cancel)
  6626	BTF_ID_FLAGS(func, scx_bpf_dsq_move_to_local)
  6627	BTF_ID_FLAGS(func, scx_bpf_consume)
  6628	BTF_ID_FLAGS(func, scx_bpf_dsq_move_set_slice)
  6629	BTF_ID_FLAGS(func, scx_bpf_dsq_move_set_vtime)
  6630	BTF_ID_FLAGS(func, scx_bpf_dsq_move, KF_RCU)
  6631	BTF_ID_FLAGS(func, scx_bpf_dsq_move_vtime, KF_RCU)
  6632	BTF_ID_FLAGS(func, scx_bpf_dispatch_from_dsq_set_slice)
  6633	BTF_ID_FLAGS(func, scx_bpf_dispatch_from_dsq_set_vtime)
  6634	BTF_ID_FLAGS(func, scx_bpf_dispatch_from_dsq, KF_RCU)
  6635	BTF_ID_FLAGS(func, scx_bpf_dispatch_vtime_from_dsq, KF_RCU)
  6636	BTF_KFUNCS_END(scx_kfunc_ids_dispatch)
  6637	
  6638	static const struct btf_kfunc_id_set scx_kfunc_set_dispatch = {
  6639		.owner			= THIS_MODULE,
  6640		.set			= &scx_kfunc_ids_dispatch,
  6641	};
  6642	
  6643	__bpf_kfunc_start_defs();
  6644	
  6645	/**
  6646	 * scx_bpf_reenqueue_local - Re-enqueue tasks on a local DSQ
  6647	 *
  6648	 * Iterate over all of the tasks currently enqueued on the local DSQ of the
  6649	 * caller's CPU, and re-enqueue them in the BPF scheduler. Returns the number of
  6650	 * processed tasks. Can only be called from ops.cpu_release().
  6651	 */
  6652	__bpf_kfunc u32 scx_bpf_reenqueue_local(void)
  6653	{
  6654		LIST_HEAD(tasks);
  6655		u32 nr_enqueued = 0;
  6656		struct rq *rq;
  6657		struct task_struct *p, *n;
  6658	
  6659		if (!scx_kf_allowed(SCX_KF_CPU_RELEASE))
  6660			return 0;
  6661	
  6662		rq = cpu_rq(smp_processor_id());
  6663		lockdep_assert_rq_held(rq);
  6664	
  6665		/*
  6666		 * The BPF scheduler may choose to dispatch tasks back to
  6667		 * @rq->scx.local_dsq. Move all candidate tasks off to a private list
  6668		 * first to avoid processing the same tasks repeatedly.
  6669		 */
  6670		list_for_each_entry_safe(p, n, &rq->scx.local_dsq.list,
  6671					 scx.dsq_list.node) {
  6672			/*
  6673			 * If @p is being migrated, @p's current CPU may not agree with
  6674			 * its allowed CPUs and the migration_cpu_stop is about to
  6675			 * deactivate and re-activate @p anyway. Skip re-enqueueing.
  6676			 *
  6677			 * While racing sched property changes may also dequeue and
  6678			 * re-enqueue a migrating task while its current CPU and allowed
  6679			 * CPUs disagree, they use %ENQUEUE_RESTORE which is bypassed to
  6680			 * the current local DSQ for running tasks and thus are not
  6681			 * visible to the BPF scheduler.
  6682			 */
  6683			if (p->migration_pending)
  6684				continue;
  6685	
  6686			dispatch_dequeue(rq, p);
  6687			list_add_tail(&p->scx.dsq_list.node, &tasks);
  6688		}
  6689	
  6690		list_for_each_entry_safe(p, n, &tasks, scx.dsq_list.node) {
  6691			list_del_init(&p->scx.dsq_list.node);
  6692			do_enqueue_task(rq, p, SCX_ENQ_REENQ, -1);
  6693			nr_enqueued++;
  6694		}
  6695	
  6696		return nr_enqueued;
  6697	}
  6698	
  6699	__bpf_kfunc_end_defs();
  6700	
  6701	BTF_KFUNCS_START(scx_kfunc_ids_cpu_release)
  6702	BTF_ID_FLAGS(func, scx_bpf_reenqueue_local)
  6703	BTF_KFUNCS_END(scx_kfunc_ids_cpu_release)
  6704	
  6705	static const struct btf_kfunc_id_set scx_kfunc_set_cpu_release = {
  6706		.owner			= THIS_MODULE,
  6707		.set			= &scx_kfunc_ids_cpu_release,
  6708	};
  6709	
  6710	__bpf_kfunc_start_defs();
  6711	
  6712	/**
  6713	 * scx_bpf_create_dsq - Create a custom DSQ
  6714	 * @dsq_id: DSQ to create
  6715	 * @node: NUMA node to allocate from
  6716	 *
  6717	 * Create a custom DSQ identified by @dsq_id. Can be called from any sleepable
  6718	 * scx callback, and any BPF_PROG_TYPE_SYSCALL prog.
  6719	 */
  6720	__bpf_kfunc s32 scx_bpf_create_dsq(u64 dsq_id, s32 node)
  6721	{
  6722		if (unlikely(node >= (int)nr_node_ids ||
  6723			     (node < 0 && node != NUMA_NO_NODE)))
  6724			return -EINVAL;
  6725		return PTR_ERR_OR_ZERO(create_dsq(dsq_id, node));
  6726	}
  6727	
  6728	__bpf_kfunc_end_defs();
  6729	
  6730	BTF_KFUNCS_START(scx_kfunc_ids_unlocked)
  6731	BTF_ID_FLAGS(func, scx_bpf_create_dsq, KF_SLEEPABLE)
  6732	BTF_ID_FLAGS(func, scx_bpf_dsq_move_set_slice)
  6733	BTF_ID_FLAGS(func, scx_bpf_dsq_move_set_vtime)
  6734	BTF_ID_FLAGS(func, scx_bpf_dsq_move, KF_RCU)
  6735	BTF_ID_FLAGS(func, scx_bpf_dsq_move_vtime, KF_RCU)
  6736	BTF_ID_FLAGS(func, scx_bpf_dispatch_from_dsq_set_slice)
  6737	BTF_ID_FLAGS(func, scx_bpf_dispatch_from_dsq_set_vtime)
  6738	BTF_ID_FLAGS(func, scx_bpf_dispatch_from_dsq, KF_RCU)
  6739	BTF_ID_FLAGS(func, scx_bpf_dispatch_vtime_from_dsq, KF_RCU)
  6740	BTF_KFUNCS_END(scx_kfunc_ids_unlocked)
  6741	
  6742	static const struct btf_kfunc_id_set scx_kfunc_set_unlocked = {
  6743		.owner			= THIS_MODULE,
  6744		.set			= &scx_kfunc_ids_unlocked,
  6745	};
  6746	
  6747	__bpf_kfunc_start_defs();
  6748	
  6749	/**
  6750	 * scx_bpf_kick_cpu - Trigger reschedule on a CPU
  6751	 * @cpu: cpu to kick
  6752	 * @flags: %SCX_KICK_* flags
  6753	 *
  6754	 * Kick @cpu into rescheduling. This can be used to wake up an idle CPU or
  6755	 * trigger rescheduling on a busy CPU. This can be called from any online
  6756	 * scx_ops operation and the actual kicking is performed asynchronously through
  6757	 * an irq work.
  6758	 */
  6759	__bpf_kfunc void scx_bpf_kick_cpu(s32 cpu, u64 flags)
  6760	{
  6761		struct rq *this_rq;
  6762		unsigned long irq_flags;
  6763	
  6764		if (!ops_cpu_valid(cpu, NULL))
  6765			return;
  6766	
  6767		local_irq_save(irq_flags);
  6768	
  6769		this_rq = this_rq();
  6770	
  6771		/*
  6772		 * While bypassing for PM ops, IRQ handling may not be online which can
  6773		 * lead to irq_work_queue() malfunction such as infinite busy wait for
  6774		 * IRQ status update. Suppress kicking.
  6775		 */
  6776		if (scx_rq_bypassing(this_rq))
  6777			goto out;
  6778	
  6779		/*
  6780		 * Actual kicking is bounced to kick_cpus_irq_workfn() to avoid nesting
  6781		 * rq locks. We can probably be smarter and avoid bouncing if called
  6782		 * from ops which don't hold a rq lock.
  6783		 */
  6784		if (flags & SCX_KICK_IDLE) {
  6785			struct rq *target_rq = cpu_rq(cpu);
  6786	
  6787			if (unlikely(flags & (SCX_KICK_PREEMPT | SCX_KICK_WAIT)))
  6788				scx_ops_error("PREEMPT/WAIT cannot be used with SCX_KICK_IDLE");
  6789	
  6790			if (raw_spin_rq_trylock(target_rq)) {
  6791				if (can_skip_idle_kick(target_rq)) {
  6792					raw_spin_rq_unlock(target_rq);
  6793					goto out;
  6794				}
  6795				raw_spin_rq_unlock(target_rq);
  6796			}
  6797			cpumask_set_cpu(cpu, this_rq->scx.cpus_to_kick_if_idle);
  6798		} else {
  6799			cpumask_set_cpu(cpu, this_rq->scx.cpus_to_kick);
  6800	
  6801			if (flags & SCX_KICK_PREEMPT)
  6802				cpumask_set_cpu(cpu, this_rq->scx.cpus_to_preempt);
  6803			if (flags & SCX_KICK_WAIT)
  6804				cpumask_set_cpu(cpu, this_rq->scx.cpus_to_wait);
  6805		}
  6806	
  6807		irq_work_queue(&this_rq->scx.kick_cpus_irq_work);
  6808	out:
  6809		local_irq_restore(irq_flags);
  6810	}
  6811	
  6812	/**
  6813	 * scx_bpf_dsq_nr_queued - Return the number of queued tasks
  6814	 * @dsq_id: id of the DSQ
  6815	 *
  6816	 * Return the number of tasks in the DSQ matching @dsq_id. If not found,
  6817	 * -%ENOENT is returned.
  6818	 */
  6819	__bpf_kfunc s32 scx_bpf_dsq_nr_queued(u64 dsq_id)
  6820	{
  6821		struct scx_dispatch_q *dsq;
  6822		s32 ret;
  6823	
  6824		preempt_disable();
  6825	
  6826		if (dsq_id == SCX_DSQ_LOCAL) {
  6827			ret = READ_ONCE(this_rq()->scx.local_dsq.nr);
  6828			goto out;
  6829		} else if ((dsq_id & SCX_DSQ_LOCAL_ON) == SCX_DSQ_LOCAL_ON) {
  6830			s32 cpu = dsq_id & SCX_DSQ_LOCAL_CPU_MASK;
  6831	
  6832			if (ops_cpu_valid(cpu, NULL)) {
  6833				ret = READ_ONCE(cpu_rq(cpu)->scx.local_dsq.nr);
  6834				goto out;
  6835			}
  6836		} else {
  6837			dsq = find_user_dsq(dsq_id);
  6838			if (dsq) {
  6839				ret = READ_ONCE(dsq->nr);
  6840				goto out;
  6841			}
  6842		}
  6843		ret = -ENOENT;
  6844	out:
  6845		preempt_enable();
  6846		return ret;
  6847	}
  6848	
  6849	/**
  6850	 * scx_bpf_destroy_dsq - Destroy a custom DSQ
  6851	 * @dsq_id: DSQ to destroy
  6852	 *
  6853	 * Destroy the custom DSQ identified by @dsq_id. Only DSQs created with
  6854	 * scx_bpf_create_dsq() can be destroyed. The caller must ensure that the DSQ is
  6855	 * empty and no further tasks are dispatched to it. Ignored if called on a DSQ
  6856	 * which doesn't exist. Can be called from any online scx_ops operations.
  6857	 */
  6858	__bpf_kfunc void scx_bpf_destroy_dsq(u64 dsq_id)
  6859	{
  6860		destroy_dsq(dsq_id);
  6861	}
  6862	
  6863	/**
  6864	 * bpf_iter_scx_dsq_new - Create a DSQ iterator
  6865	 * @it: iterator to initialize
  6866	 * @dsq_id: DSQ to iterate
  6867	 * @flags: %SCX_DSQ_ITER_*
  6868	 *
  6869	 * Initialize BPF iterator @it which can be used with bpf_for_each() to walk
  6870	 * tasks in the DSQ specified by @dsq_id. Iteration using @it only includes
  6871	 * tasks which are already queued when this function is invoked.
  6872	 */
  6873	__bpf_kfunc int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id,
  6874					     u64 flags)
  6875	{
  6876		struct bpf_iter_scx_dsq_kern *kit = (void *)it;
  6877	
  6878		BUILD_BUG_ON(sizeof(struct bpf_iter_scx_dsq_kern) >
  6879			     sizeof(struct bpf_iter_scx_dsq));
  6880		BUILD_BUG_ON(__alignof__(struct bpf_iter_scx_dsq_kern) !=
  6881			     __alignof__(struct bpf_iter_scx_dsq));
  6882	
  6883		if (flags & ~__SCX_DSQ_ITER_USER_FLAGS)
  6884			return -EINVAL;
  6885	
  6886		kit->dsq = find_user_dsq(dsq_id);
  6887		if (!kit->dsq)
  6888			return -ENOENT;
  6889	
  6890		INIT_LIST_HEAD(&kit->cursor.node);
  6891		kit->cursor.flags = SCX_DSQ_LNODE_ITER_CURSOR | flags;
  6892		kit->cursor.priv = READ_ONCE(kit->dsq->seq);
  6893	
  6894		return 0;
  6895	}
  6896	
  6897	/**
  6898	 * bpf_iter_scx_dsq_next - Progress a DSQ iterator
  6899	 * @it: iterator to progress
  6900	 *
  6901	 * Return the next task. See bpf_iter_scx_dsq_new().
  6902	 */
  6903	__bpf_kfunc struct task_struct *bpf_iter_scx_dsq_next(struct bpf_iter_scx_dsq *it)
  6904	{
  6905		struct bpf_iter_scx_dsq_kern *kit = (void *)it;
  6906		bool rev = kit->cursor.flags & SCX_DSQ_ITER_REV;
  6907		struct task_struct *p;
  6908		unsigned long flags;
  6909	
  6910		if (!kit->dsq)
  6911			return NULL;
  6912	
  6913		raw_spin_lock_irqsave(&kit->dsq->lock, flags);
  6914	
  6915		if (list_empty(&kit->cursor.node))
  6916			p = NULL;
  6917		else
  6918			p = container_of(&kit->cursor, struct task_struct, scx.dsq_list);
  6919	
  6920		/*
  6921		 * Only tasks which were queued before the iteration started are
  6922		 * visible. This bounds BPF iterations and guarantees that vtime never
  6923		 * jumps in the other direction while iterating.
  6924		 */
  6925		do {
  6926			p = nldsq_next_task(kit->dsq, p, rev);
  6927		} while (p && unlikely(u32_before(kit->cursor.priv, p->scx.dsq_seq)));
  6928	
  6929		if (p) {
  6930			if (rev)
  6931				list_move_tail(&kit->cursor.node, &p->scx.dsq_list.node);
  6932			else
  6933				list_move(&kit->cursor.node, &p->scx.dsq_list.node);
  6934		} else {
  6935			list_del_init(&kit->cursor.node);
  6936		}
  6937	
  6938		raw_spin_unlock_irqrestore(&kit->dsq->lock, flags);
  6939	
  6940		return p;
  6941	}
  6942	
  6943	/**
  6944	 * bpf_iter_scx_dsq_destroy - Destroy a DSQ iterator
  6945	 * @it: iterator to destroy
  6946	 *
  6947	 * Undo scx_iter_scx_dsq_new().
  6948	 */
  6949	__bpf_kfunc void bpf_iter_scx_dsq_destroy(struct bpf_iter_scx_dsq *it)
  6950	{
  6951		struct bpf_iter_scx_dsq_kern *kit = (void *)it;
  6952	
  6953		if (!kit->dsq)
  6954			return;
  6955	
  6956		if (!list_empty(&kit->cursor.node)) {
  6957			unsigned long flags;
  6958	
  6959			raw_spin_lock_irqsave(&kit->dsq->lock, flags);
  6960			list_del_init(&kit->cursor.node);
  6961			raw_spin_unlock_irqrestore(&kit->dsq->lock, flags);
  6962		}
  6963		kit->dsq = NULL;
  6964	}
  6965	
  6966	__bpf_kfunc_end_defs();
  6967	
  6968	static s32 __bstr_format(u64 *data_buf, char *line_buf, size_t line_size,
  6969				 char *fmt, unsigned long long *data, u32 data__sz)
  6970	{
  6971		struct bpf_bprintf_data bprintf_data = { .get_bin_args = true };
  6972		s32 ret;
  6973	
  6974		if (data__sz % 8 || data__sz > MAX_BPRINTF_VARARGS * 8 ||
  6975		    (data__sz && !data)) {
  6976			scx_ops_error("invalid data=%p and data__sz=%u",
  6977				      (void *)data, data__sz);
  6978			return -EINVAL;
  6979		}
  6980	
  6981		ret = copy_from_kernel_nofault(data_buf, data, data__sz);
  6982		if (ret < 0) {
  6983			scx_ops_error("failed to read data fields (%d)", ret);
  6984			return ret;
  6985		}
  6986	
  6987		ret = bpf_bprintf_prepare(fmt, UINT_MAX, data_buf, data__sz / 8,
  6988					  &bprintf_data);
  6989		if (ret < 0) {
  6990			scx_ops_error("format preparation failed (%d)", ret);
  6991			return ret;
  6992		}
  6993	
  6994		ret = bstr_printf(line_buf, line_size, fmt,
  6995				  bprintf_data.bin_args);
  6996		bpf_bprintf_cleanup(&bprintf_data);
  6997		if (ret < 0) {
  6998			scx_ops_error("(\"%s\", %p, %u) failed to format",
  6999				      fmt, data, data__sz);
  7000			return ret;
  7001		}
  7002	
  7003		return ret;
  7004	}
  7005	
  7006	static s32 bstr_format(struct scx_bstr_buf *buf,
  7007			       char *fmt, unsigned long long *data, u32 data__sz)
  7008	{
  7009		return __bstr_format(buf->data, buf->line, sizeof(buf->line),
  7010				     fmt, data, data__sz);
  7011	}
  7012	
  7013	__bpf_kfunc_start_defs();
  7014	
  7015	/**
  7016	 * scx_bpf_exit_bstr - Gracefully exit the BPF scheduler.
  7017	 * @exit_code: Exit value to pass to user space via struct scx_exit_info.
  7018	 * @fmt: error message format string
  7019	 * @data: format string parameters packaged using ___bpf_fill() macro
  7020	 * @data__sz: @data len, must end in '__sz' for the verifier
  7021	 *
  7022	 * Indicate that the BPF scheduler wants to exit gracefully, and initiate ops
  7023	 * disabling.
  7024	 */
  7025	__bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt,
  7026					   unsigned long long *data, u32 data__sz)
  7027	{
  7028		unsigned long flags;
  7029	
  7030		raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
  7031		if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
  7032			scx_ops_exit_kind(SCX_EXIT_UNREG_BPF, exit_code, "%s",
  7033					  scx_exit_bstr_buf.line);
  7034		raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
  7035	}
  7036	
  7037	/**
  7038	 * scx_bpf_error_bstr - Indicate fatal error
  7039	 * @fmt: error message format string
  7040	 * @data: format string parameters packaged using ___bpf_fill() macro
  7041	 * @data__sz: @data len, must end in '__sz' for the verifier
  7042	 *
  7043	 * Indicate that the BPF scheduler encountered a fatal error and initiate ops
  7044	 * disabling.
  7045	 */
  7046	__bpf_kfunc void scx_bpf_error_bstr(char *fmt, unsigned long long *data,
  7047					    u32 data__sz)
  7048	{
  7049		unsigned long flags;
  7050	
  7051		raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
  7052		if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
  7053			scx_ops_exit_kind(SCX_EXIT_ERROR_BPF, 0, "%s",
  7054					  scx_exit_bstr_buf.line);
  7055		raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
  7056	}
  7057	
  7058	/**
  7059	 * scx_bpf_dump_bstr - Generate extra debug dump specific to the BPF scheduler
  7060	 * @fmt: format string
  7061	 * @data: format string parameters packaged using ___bpf_fill() macro
  7062	 * @data__sz: @data len, must end in '__sz' for the verifier
  7063	 *
  7064	 * To be called through scx_bpf_dump() helper from ops.dump(), dump_cpu() and
  7065	 * dump_task() to generate extra debug dump specific to the BPF scheduler.
  7066	 *
  7067	 * The extra dump may be multiple lines. A single line may be split over
  7068	 * multiple calls. The last line is automatically terminated.
  7069	 */
  7070	__bpf_kfunc void scx_bpf_dump_bstr(char *fmt, unsigned long long *data,
  7071					   u32 data__sz)
  7072	{
  7073		struct scx_dump_data *dd = &scx_dump_data;
  7074		struct scx_bstr_buf *buf = &dd->buf;
  7075		s32 ret;
  7076	
  7077		if (raw_smp_processor_id() != dd->cpu) {
  7078			scx_ops_error("scx_bpf_dump() must only be called from ops.dump() and friends");
  7079			return;
  7080		}
  7081	
  7082		/* append the formatted string to the line buf */
  7083		ret = __bstr_format(buf->data, buf->line + dd->cursor,
  7084				    sizeof(buf->line) - dd->cursor, fmt, data, data__sz);
  7085		if (ret < 0) {
  7086			dump_line(dd->s, "%s[!] (\"%s\", %p, %u) failed to format (%d)",
  7087				  dd->prefix, fmt, data, data__sz, ret);
  7088			return;
  7089		}
  7090	
  7091		dd->cursor += ret;
  7092		dd->cursor = min_t(s32, dd->cursor, sizeof(buf->line));
  7093	
  7094		if (!dd->cursor)
  7095			return;
  7096	
  7097		/*
  7098		 * If the line buf overflowed or ends in a newline, flush it into the
  7099		 * dump. This is to allow the caller to generate a single line over
  7100		 * multiple calls. As ops_dump_flush() can also handle multiple lines in
  7101		 * the line buf, the only case which can lead to an unexpected
  7102		 * truncation is when the caller keeps generating newlines in the middle
  7103		 * instead of the end consecutively. Don't do that.
  7104		 */
  7105		if (dd->cursor >= sizeof(buf->line) || buf->line[dd->cursor - 1] == '\n')
  7106			ops_dump_flush();
  7107	}
  7108	
  7109	/**
  7110	 * scx_bpf_cpuperf_cap - Query the maximum relative capacity of a CPU
  7111	 * @cpu: CPU of interest
  7112	 *
  7113	 * Return the maximum relative capacity of @cpu in relation to the most
  7114	 * performant CPU in the system. The return value is in the range [1,
  7115	 * %SCX_CPUPERF_ONE]. See scx_bpf_cpuperf_cur().
  7116	 */
  7117	__bpf_kfunc u32 scx_bpf_cpuperf_cap(s32 cpu)
  7118	{
  7119		if (ops_cpu_valid(cpu, NULL))
  7120			return arch_scale_cpu_capacity(cpu);
  7121		else
  7122			return SCX_CPUPERF_ONE;
  7123	}
  7124	
  7125	/**
  7126	 * scx_bpf_cpuperf_cur - Query the current relative performance of a CPU
  7127	 * @cpu: CPU of interest
  7128	 *
  7129	 * Return the current relative performance of @cpu in relation to its maximum.
  7130	 * The return value is in the range [1, %SCX_CPUPERF_ONE].
  7131	 *
  7132	 * The current performance level of a CPU in relation to the maximum performance
  7133	 * available in the system can be calculated as follows:
  7134	 *
  7135	 *   scx_bpf_cpuperf_cap() * scx_bpf_cpuperf_cur() / %SCX_CPUPERF_ONE
  7136	 *
  7137	 * The result is in the range [1, %SCX_CPUPERF_ONE].
  7138	 */
  7139	__bpf_kfunc u32 scx_bpf_cpuperf_cur(s32 cpu)
  7140	{
  7141		if (ops_cpu_valid(cpu, NULL))
  7142			return arch_scale_freq_capacity(cpu);
  7143		else
  7144			return SCX_CPUPERF_ONE;
  7145	}
  7146	
  7147	/**
  7148	 * scx_bpf_cpuperf_set - Set the relative performance target of a CPU
  7149	 * @cpu: CPU of interest
  7150	 * @perf: target performance level [0, %SCX_CPUPERF_ONE]
  7151	 *
  7152	 * Set the target performance level of @cpu to @perf. @perf is in linear
  7153	 * relative scale between 0 and %SCX_CPUPERF_ONE. This determines how the
  7154	 * schedutil cpufreq governor chooses the target frequency.
  7155	 *
  7156	 * The actual performance level chosen, CPU grouping, and the overhead and
  7157	 * latency of the operations are dependent on the hardware and cpufreq driver in
  7158	 * use. Consult hardware and cpufreq documentation for more information. The
  7159	 * current performance level can be monitored using scx_bpf_cpuperf_cur().
  7160	 */
  7161	__bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
  7162	{
  7163		if (unlikely(perf > SCX_CPUPERF_ONE)) {
  7164			scx_ops_error("Invalid cpuperf target %u for CPU %d", perf, cpu);
  7165			return;
  7166		}
  7167	
  7168		if (ops_cpu_valid(cpu, NULL)) {
  7169			struct rq *rq = cpu_rq(cpu);
  7170	
  7171			rq->scx.cpuperf_target = perf;
  7172	
  7173			rcu_read_lock_sched_notrace();
  7174			cpufreq_update_util(cpu_rq(cpu), 0);
  7175			rcu_read_unlock_sched_notrace();
  7176		}
  7177	}
  7178	
  7179	/**
  7180	 * scx_bpf_nr_cpu_ids - Return the number of possible CPU IDs
  7181	 *
  7182	 * All valid CPU IDs in the system are smaller than the returned value.
  7183	 */
  7184	__bpf_kfunc u32 scx_bpf_nr_cpu_ids(void)
  7185	{
  7186		return nr_cpu_ids;
  7187	}
  7188	
  7189	/**
  7190	 * scx_bpf_get_possible_cpumask - Get a referenced kptr to cpu_possible_mask
  7191	 */
  7192	__bpf_kfunc const struct cpumask *scx_bpf_get_possible_cpumask(void)
  7193	{
  7194		return cpu_possible_mask;
  7195	}
  7196	
  7197	/**
  7198	 * scx_bpf_get_online_cpumask - Get a referenced kptr to cpu_online_mask
  7199	 */
  7200	__bpf_kfunc const struct cpumask *scx_bpf_get_online_cpumask(void)
  7201	{
  7202		return cpu_online_mask;
  7203	}
  7204	
  7205	/**
  7206	 * scx_bpf_put_cpumask - Release a possible/online cpumask
  7207	 * @cpumask: cpumask to release
  7208	 */
  7209	__bpf_kfunc void scx_bpf_put_cpumask(const struct cpumask *cpumask)
  7210	{
  7211		/*
  7212		 * Empty function body because we aren't actually acquiring or releasing
  7213		 * a reference to a global cpumask, which is read-only in the caller and
  7214		 * is never released. The acquire / release semantics here are just used
  7215		 * to make the cpumask is a trusted pointer in the caller.
  7216		 */
  7217	}
  7218	
  7219	/**
  7220	 * scx_bpf_task_running - Is task currently running?
  7221	 * @p: task of interest
  7222	 */
  7223	__bpf_kfunc bool scx_bpf_task_running(const struct task_struct *p)
  7224	{
  7225		return task_rq(p)->curr == p;
  7226	}
  7227	
  7228	/**
  7229	 * scx_bpf_task_cpu - CPU a task is currently associated with
  7230	 * @p: task of interest
  7231	 */
  7232	__bpf_kfunc s32 scx_bpf_task_cpu(const struct task_struct *p)
  7233	{
  7234		return task_cpu(p);
  7235	}
  7236	
  7237	/**
  7238	 * scx_bpf_cpu_rq - Fetch the rq of a CPU
  7239	 * @cpu: CPU of the rq
  7240	 */
  7241	__bpf_kfunc struct rq *scx_bpf_cpu_rq(s32 cpu)
  7242	{
  7243		if (!ops_cpu_valid(cpu, NULL))
  7244			return NULL;
  7245	
  7246		return cpu_rq(cpu);
  7247	}
  7248	
  7249	/**
  7250	 * scx_bpf_task_cgroup - Return the sched cgroup of a task
  7251	 * @p: task of interest
  7252	 *
  7253	 * @p->sched_task_group->css.cgroup represents the cgroup @p is associated with
  7254	 * from the scheduler's POV. SCX operations should use this function to
  7255	 * determine @p's current cgroup as, unlike following @p->cgroups,
  7256	 * @p->sched_task_group is protected by @p's rq lock and thus atomic w.r.t. all
  7257	 * rq-locked operations. Can be called on the parameter tasks of rq-locked
  7258	 * operations. The restriction guarantees that @p's rq is locked by the caller.
  7259	 */
  7260	#ifdef CONFIG_CGROUP_SCHED
  7261	__bpf_kfunc struct cgroup *scx_bpf_task_cgroup(struct task_struct *p)
  7262	{
  7263		struct task_group *tg = p->sched_task_group;
  7264		struct cgroup *cgrp = &cgrp_dfl_root.cgrp;
  7265	
  7266		if (!scx_kf_allowed_on_arg_tasks(__SCX_KF_RQ_LOCKED, p))
  7267			goto out;
  7268	
  7269		cgrp = tg_cgrp(tg);
  7270	
  7271	out:
  7272		cgroup_get(cgrp);
  7273		return cgrp;
  7274	}
  7275	#endif
  7276	
  7277	/**
  7278	 * scx_bpf_now - Returns a high-performance monotonically non-decreasing
  7279	 * clock for the current CPU. The clock returned is in nanoseconds.
  7280	 *
  7281	 * It provides the following properties:
  7282	 *
  7283	 * 1) High performance: Many BPF schedulers call bpf_ktime_get_ns() frequently
  7284	 *  to account for execution time and track tasks' runtime properties.
  7285	 *  Unfortunately, in some hardware platforms, bpf_ktime_get_ns() -- which
  7286	 *  eventually reads a hardware timestamp counter -- is neither performant nor
  7287	 *  scalable. scx_bpf_now() aims to provide a high-performance clock by
  7288	 *  using the rq clock in the scheduler core whenever possible.
  7289	 *
  7290	 * 2) High enough resolution for the BPF scheduler use cases: In most BPF
  7291	 *  scheduler use cases, the required clock resolution is lower than the most
  7292	 *  accurate hardware clock (e.g., rdtsc in x86). scx_bpf_now() basically
  7293	 *  uses the rq clock in the scheduler core whenever it is valid. It considers
  7294	 *  that the rq clock is valid from the time the rq clock is updated
  7295	 *  (update_rq_clock) until the rq is unlocked (rq_unpin_lock).
  7296	 *
  7297	 * 3) Monotonically non-decreasing clock for the same CPU: scx_bpf_now()
  7298	 *  guarantees the clock never goes backward when comparing them in the same
  7299	 *  CPU. On the other hand, when comparing clocks in different CPUs, there
  7300	 *  is no such guarantee -- the clock can go backward. It provides a
  7301	 *  monotonically *non-decreasing* clock so that it would provide the same
  7302	 *  clock values in two different scx_bpf_now() calls in the same CPU
  7303	 *  during the same period of when the rq clock is valid.
  7304	 */
  7305	__bpf_kfunc u64 scx_bpf_now(void)
  7306	{
  7307		struct rq *rq;
  7308		u64 clock;
  7309	
  7310		preempt_disable();
  7311	
  7312		rq = this_rq();
  7313		if (smp_load_acquire(&rq->scx.flags) & SCX_RQ_CLK_VALID) {
  7314			/*
  7315			 * If the rq clock is valid, use the cached rq clock.
  7316			 *
  7317			 * Note that scx_bpf_now() is re-entrant between a process
  7318			 * context and an interrupt context (e.g., timer interrupt).
  7319			 * However, we don't need to consider the race between them
  7320			 * because such race is not observable from a caller.
  7321			 */
  7322			clock = READ_ONCE(rq->scx.clock);
  7323		} else {
  7324			/*
  7325			 * Otherwise, return a fresh rq clock.
  7326			 *
  7327			 * The rq clock is updated outside of the rq lock.
  7328			 * In this case, keep the updated rq clock invalid so the next
  7329			 * kfunc call outside the rq lock gets a fresh rq clock.
  7330			 */
  7331			clock = sched_clock_cpu(cpu_of(rq));
  7332		}
  7333	
  7334		preempt_enable();
  7335	
  7336		return clock;
  7337	}
  7338	
  7339	/*
  7340	 * scx_bpf_events - Get a system-wide event counter to
  7341	 * @events: output buffer from a BPF program
  7342	 * @events__sz: @events len, must end in '__sz'' for the verifier
  7343	 */
  7344	__bpf_kfunc void scx_bpf_events(struct scx_event_stats *events,
  7345					size_t events__sz)
  7346	{
  7347		struct scx_event_stats e_sys, *e_cpu;
  7348		int cpu;
  7349	
  7350		/* Aggregate per-CPU event counters into the system-wide counters. */
  7351		memset(&e_sys, 0, sizeof(e_sys));
  7352		for_each_possible_cpu(cpu) {
  7353			e_cpu = per_cpu_ptr(&event_stats_cpu, cpu);
  7354			scx_agg_event(&e_sys, e_cpu, SCX_EV_SELECT_CPU_FALLBACK);
  7355			scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
  7356			scx_agg_event(&e_sys, e_cpu, SCX_EV_DISPATCH_KEEP_LAST);
  7357			scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_EXITING);
  7358			scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SKIP_MIGRATION_DISABLED);
  7359			scx_agg_event(&e_sys, e_cpu, SCX_EV_ENQ_SLICE_DFL);
  7360			scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DURATION);
  7361			scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_DISPATCH);
  7362			scx_agg_event(&e_sys, e_cpu, SCX_EV_BYPASS_ACTIVATE);
  7363		}
  7364	
  7365		/*
  7366		 * We cannot entirely trust a BPF-provided size since a BPF program
  7367		 * might be compiled against a different vmlinux.h, of which
  7368		 * scx_event_stats would be larger (a newer vmlinux.h) or smaller
  7369		 * (an older vmlinux.h). Hence, we use the smaller size to avoid
  7370		 * memory corruption.
  7371		 */
  7372		events__sz = min(events__sz, sizeof(*events));
  7373		memcpy(events, &e_sys, events__sz);
  7374	}
  7375	
  7376	__bpf_kfunc_end_defs();
  7377	
  7378	BTF_KFUNCS_START(scx_kfunc_ids_any)
  7379	BTF_ID_FLAGS(func, scx_bpf_kick_cpu)
  7380	BTF_ID_FLAGS(func, scx_bpf_dsq_nr_queued)
  7381	BTF_ID_FLAGS(func, scx_bpf_destroy_dsq)
  7382	BTF_ID_FLAGS(func, bpf_iter_scx_dsq_new, KF_ITER_NEW | KF_RCU_PROTECTED)
  7383	BTF_ID_FLAGS(func, bpf_iter_scx_dsq_next, KF_ITER_NEXT | KF_RET_NULL)
  7384	BTF_ID_FLAGS(func, bpf_iter_scx_dsq_destroy, KF_ITER_DESTROY)
  7385	BTF_ID_FLAGS(func, scx_bpf_exit_bstr, KF_TRUSTED_ARGS)
  7386	BTF_ID_FLAGS(func, scx_bpf_error_bstr, KF_TRUSTED_ARGS)
  7387	BTF_ID_FLAGS(func, scx_bpf_dump_bstr, KF_TRUSTED_ARGS)
  7388	BTF_ID_FLAGS(func, scx_bpf_cpuperf_cap)
  7389	BTF_ID_FLAGS(func, scx_bpf_cpuperf_cur)
  7390	BTF_ID_FLAGS(func, scx_bpf_cpuperf_set)
  7391	BTF_ID_FLAGS(func, scx_bpf_nr_cpu_ids)
  7392	BTF_ID_FLAGS(func, scx_bpf_get_possible_cpumask, KF_ACQUIRE)
  7393	BTF_ID_FLAGS(func, scx_bpf_get_online_cpumask, KF_ACQUIRE)
  7394	BTF_ID_FLAGS(func, scx_bpf_put_cpumask, KF_RELEASE)
  7395	BTF_ID_FLAGS(func, scx_bpf_get_idle_cpumask, KF_ACQUIRE)
  7396	BTF_ID_FLAGS(func, scx_bpf_get_idle_smtmask, KF_ACQUIRE)
  7397	BTF_ID_FLAGS(func, scx_bpf_put_idle_cpumask, KF_RELEASE)
  7398	BTF_ID_FLAGS(func, scx_bpf_test_and_clear_cpu_idle)
  7399	BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu, KF_RCU)
  7400	BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu, KF_RCU)
  7401	BTF_ID_FLAGS(func, scx_bpf_task_running, KF_RCU)
  7402	BTF_ID_FLAGS(func, scx_bpf_task_cpu, KF_RCU)
  7403	BTF_ID_FLAGS(func, scx_bpf_cpu_rq)
  7404	#ifdef CONFIG_CGROUP_SCHED
  7405	BTF_ID_FLAGS(func, scx_bpf_task_cgroup, KF_RCU | KF_ACQUIRE)
  7406	#endif
  7407	BTF_ID_FLAGS(func, scx_bpf_now)
  7408	BTF_ID_FLAGS(func, scx_bpf_events, KF_TRUSTED_ARGS)
  7409	BTF_KFUNCS_END(scx_kfunc_ids_any)
  7410	
  7411	static const struct btf_kfunc_id_set scx_kfunc_set_any = {
  7412		.owner			= THIS_MODULE,
  7413		.set			= &scx_kfunc_ids_any,
  7414	};
  7415	
  7416	static int __init scx_init(void)
  7417	{
  7418		int ret;
  7419	
  7420		/*
  7421		 * kfunc registration can't be done from init_sched_ext_class() as
  7422		 * register_btf_kfunc_id_set() needs most of the system to be up.
  7423		 *
  7424		 * Some kfuncs are context-sensitive and can only be called from
  7425		 * specific SCX ops. They are grouped into BTF sets accordingly.
  7426		 * Unfortunately, BPF currently doesn't have a way of enforcing such
  7427		 * restrictions. Eventually, the verifier should be able to enforce
  7428		 * them. For now, register them the same and make each kfunc explicitly
  7429		 * check using scx_kf_allowed().
  7430		 */
  7431		if ((ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS,
  7432						     &scx_kfunc_set_enqueue_dispatch)) ||
  7433		    (ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS,
  7434						     &scx_kfunc_set_dispatch)) ||
  7435		    (ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS,
  7436						     &scx_kfunc_set_cpu_release)) ||
  7437		    (ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS,
  7438						     &scx_kfunc_set_unlocked)) ||
  7439		    (ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL,
  7440						     &scx_kfunc_set_unlocked)) ||
  7441		    (ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS,
  7442						     &scx_kfunc_set_any)) ||
  7443		    (ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING,
  7444						     &scx_kfunc_set_any)) ||
  7445		    (ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL,
  7446						     &scx_kfunc_set_any))) {
  7447			pr_err("sched_ext: Failed to register kfunc sets (%d)\n", ret);
  7448			return ret;
  7449		}
  7450	
  7451		ret = scx_idle_init();
  7452		if (ret) {
  7453			pr_err("sched_ext: Failed to initialize idle tracking (%d)\n", ret);
  7454			return ret;
  7455		}
  7456	
  7457		ret = register_bpf_struct_ops(&bpf_sched_ext_ops, sched_ext_ops);
  7458		if (ret) {
  7459			pr_err("sched_ext: Failed to register struct_ops (%d)\n", ret);
  7460			return ret;
  7461		}
  7462	
  7463		ret = register_pm_notifier(&scx_pm_notifier);
  7464		if (ret) {
  7465			pr_err("sched_ext: Failed to register PM notifier (%d)\n", ret);
  7466			return ret;
  7467		}
  7468	
  7469		scx_kset = kset_create_and_add("sched_ext", &scx_uevent_ops, kernel_kobj);
  7470		if (!scx_kset) {
  7471			pr_err("sched_ext: Failed to create /sys/kernel/sched_ext\n");
  7472			return -ENOMEM;
  7473		}
  7474	
  7475		ret = sysfs_create_group(&scx_kset->kobj, &scx_global_attr_group);
  7476		if (ret < 0) {
  7477			pr_err("sched_ext: Failed to add global attributes\n");
  7478			return ret;
  7479		}
  7480	
  7481		return 0;
  7482	}
  7483	__initcall(scx_init);
  7484	
  7485	
  7486	/// ext_idle.c
  7487	
  7488	// SPDX-License-Identifier: GPL-2.0
  7489	/*
  7490	 * BPF extensible scheduler class: Documentation/scheduler/sched-ext.rst
  7491	 *
  7492	 * Built-in idle CPU tracking policy.
  7493	 *
  7494	 * Copyright (c) 2022 Meta Platforms, Inc. and affiliates.
  7495	 * Copyright (c) 2022 Tejun Heo <tj@kernel.org>
  7496	 * Copyright (c) 2022 David Vernet <dvernet@meta.com>
  7497	 * Copyright (c) 2024 Andrea Righi <arighi@nvidia.com>
  7498	 */
> 7499	#include "ext_idle.h"
  7500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
