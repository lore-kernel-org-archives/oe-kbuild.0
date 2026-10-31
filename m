Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793441200;
	b=ESHeQ9xFB4mmsfpOurhCOwcA0jdkbMkgVrdBPtES2TR5NAvWPvmI9OKlkctTyaQFy+AS
	 kwLtayUE9O8T2Es8gxfq8kHx0xfVElN2051fM48V39pyoAVFovv4I+LQCBhBGXDiQAGBm
	 PECfA5qkp9Cs19bOXEE3P2nxRGHXsDL0fODntb01NIDeTXu3SV30pSNr9jNfwJwl4LPEu
	 5oA5ZjyF26yMAOlJxYfmdJmKW4LUIfDC8KGC88Ol9W1qrjmRzIahecjSsxhZ1ZWtsqzKZ
	 NPGcCGBN9oN2MXD/0zDbo53dTI7J+qYcmR5a6i8ICwPc6SKe99vWouyuKyH13uCkEyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793441200;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=m5y1Hap9d5ARNA4a9D5ih4DkImk597wgL7BcCvN9fY4=;
	b=k91t79J1mgw9Z5rgo4CyUjGnODmOj4Q00eC6MNkymaynyRY0hPm9ixWBssPY7z9Xe2ec
	 6WXqd0R4adisfhrw1ZhzyODfbNGp1mUj7pdw12M+XCSeNelqBhHPA6eM6nUZEGnCIcGiM
	 lN+ZtkX0n/J8dNUqUHJP1cj1WwnPEPI0t4KhxgFpmHDah59Et7B/A89VkhDEIc9u/y4DK
	 74J2XnyxShxS4hxnA+UrTdIqPLopqM9YXHEos2AuAv0s/v8MaWDzymhVRse1MaEuWzlqx
	 0Y4OkDdn4MocU9jPRbN82kxsFIIsG7kbhb52UISMtSKcd1vgazuV8DKzi9MGO+wmJFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eS4TtBX9;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAFB606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 10:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CAFB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eS4TtBX9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793441198; x=1824977198;
  h=date:from:to:cc:subject:message-id;
  bh=WdAV60FJLu328NgRfsWhOU59EM+/GiDvPGJL/zHHna8=;
  b=eS4TtBX9n8hijO+z2/Zb3U9TQawzj1SZUu6p8b/Ce2PJaiREbKfeQQXi
   77+CpBwntcCH/tqXMbOd77UrTDEaPYyDC86d4A+Wn31QF46pcjtd+Dsx4
   5B4T48oRTR6dNYYjq4xv5B4ZOEsf3/OVwgreQMOo7wQPcUhnlkVZLoGln
   umoht8pJy2G8pgHL7hchEs9iGkA9rzpHV2/EjxQGFbe7AlguigED7u8ZQ
   QhYHMjd44c9qaPxttbVq8VQgtv/bsELaDzrGsz/XBZkWrGoVEWCNqfaOV
   4eTYqT6G6dCFg2ekxKr6atsQzPDRP/vvf6fWxPsPjiPVZb+GSAVieVHzV
   g==;
X-CSE-ConnectionGUID: EXUV/0X4Ssayz1VFyO8CBg==
X-CSE-MsgGUID: NbE0ITq+QkCOjKgY4pU2WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2076170"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2076170"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 03:06:37 -0700
X-CSE-ConnectionGUID: rnh6puQERq2VY3y/VHUIow==
X-CSE-MsgGUID: LOjEwEjiT3G+/k3jSJAh1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5665653"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2026 03:06:35 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN5yq-000000005x3-20lz;
	Sat, 31 Oct 2026 10:06:32 +0000
Date: Sat, 31 Oct 2026 11:06:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/trace.c:2195 __ftrace_trace_stack() error:
 __builtin_memcpy() 'fstack->calls' too small (4096 vs u32max)
Message-ID: <202610311050.WdhCzroo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bill Wendling <morbo@google.com>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   36aad21d50d1af3f6954bb0c988257a908202477
commit: 2f70a9b7e9c74b92a85a2584090f0f5c4cbaa4be overflow: Match arithmetic in both parts of __builtin_choose_expr
date:   2 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: um-randconfig-r2201-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311050.WdhCzroo-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2f70a9b7e9c7 ("overflow: Match arithmetic in both parts of __builtin_choose_expr")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610311050.WdhCzroo-lkp@intel.com/

smatch warnings:
kernel/trace/trace.c:2195 __ftrace_trace_stack() error: __builtin_memcpy() 'fstack->calls' too small (4096 vs u32max)
drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c:132 mlxsw_sp_counter_pool_init() error: __builtin_memcpy() 'mlxsw_sp_counter_sub_pools' too small (80 vs u32max)
lib/stackdepot.c:471 depot_alloc_stack() error: __builtin_memcpy() 'stack->entries' too small (256 vs u32max)

vim +2195 kernel/trace/trace.c

6ce5a6f0a07d37 Tatsuya S                2024-10-21  2186  
3e9a8aadca4807 Steven Rostedt (Red Hat  2016-11-23  2187) 	event = __trace_buffer_lock_reserve(buffer, TRACE_STACK,
e7186af7fb2609 Steven Rostedt (Google   2023-07-13  2188) 				    struct_size(entry, caller, nr_entries),
9deb193af69d3f Steven Rostedt (VMware   2021-04-01  2189) 				    trace_ctx);
3928a8a2d98081 Steven Rostedt           2008-09-29  2190  	if (!event)
4a9bd3f134decd Steven Rostedt           2011-07-14  2191  		goto out;
e7186af7fb2609 Steven Rostedt (Google   2023-07-13  2192) 	entry = ring_buffer_event_data(event);
86387f7ee5d327 Ingo Molnar              2008-05-12  2193  
ee6dd0db4d8de4 Thomas Gleixner          2019-04-25  2194  	entry->size = nr_entries;
e7186af7fb2609 Steven Rostedt (Google   2023-07-13 @2195) 	memcpy(&entry->caller, fstack->calls,
e7186af7fb2609 Steven Rostedt (Google   2023-07-13  2196) 	       flex_array_size(entry, caller, nr_entries));
4a9bd3f134decd Steven Rostedt           2011-07-14  2197  
7ffbd48d5cab22 Steven Rostedt           2012-10-11  2198  	__buffer_unlock_commit(buffer, event);
4a9bd3f134decd Steven Rostedt           2011-07-14  2199  
4a9bd3f134decd Steven Rostedt           2011-07-14  2200   out:
4a9bd3f134decd Steven Rostedt           2011-07-14  2201  	/* Again, don't let gcc optimize things here */
4a9bd3f134decd Steven Rostedt           2011-07-14  2202  	barrier();
821465295b3613 Shan Wei                 2012-11-19  2203  	__this_cpu_dec(ftrace_stack_reserve);
5f1ef0dfcb5b7f Steven Rostedt           2026-01-05  2204  	trace_clear_recursion(bit);
86387f7ee5d327 Ingo Molnar              2008-05-12  2205  }
86387f7ee5d327 Ingo Molnar              2008-05-12  2206  

:::::: The code at line 2195 was first introduced by commit
:::::: e7186af7fb2609584a8bfb3da3c6ae09da5a5224 tracing: Add back FORTIFY_SOURCE logic to kernel_stack event structure

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
