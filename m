Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795814993;
	b=L5WWMAg75XO+yWydHAYJDS4lYxeaP3iBmi9oMqac3Hax8Y33oC11Dlqp7OJZBs6Ngef2
	 tnI7nTdtvg4mpWqIok+GutDBQialDPalrKTk9qqcXlMS59Pn8erN4Ack65tcq1qC6+5ub
	 o8DjForKNy+noeaHGS4A09Hs7C+RL23lVpGYhWcM8NUnbkAPqRV/teXwe+11C5fhr7IKT
	 LhBOpvb7SuE5aGNHSZMIGZ7tTc2ZMoj5Wk0FpC4alI25PVsW02gkaTkXaZxNYQYknZ9uE
	 ociP5bIlSwKAG8xzxci+OtHCOmnfYFx9xWaiuUUXNaqWrGfUKgj0yg1ae8xaLuW3AeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795814993;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XN/ll5C3ywuEZarkrFnH8esQrlLx8N1PL9PmJk0COgQ=;
	b=uM0gSuHjDsnVurCSWbLqe6tuvmqtIavqYZ5X2rfjuj04ThwSheBNopsXy03AcRHXpxqK
	 3ZNnsrWt+KhnX9YpzFq2Y03cF0FsOKgFDP3UfmE+5MfFYo/QVCoASeMHMt8W3AVC7B5S3
	 /2maSmIBnSb89DZ1qo9SQitzGM8YXN9OrIxIf1O5GSwZHGyk1vkCjx/+8XT01XLwUmVrB
	 sPmbCGoTtZ0fo3xh8yTCAvIYCv1cAnhAzOUg7tSEVFwNZyYpKtNBiSPPwEpRbWoZLH2RB
	 gY14g/GAnUCfCqg6qKZ5d3XA4uXNOs7qCZERkYCeqTzv1YSRkzBiCGfLh5UmjNwRatg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="aFm/nt9l";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C63A606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 21:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C63A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aFm/nt9l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795814993; x=1827350993;
  h=date:from:to:cc:subject:message-id;
  bh=VACZbzzF0m+bE9Lo1lpVLQrYXDAlKqe8JRIW6EaWZBA=;
  b=aFm/nt9lixbX8bNhlF3hArx1pIsLSMl6gru5skOU55VsOmHttb2SQyf7
   6TZbx9DZm0t47jexaMinRE71HugOxQ5s7DN3CaK80GvzV05pAKowV70jK
   ohIMv5SYiE6DUBeiW9KtSjfVulcGbk0zjktlnM7h3vM60AkBnk/xhvBTR
   wOdqKRz0n9g+AnTELmh/kSu+1/k7GYq4R07Vf+WCSuwx9GxXPlimIB+jV
   xnWS8jN0S7nP+7Zgi1Gw3GqjZpiLoD2uKKnCmfOeJc2lFtK//xMptoZdh
   ObYNgFrHmt17galEZarDe+AZ8Th4AwM8uQfNw1P1xkuQ5QE+Vs1UivKjR
   Q==;
X-CSE-ConnectionGUID: OVsGkbDvS5mi57rS2FFovQ==
X-CSE-MsgGUID: NvB17KrRQIGbDJlPjsIlEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4687141"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4687141"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 13:29:53 -0800
X-CSE-ConnectionGUID: 5HTdNYWuR927yVdXHUXq3g==
X-CSE-MsgGUID: sSj1hQM+ShOCZ7NAy8WieA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12600423"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2026 13:29:51 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX3Vt-000000000Mg-174S;
	Fri, 27 Nov 2026 21:29:49 +0000
Date: Fri, 27 Nov 2026 22:29:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/trace/trace.c:6382:27-28: ERROR: invalid reference to
 the index variable of the iterator on line 6308
Message-ID: <20261127221903.9UWxwdxj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   822ba3a89c7896b26e4beb70e2ebffb881924dfe
commit: 428add559b6923f13acc591913cda3467be98dfd tracing: Have tracer option be instance specific
date:   1 year ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year ago
config: arm64-randconfig-r2100-20261126 (https://download.01.org/0day-ci/archive/20261127/20261127221903.9UWxwdxj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 428add559b69 ("tracing: Have tracer option be instance specific")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261127221903.9UWxwdxj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/trace/trace.c:6382:27-28: ERROR: invalid reference to the index variable of the iterator on line 6308
   kernel/trace/trace.c:6382:40-41: ERROR: invalid reference to the index variable of the iterator on line 6308

vim +6382 kernel/trace/trace.c

ef9188bcc6ca1d Mark-PK Tsai             2022-04-26  6286  
9c5b9d3d65e485 Masami Hiramatsu         2020-01-11  6287  int tracing_set_tracer(struct trace_array *tr, const char *buf)
09d23a1d8a82e8 Steven Rostedt (Red Hat  2015-02-03  6288) {
428add559b6923 Steven Rostedt           2025-11-11  6289  	struct tracer *trace = NULL;
428add559b6923 Steven Rostedt           2025-11-11  6290  	struct tracers *t;
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  6291) #ifdef CONFIG_TRACER_MAX_TRACE
34600f0e9c33c9 Steven Rostedt           2013-01-22  6292  	bool had_max_tr;
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  6293) #endif
d33b10c0c73adc Steven Rostedt           2024-12-24  6294  	int ret;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6295  
d33b10c0c73adc Steven Rostedt           2024-12-24  6296  	guard(mutex)(&trace_types_lock);
1027fcb206a0fb Steven Rostedt           2009-03-12  6297  
7a1d1e4b9639ff Steven Rostedt (Google   2024-06-12  6298) 	update_last_data(tr);
7a1d1e4b9639ff Steven Rostedt (Google   2024-06-12  6299) 
a1f157c7a3bb34 Zheng Yejian             2023-09-06  6300  	if (!tr->ring_buffer_expanded) {
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6301  		ret = __tracing_resize_ring_buffer(tr, trace_buf_size,
438ced1720b584 Vaibhav Nagarnaik        2012-02-02  6302  						RING_BUFFER_ALL_CPUS);
73c5162aa362a5 Steven Rostedt           2009-03-11  6303  		if (ret < 0)
d33b10c0c73adc Steven Rostedt           2024-12-24  6304  			return ret;
73c5162aa362a5 Steven Rostedt           2009-03-11  6305  		ret = 0;
73c5162aa362a5 Steven Rostedt           2009-03-11  6306  	}
73c5162aa362a5 Steven Rostedt           2009-03-11  6307  
428add559b6923 Steven Rostedt           2025-11-11 @6308  	list_for_each_entry(t, &tr->tracers, list) {
428add559b6923 Steven Rostedt           2025-11-11  6309  		if (strcmp(t->tracer->name, buf) == 0) {
428add559b6923 Steven Rostedt           2025-11-11  6310  			trace = t->tracer;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6311  			break;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6312  		}
428add559b6923 Steven Rostedt           2025-11-11  6313  	}
428add559b6923 Steven Rostedt           2025-11-11  6314  	if (!trace)
d33b10c0c73adc Steven Rostedt           2024-12-24  6315  		return -EINVAL;
d33b10c0c73adc Steven Rostedt           2024-12-24  6316  
428add559b6923 Steven Rostedt           2025-11-11  6317  	if (trace == tr->current_trace)
d33b10c0c73adc Steven Rostedt           2024-12-24  6318  		return 0;
bc0c38d139ec7f Steven Rostedt           2008-05-12  6319  
a35873a0993b4d Tom Zanussi              2019-02-13  6320  #ifdef CONFIG_TRACER_SNAPSHOT
428add559b6923 Steven Rostedt           2025-11-11  6321  	if (trace->use_max_tr) {
c0a581d7126c0b Waiman Long              2022-09-22  6322  		local_irq_disable();
a35873a0993b4d Tom Zanussi              2019-02-13  6323  		arch_spin_lock(&tr->max_lock);
22bec11a569983 Steven Rostedt           2025-01-06  6324  		ret = tr->cond_snapshot ? -EBUSY : 0;
a35873a0993b4d Tom Zanussi              2019-02-13  6325  		arch_spin_unlock(&tr->max_lock);
c0a581d7126c0b Waiman Long              2022-09-22  6326  		local_irq_enable();
a35873a0993b4d Tom Zanussi              2019-02-13  6327  		if (ret)
d33b10c0c73adc Steven Rostedt           2024-12-24  6328  			return ret;
a35873a0993b4d Tom Zanussi              2019-02-13  6329  	}
a35873a0993b4d Tom Zanussi              2019-02-13  6330  #endif
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6331) 	/* Some tracers won't work on kernel command line */
428add559b6923 Steven Rostedt           2025-11-11  6332  	if (system_state < SYSTEM_RUNNING && trace->noboot) {
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6333) 		pr_warn("Tracer '%s' is not allowed on command line, ignored\n",
428add559b6923 Steven Rostedt           2025-11-11  6334  			trace->name);
d1e27ee9c6f21c Steven Rostedt           2024-12-19  6335  		return -EINVAL;
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6336) 	}
c7b3ae0bd2ca65 Ziqian SUN (Zamir        2017-09-11  6337) 
607e2ea167e56d Steven Rostedt (Red Hat  2013-11-06  6338) 	/* Some tracers are only allowed for the top level buffer */
428add559b6923 Steven Rostedt           2025-11-11  6339  	if (!trace_ok_for_array(trace, tr))
d33b10c0c73adc Steven Rostedt           2024-12-24  6340  		return -EINVAL;
607e2ea167e56d Steven Rostedt (Red Hat  2013-11-06  6341) 
cf6ab6d9143b15 Steven Rostedt (Red Hat  2014-12-15  6342) 	/* If trace pipe files are being read, we can't change the tracer */
d33b10c0c73adc Steven Rostedt           2024-12-24  6343  	if (tr->trace_ref)
d33b10c0c73adc Steven Rostedt           2024-12-24  6344  		return -EBUSY;
cf6ab6d9143b15 Steven Rostedt (Red Hat  2014-12-15  6345) 
9f029e83e968e5 Steven Rostedt           2008-11-12  6346  	trace_branch_disable();
613f04a0f51e6e Steven Rostedt (Red Hat  2013-03-14  6347) 
50512ab576e1ce Steven Rostedt (Red Hat  2014-01-14  6348) 	tr->current_trace->enabled--;
613f04a0f51e6e Steven Rostedt (Red Hat  2013-03-14  6349) 
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6350  	if (tr->current_trace->reset)
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6351  		tr->current_trace->reset(tr);
613f04a0f51e6e Steven Rostedt (Red Hat  2013-03-14  6352) 
a541a9559bb0a8 Steven Rostedt (Google   2022-10-05  6353) #ifdef CONFIG_TRACER_MAX_TRACE
a541a9559bb0a8 Steven Rostedt (Google   2022-10-05  6354) 	had_max_tr = tr->current_trace->use_max_tr;
a541a9559bb0a8 Steven Rostedt (Google   2022-10-05  6355) 
7440172974e85b Paul E. McKenney         2018-11-06  6356  	/* Current trace needs to be nop_trace before synchronize_rcu */
2b6080f28c7cc3 Steven Rostedt           2012-05-11  6357  	tr->current_trace = &nop_trace;
428add559b6923 Steven Rostedt           2025-11-11  6358  	tr->current_trace_flags = nop_trace.flags;
34600f0e9c33c9 Steven Rostedt           2013-01-22  6359  
428add559b6923 Steven Rostedt           2025-11-11  6360  	if (had_max_tr && !trace->use_max_tr) {
34600f0e9c33c9 Steven Rostedt           2013-01-22  6361  		/*
34600f0e9c33c9 Steven Rostedt           2013-01-22  6362  		 * We need to make sure that the update_max_tr sees that
34600f0e9c33c9 Steven Rostedt           2013-01-22  6363  		 * current_trace changed to nop_trace to keep it from
34600f0e9c33c9 Steven Rostedt           2013-01-22  6364  		 * swapping the buffers after we resize it.
34600f0e9c33c9 Steven Rostedt           2013-01-22  6365  		 * The update_max_tr is called from interrupts disabled
34600f0e9c33c9 Steven Rostedt           2013-01-22  6366  		 * so a synchronized_sched() is sufficient.
34600f0e9c33c9 Steven Rostedt           2013-01-22  6367  		 */
7440172974e85b Paul E. McKenney         2018-11-06  6368  		synchronize_rcu();
3209cff4490bee Steven Rostedt (Red Hat  2013-03-12  6369) 		free_snapshot(tr);
180e4e390978af Vincent Donnefort        2024-02-20  6370  		tracing_disarm_snapshot(tr);
ef710e100c1068 KOSAKI Motohiro          2010-07-01  6371  	}
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  6372) 
428add559b6923 Steven Rostedt           2025-11-11  6373  	if (!had_max_tr && trace->use_max_tr) {
180e4e390978af Vincent Donnefort        2024-02-20  6374  		ret = tracing_arm_snapshot_locked(tr);
180e4e390978af Vincent Donnefort        2024-02-20  6375  		if (ret)
d33b10c0c73adc Steven Rostedt           2024-12-24  6376  			return ret;
ef710e100c1068 KOSAKI Motohiro          2010-07-01  6377  	}
a541a9559bb0a8 Steven Rostedt (Google   2022-10-05  6378) #else
a541a9559bb0a8 Steven Rostedt (Google   2022-10-05  6379) 	tr->current_trace = &nop_trace;
12883efb670c28 Steven Rostedt (Red Hat  2013-03-05  6380) #endif
577b785f55168d Steven Rostedt           2009-02-26  6381  
428add559b6923 Steven Rostedt           2025-11-11 @6382  	tr->current_trace_flags = t->flags ? : t->tracer->flags;
428add559b6923 Steven Rostedt           2025-11-11  6383  
428add559b6923 Steven Rostedt           2025-11-11  6384  	if (trace->init) {
428add559b6923 Steven Rostedt           2025-11-11  6385  		ret = tracer_init(trace, tr);
180e4e390978af Vincent Donnefort        2024-02-20  6386  		if (ret) {
180e4e390978af Vincent Donnefort        2024-02-20  6387  #ifdef CONFIG_TRACER_MAX_TRACE
428add559b6923 Steven Rostedt           2025-11-11  6388  			if (trace->use_max_tr)
180e4e390978af Vincent Donnefort        2024-02-20  6389  				tracing_disarm_snapshot(tr);
180e4e390978af Vincent Donnefort        2024-02-20  6390  #endif
428add559b6923 Steven Rostedt           2025-11-11  6391  			tr->current_trace_flags = nop_trace.flags;
d33b10c0c73adc Steven Rostedt           2024-12-24  6392  			return ret;
1c80025a49855b Frederic Weisbecker      2008-11-16  6393  		}
180e4e390978af Vincent Donnefort        2024-02-20  6394  	}
bc0c38d139ec7f Steven Rostedt           2008-05-12  6395  
428add559b6923 Steven Rostedt           2025-11-11  6396  	tr->current_trace = trace;
50512ab576e1ce Steven Rostedt (Red Hat  2014-01-14  6397) 	tr->current_trace->enabled++;
9f029e83e968e5 Steven Rostedt           2008-11-12  6398  	trace_branch_enable(tr);
bc0c38d139ec7f Steven Rostedt           2008-05-12  6399  
d33b10c0c73adc Steven Rostedt           2024-12-24  6400  	return 0;
d9e540762f5cdd Peter Zijlstra           2008-11-01  6401  }
d9e540762f5cdd Peter Zijlstra           2008-11-01  6402  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
