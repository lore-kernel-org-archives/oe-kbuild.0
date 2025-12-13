Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6AA2C0279
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 08:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765614562; cv=none; b=l+bvfOYpxIrtD82TXzR9lUX3M2xhGFDmiV6BDaxsqw0miXQ77LMJkWlanhxlodFbS1IrC1fec0mPYUammuHZd+7QOJONuwvwL57wn8yTGeILhJGdJG0VA8dODiOS4ks+y0CzvDQSc7ZpgdysSANyqt5vldoqEukRVu+hZwotgrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765614562; c=relaxed/simple;
	bh=Lm/fiP3QqW92yHhUc4feeF8R5pDzpOt2CIvh0Fvdb/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=krDxoe65wfcIYZP7AbsQMuXS2fNQJ26X+dciCIay4Af7Lzge8pmghe/0ZBPz2SVx8QWj8ozA5pSVkrlHhSnT/ZujLLKZhDl7XmYCxaYBjYqgYGE762wVIxp/La09GQ3Cbx7mnxRigY+4DWdXjIecEssE3ge6E/PqKWyy2xXCAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpdb3Pct; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpdb3Pct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765614561; x=1797150561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lm/fiP3QqW92yHhUc4feeF8R5pDzpOt2CIvh0Fvdb/k=;
  b=kpdb3PctIjJhkOtObZ8oBOhM6pv0FJ+c5HOtvDlwEOJQZyhHb06rcxH1
   ALxTjKeC1QLsx4BHRMzuIMBnjZXn7IxP2NZDXDcWlo2dtssSdUaPzeii3
   aLOJOP6TGrGdr0jNWTgoCizcHnA5uyQo/hBLUFyVyb13+7HtE2ra6tasR
   ltUH5uPG+yA3bmAiruQTULmWL8+qLkDifQEvgb3r+b/g19oZZE55djTwI
   Hmn89xtZL0qy2F5t53AP2ww7nEKpUOaNzi8EbgrTgVVXmPm6Xq78PRRgF
   O/9+L+hwCpI42QsDHbazUXLiE3vAUw4SjoQPOgYYkbMcmeDLZw1ey5MsS
   w==;
X-CSE-ConnectionGUID: rebIBGlTR0qlDQncnMQ2vw==
X-CSE-MsgGUID: G7Sxzym2T+6lQcxebPep5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71232909"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71232909"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:29:19 -0800
X-CSE-ConnectionGUID: F3iMczcRR8ODGKln5ndEhA==
X-CSE-MsgGUID: nARwGG5WSnqEnCMi8s090g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197177989"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 00:29:18 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUL07-000000007Ju-2vMG;
	Sat, 13 Dec 2025 08:29:15 +0000
Date: Sat, 13 Dec 2025 16:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error: we
 previously assumed 'fregs' could be null (see line 830)
Message-ID: <202512131657.JQUt5fXQ-lkp@intel.com>
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
TO: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a919610db43b34621d0c3b333e12db9002caf5da
commit: 2ca8c112c9676e2394d76760db78ffddf21d93b5 fgraph: Pass ftrace_regs to retfunc
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131657.JQUt5fXQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131657.JQUt5fXQ-lkp@intel.com/

smatch warnings:
kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error: we previously assumed 'fregs' could be null (see line 830)

vim +/fregs +834 kernel/trace/fgraph.c

e73e679f656e67 Steven Rostedt (VMware    2018-11-15  805) 
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  806) /*
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  807)  * Send the trace to the ring-buffer.
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  808)  * @return the original return address.
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  809)  */
a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  810) static inline unsigned long
a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  811) __ftrace_return_to_handler(struct ftrace_regs *fregs, unsigned long frame_pointer)
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  812) {
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  813) 	struct ftrace_ret_stack *ret_stack;
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  814) 	struct ftrace_graph_ret trace;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  815) 	unsigned long bitmap;
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  816) 	unsigned long ret;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  817) 	int offset;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  818) 	int i;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  819) 
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  820) 	ret_stack = ftrace_pop_return_trace(&trace, &ret, frame_pointer, &offset);
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  821) 
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  822) 	if (unlikely(!ret_stack)) {
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  823) 		ftrace_graph_stop();
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  824) 		WARN_ON(1);
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  825) 		/* Might as well panic. What else to do? */
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  826) 		return (unsigned long)panic;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  827) 	}
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  828) 
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  829) 	trace.rettime = trace_clock_local();
2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26 @830) 	if (fregs)
2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  831) 		ftrace_regs_set_instruction_pointer(fregs, ret);
2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  832) 
a1be9ccc57f07d Donglin Peng              2023-04-08  833  #ifdef CONFIG_FUNCTION_GRAPH_RETVAL
a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26 @834) 	trace.retval = ftrace_regs_get_return_value(fregs);
a1be9ccc57f07d Donglin Peng              2023-04-08  835  #endif
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  836) 
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  837) 	bitmap = get_bitmap_bits(current, offset);
420e1354bcb6f0 Steven Rostedt (Google    2024-06-03  838) 

:::::: The code at line 834 was first introduced by commit
:::::: a3ed4157b7d89800a0008de0c9e46a438a5c3745 fgraph: Replace fgraph_ret_regs with ftrace_regs

:::::: TO: Masami Hiramatsu (Google) <mhiramat@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
