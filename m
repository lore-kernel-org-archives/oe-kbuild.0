Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B329326B2BC
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Feb 2025 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739891498; cv=none; b=aCGMU7fVDmzYKBBNQgv63PDoTKrzUoNWIvXWuqDigqbqpip/hRFWiavavoNgw0sRYCLAFSo3QB+EBwAEsoozEkg7heAL/yQkgzBv8RRVELdAp6qgTmJbX07eI8WN6FCRRraioKqtEQpjVd6qc8QclOKPIfJYGmvQjl7mHBgYHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739891498; c=relaxed/simple;
	bh=sUwj5iyDSPdXA9aC4NlkXQR88jpbhFLUqiiKoPYg3yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WlWTUJQLOD20O48wzW6XsfpDYCTTnLUM4cT3vQqQqIH/MXNkCASV8DFZBOJCE7abvqqwruIkcRsiW5uq0AJVWP6wyaXUAd6H1HEqPC4763QFjloivxZU04vF5cATbEVuXi/zIKjfSLU5wvGcyLUEgtc/8CxPkQQvBir38hNHegw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UP8RR1wE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UP8RR1wE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739891496; x=1771427496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sUwj5iyDSPdXA9aC4NlkXQR88jpbhFLUqiiKoPYg3yc=;
  b=UP8RR1wEbT9/3knqMFlS3q+iD03CeRAUPIBJSJMeUkaPhr+1YJnsO2LQ
   wIcUq0uOWNz3wV+lvXlwZS0hgnqoukISUz6SY9zQydorj2FVVHFRalEs6
   0o/vv5CVCKWELrtfbLCxyIgNrxOPHqTW4MXBMw/TVDU65zSqjmvwj7LCH
   AYUAJEDqHJfPAeXqU/S6OOq7IPjEip3e2BVWxebZekpb+zCHgfz7vQFuY
   6M76NCwrCZRO280mMkNYtQLUabqDSJkgb4UFkBv1y0mFSsXakCqXmwu3g
   bWjz+tvKo7VeyQGFCgKNeXsAWy9THWXv4I1ETTv2KY2bPYt/Prtgc1+mx
   Q==;
X-CSE-ConnectionGUID: T/3vfeS6SWaX+4ItXGouwQ==
X-CSE-MsgGUID: KnoCzjCKQaC5hVvifJH2bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51212846"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="51212846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 07:11:36 -0800
X-CSE-ConnectionGUID: S05tIug/TJCqVjaMZ/jajg==
X-CSE-MsgGUID: INC+OoVQR7uJVBTvqgTuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="115085462"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Feb 2025 07:11:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkPG1-0000fD-0J;
	Tue, 18 Feb 2025 15:11:33 +0000
Date: Tue, 18 Feb 2025 23:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:pr/60 1/1] kernel/trace/trace_branch.c:145:2: warning:
 converting the enum constant to a boolean
Message-ID: <202502182344.ziq9jaXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: a3bc88645e9293f5aaac9c05a185d9f1c0594c6c [1/1] kbuild: re-enable int-in-bool-context warning
:::::: branch date: 27 hours ago
:::::: commit date: 6 years ago
config: x86_64-buildonly-randconfig-006-20250218 (https://download.01.org/0day-ci/archive/20250218/202502182344.ziq9jaXe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502182344.ziq9jaXe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502182344.ziq9jaXe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
     145 |         trace_assign_type(field, iter->ent);
         |         ^
   kernel/trace/trace.h:396:3: note: expanded from macro 'trace_assign_type'
     396 |                 IF_ASSIGN(var, ent, struct stack_entry, TRACE_STACK);   \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:397:3: note: expanded from macro 'trace_assign_type'
     397 |                 IF_ASSIGN(var, ent, struct userstack_entry, TRACE_USER_STACK);\
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:398:3: note: expanded from macro 'trace_assign_type'
     398 |                 IF_ASSIGN(var, ent, struct print_entry, TRACE_PRINT);   \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:399:3: note: expanded from macro 'trace_assign_type'
     399 |                 IF_ASSIGN(var, ent, struct bprint_entry, TRACE_BPRINT); \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:400:3: note: expanded from macro 'trace_assign_type'
     400 |                 IF_ASSIGN(var, ent, struct bputs_entry, TRACE_BPUTS);   \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:401:3: note: expanded from macro 'trace_assign_type'
     401 |                 IF_ASSIGN(var, ent, struct hwlat_entry, TRACE_HWLAT);   \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:402:3: note: expanded from macro 'trace_assign_type'
     402 |                 IF_ASSIGN(var, ent, struct raw_data_entry, TRACE_RAW_DATA);\
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:403:3: note: expanded from macro 'trace_assign_type'
     403 |                 IF_ASSIGN(var, ent, struct trace_mmiotrace_rw,          \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:405:3: note: expanded from macro 'trace_assign_type'
     405 |                 IF_ASSIGN(var, ent, struct trace_mmiotrace_map,         \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:407:3: note: expanded from macro 'trace_assign_type'
     407 |                 IF_ASSIGN(var, ent, struct trace_branch, TRACE_BRANCH); \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:408:3: note: expanded from macro 'trace_assign_type'
     408 |                 IF_ASSIGN(var, ent, struct ftrace_graph_ent_entry,      \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
>> kernel/trace/trace_branch.c:145:2: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
   kernel/trace/trace.h:410:3: note: expanded from macro 'trace_assign_type'
     410 |                 IF_ASSIGN(var, ent, struct ftrace_graph_ret_entry,      \
         |                 ^
   kernel/trace/trace.h:372:14: note: expanded from macro 'IF_ASSIGN'
     372 |                 WARN_ON(id && (entry)->type != id);     \
         |                            ^
   kernel/trace/trace_branch.c:205:6: warning: no previous prototype for function 'ftrace_likely_update' [-Wmissing-prototypes]
     205 | void ftrace_likely_update(struct ftrace_likely_data *f, int val,
         |      ^
   kernel/trace/trace_branch.c:205:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     205 | void ftrace_likely_update(struct ftrace_likely_data *f, int val,
         | ^
         | static 
   13 warnings generated.


vim +145 kernel/trace/trace_branch.c

80e5ea4506791af kernel/trace/trace_unlikely.c Steven Rostedt           2008-11-12  139  
ae7462b4f1fe1f3 kernel/trace/trace_branch.c   Arnaldo Carvalho de Melo 2009-02-03  140  static enum print_line_t trace_branch_print(struct trace_iterator *iter,
a9a5776380208a3 kernel/trace/trace_branch.c   Steven Rostedt           2010-04-22  141  					    int flags, struct trace_event *event)
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  142  {
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  143  	struct trace_branch *field;
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  144  
2c9b238eb325895 kernel/trace/trace_branch.c   Arnaldo Carvalho de Melo 2009-02-02 @145  	trace_assign_type(field, iter->ent);
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  146  
7d40f67165d9a4c kernel/trace/trace_branch.c   Steven Rostedt (Red Hat  2014-11-12  147) 	trace_seq_printf(&iter->seq, "[%s] %s:%s:%d\n",
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  148  			 field->correct ? "  ok  " : " MISS ",
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  149  			 field->func,
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  150  			 field->file,
7d40f67165d9a4c kernel/trace/trace_branch.c   Steven Rostedt (Red Hat  2014-11-12  151) 			 field->line);
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  152  
7d40f67165d9a4c kernel/trace/trace_branch.c   Steven Rostedt (Red Hat  2014-11-12  153) 	return trace_handle_return(&iter->seq);
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  154  }
f633cef0200bbae kernel/trace/trace_branch.c   Steven Rostedt           2008-12-23  155  

:::::: The code at line 145 was first introduced by commit
:::::: 2c9b238eb325895d3312dad64e2685783575e474 trace: Change struct trace_event callbacks parameter list

:::::: TO: Arnaldo Carvalho de Melo <acme@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
