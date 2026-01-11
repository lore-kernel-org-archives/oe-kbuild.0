Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CABC21883E
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768163041; cv=none; b=D6aFZBFZQxHSL8gmQzzsDUdDuK+u4xkPhRavMnEcabe8TDfQH3tw08AjjqLaeBWPwWh3vUQMpJaqPs6FbbR7Bb8mnh7AtcWY5XCrimA/2Rf/t8QRb93Mn6wwPTNQoKNaU+ecfzeML6iG2MAFpCGA1ChvX3GO0nnOQcVThjtKliE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768163041; c=relaxed/simple;
	bh=rS/hCw2Qul2qL7/3Y8nbK2LIh70MBHxU67eYT6fctCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YzNptWccA8vGU1bBPtehbhtZ9koBWzUZwrZ0KDS9IQ0uL1PT6yS9L32QKl0xQWO/p1m/lBhD0/3nsCw+BPGsw7N1a/6oKMX9gwaSWpWG7buppQdhNYjIpsSf8teHgiXz88gVeStULpOWVIJCOjFvbxX1JcG/s/BDPycrIHYsFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKf45AB3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKf45AB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768163038; x=1799699038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rS/hCw2Qul2qL7/3Y8nbK2LIh70MBHxU67eYT6fctCo=;
  b=IKf45AB380zxBfFeypN4ejpP9PsgH4WYo7CrQ/DA4rJ9pMox8ORrsxzC
   ez1LcXW9Nr4YuF4ivFAw7G/eS5ff9xRU3j1Kli2/tr57blXEDVvR+G0t9
   c5ChU69TOOqzFQnp1gqufdaFZHG/c1lmdfALOJciDN/m2a5lNx+E+tjpi
   wekDSPnvUNuX3QDaUTNH+b+PoLlzUbvgVsJDtk+fKPSw2xu/vFKxFeYlY
   fBkNxT3/j0g//6CNo/YboUZ4Eqqrknsq3bAyj0xsjIH7/YhdtEDOUfw4m
   kWvhJ8CQo6c5kkRd7Fk5ir5WEBQ2Pxqos3FYZ88+gHi5BXz8jnuwlQiVP
   A==;
X-CSE-ConnectionGUID: Jg7fq9JRQmGEdxRFZxd+IQ==
X-CSE-MsgGUID: Q+nsq15xQqSiL7uu5/+FCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69525418"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69525418"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 12:23:57 -0800
X-CSE-ConnectionGUID: W8oYOwr7TrSoDdX3Aa0f9w==
X-CSE-MsgGUID: wRI/F1KZS22LdE6Cl+Joow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203140435"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jan 2026 12:23:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf1yb-00000000Cfg-1mGk;
	Sun, 11 Jan 2026 20:23:53 +0000
Date: Mon, 12 Jan 2026 04:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v12 3/3] mm: Implement precise OOM killer task selection
Message-ID: <202601120452.VufCnz2j-lkp@intel.com>
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
In-Reply-To: <20260111150249.1222944-4-mathieu.desnoyers@efficios.com>
References: <20260111150249.1222944-4-mathieu.desnoyers@efficios.com>
TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: linux-kernel@vger.kernel.org
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>
CC: Dennis Zhou <dennis@kernel.org>
CC: Tejun Heo <tj@kernel.org>
CC: Christoph Lameter <cl@linux-foundation.org>
CC: Martin Liu <liumartin@google.com>
CC: David Rientjes <rientjes@google.com>
CC: christian.koenig@amd.com
CC: Shakeel Butt <shakeel.butt@linux.dev>
CC: SeongJae Park <sj@kernel.org>
CC: Michal Hocko <mhocko@suse.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: "Liam R . Howlett" <liam.howlett@oracle.com>
CC: Mike Rapoport <rppt@kernel.org>
CC: Suren Baghdasaryan <surenb@google.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Christian Brauner <brauner@kernel.org>
CC: Wei Yang <richard.weiyang@gmail.com>
CC: David Hildenbrand <david@redhat.com>
CC: Miaohe Lin <linmiaohe@huawei.com>
CC: Al Viro <viro@zeniv.linux.org.uk>
CC: linux-trace-kernel@vger.kernel.org
CC: Yu Zhao <yuzhao@google.com>

Hi Mathieu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260109]
[cannot apply to akpm-mm/mm-everything kees/for-next/execve tip/sched/core linus/master v6.19-rc4 v6.19-rc3 v6.19-rc2 v6.19-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/lib-Introduce-hierarchical-per-cpu-counters/20260111-231206
base:   next-20260109
patch link:    https://lore.kernel.org/r/20260111150249.1222944-4-mathieu.desnoyers%40efficios.com
patch subject: [PATCH v12 3/3] mm: Implement precise OOM killer task selection
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: s390-randconfig-r071-20260112 (https://download.01.org/0day-ci/archive/20260112/202601120452.VufCnz2j-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601120452.VufCnz2j-lkp@intel.com/

smatch warnings:
mm/oom_kill.c:392 oom_evaluate_task() error: uninitialized symbol 'points_min'.

vim +/points_min +392 mm/oom_kill.c

9b0f8b040acd8df Christoph Lameter 2006-02-20  321  
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  322  static int oom_evaluate_task(struct task_struct *task, void *arg)
462607ecc519b19 David Rientjes    2012-07-31  323  {
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  324  	struct oom_control *oc = arg;
72456781289a6ed Mathieu Desnoyers 2026-01-11  325  	unsigned long accuracy_under = 0, accuracy_over = 0;
72456781289a6ed Mathieu Desnoyers 2026-01-11  326  	long points, points_min, points_max;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  327  
ac311a14c682dcd Shakeel Butt      2019-07-11  328  	if (oom_unkillable_task(task))
ac311a14c682dcd Shakeel Butt      2019-07-11  329  		goto next;
ac311a14c682dcd Shakeel Butt      2019-07-11  330  
ac311a14c682dcd Shakeel Butt      2019-07-11  331  	/* p may not have freeable memory in nodemask */
ac311a14c682dcd Shakeel Butt      2019-07-11  332  	if (!is_memcg_oom(oc) && !oom_cpuset_eligible(task, oc))
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  333  		goto next;
462607ecc519b19 David Rientjes    2012-07-31  334  
462607ecc519b19 David Rientjes    2012-07-31  335  	/*
462607ecc519b19 David Rientjes    2012-07-31  336  	 * This task already has access to memory reserves and is being killed.
a373966d1f64c04 Michal Hocko      2016-07-28  337  	 * Don't allow any other task to have access to the reserves unless
862e3073b3eed13 Michal Hocko      2016-10-07  338  	 * the task has MMF_OOM_SKIP because chances that it would release
a373966d1f64c04 Michal Hocko      2016-07-28  339  	 * any memory is quite low.
462607ecc519b19 David Rientjes    2012-07-31  340  	 */
862e3073b3eed13 Michal Hocko      2016-10-07  341  	if (!is_sysrq_oom(oc) && tsk_is_oom_victim(task)) {
12e423ba4eaed7b Lorenzo Stoakes   2025-08-12  342  		if (mm_flags_test(MMF_OOM_SKIP, task->signal->oom_mm))
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  343  			goto next;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  344  		goto abort;
a373966d1f64c04 Michal Hocko      2016-07-28  345  	}
462607ecc519b19 David Rientjes    2012-07-31  346  
e1e12d2f3104be8 David Rientjes    2012-12-11  347  	/*
e1e12d2f3104be8 David Rientjes    2012-12-11  348  	 * If task is allocating a lot of memory and has been marked to be
e1e12d2f3104be8 David Rientjes    2012-12-11  349  	 * killed first if it triggers an oom, then select it.
e1e12d2f3104be8 David Rientjes    2012-12-11  350  	 */
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  351  	if (oom_task_origin(task)) {
9066e5cfb73cdbc Yafang Shao       2020-08-11  352  		points = LONG_MAX;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  353  		goto select;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  354  	}
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  355  
72456781289a6ed Mathieu Desnoyers 2026-01-11  356  	points = oom_badness(task, oc->totalpages, true, &accuracy_under, &accuracy_over);
72456781289a6ed Mathieu Desnoyers 2026-01-11  357  	if (points != LONG_MIN) {
72456781289a6ed Mathieu Desnoyers 2026-01-11  358  		percpu_counter_tree_approximate_min_max_range(points,
72456781289a6ed Mathieu Desnoyers 2026-01-11  359  				accuracy_under, accuracy_over,
72456781289a6ed Mathieu Desnoyers 2026-01-11  360  				&points_min, &points_max);
72456781289a6ed Mathieu Desnoyers 2026-01-11  361  	}
72456781289a6ed Mathieu Desnoyers 2026-01-11  362  	if (oc->approximate) {
72456781289a6ed Mathieu Desnoyers 2026-01-11  363  		/*
72456781289a6ed Mathieu Desnoyers 2026-01-11  364  		 * Keep the process which has the highest minimum
72456781289a6ed Mathieu Desnoyers 2026-01-11  365  		 * possible points value based on approximation.
72456781289a6ed Mathieu Desnoyers 2026-01-11  366  		 */
72456781289a6ed Mathieu Desnoyers 2026-01-11  367  		if (points == LONG_MIN || points_min < oc->chosen_points)
72456781289a6ed Mathieu Desnoyers 2026-01-11  368  			goto next;
72456781289a6ed Mathieu Desnoyers 2026-01-11  369  	} else {
72456781289a6ed Mathieu Desnoyers 2026-01-11  370  		/*
72456781289a6ed Mathieu Desnoyers 2026-01-11  371  		 * Eliminate processes which are certainly below the
72456781289a6ed Mathieu Desnoyers 2026-01-11  372  		 * chosen points minimum possible value with an
72456781289a6ed Mathieu Desnoyers 2026-01-11  373  		 * approximation.
72456781289a6ed Mathieu Desnoyers 2026-01-11  374  		 */
72456781289a6ed Mathieu Desnoyers 2026-01-11  375  		if (points == LONG_MIN || (long)(points_max - oc->chosen_points) < 0)
72456781289a6ed Mathieu Desnoyers 2026-01-11  376  			goto next;
72456781289a6ed Mathieu Desnoyers 2026-01-11  377  
72456781289a6ed Mathieu Desnoyers 2026-01-11  378  		if (oc->nr_precise < max_precise_badness_sums) {
72456781289a6ed Mathieu Desnoyers 2026-01-11  379  			oc->nr_precise++;
72456781289a6ed Mathieu Desnoyers 2026-01-11  380  			/* Precise evaluation. */
72456781289a6ed Mathieu Desnoyers 2026-01-11  381  			points_min = points_max = points = oom_badness(task, oc->totalpages, false, NULL, NULL);
72456781289a6ed Mathieu Desnoyers 2026-01-11  382  			if (points == LONG_MIN || (long)(points - oc->chosen_points) < 0)
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  383  				goto next;
72456781289a6ed Mathieu Desnoyers 2026-01-11  384  		}
72456781289a6ed Mathieu Desnoyers 2026-01-11  385  	}
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  386  
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  387  select:
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  388  	if (oc->chosen)
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  389  		put_task_struct(oc->chosen);
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  390  	get_task_struct(task);
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  391  	oc->chosen = task;
72456781289a6ed Mathieu Desnoyers 2026-01-11 @392  	oc->chosen_points = points_min;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  393  next:
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  394  	return 0;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  395  abort:
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  396  	if (oc->chosen)
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  397  		put_task_struct(oc->chosen);
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  398  	oc->chosen = (void *)-1UL;
7c5f64f84483bd1 Vladimir Davydov  2016-10-07  399  	return 1;
462607ecc519b19 David Rientjes    2012-07-31  400  }
462607ecc519b19 David Rientjes    2012-07-31  401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
