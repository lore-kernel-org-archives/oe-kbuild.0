Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530C21D00A
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 22:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773355780; cv=none; b=CPCJ+P6CZHGIQatCR2VLaJj4sUBdN9LWjAsqiAxo/561PNPyH0kL7KfLo0WbCAaw8XPS+sl5RnIotB1DPcymVrNxESXq9vUrC3Yp6s/K10SbC3ASiUudWtHLWTTRQdaMgSEWynifSdus/Q9rwQUy5AwCzbaP8uORQRC8Bq2b7EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773355780; c=relaxed/simple;
	bh=8Eww+Wc5idp0fez2ByDDg3IcQv2AoX46IBd2xJ1VNoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M9hV0w+ZJWr0HGPcOhgGUZy0IA8XuIt069nuYFIhHzv0DUhZrRFQjGm7KQjam3DDgXuJGPK0Yum9KDoNFqtHMisRpYHuKpuHgqWtoMyF59yxOQ0IYQAmSNgFYjeR9HLMDp7/aaEBPeEZgyCgIOdm5kpx/MdInzLBaARgw6eS/Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMz8RPAT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMz8RPAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773355778; x=1804891778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Eww+Wc5idp0fez2ByDDg3IcQv2AoX46IBd2xJ1VNoU=;
  b=TMz8RPATyrIU8U4H/VKFW66l9XrwIjJUet9YCJTPbdf3GWddh8bwcjQn
   nZQA9/xHCvaMXGDK9Bk+jpt9/S5wWKEAwqIxhCK+amL1kH6SKPriWs8Cc
   xuCY9MUk4rKM22iookzBa4+BY8Y0GGj/SwRzIT5HnUhKL4nNanx6/nD5Q
   CCCYUek3kDFN0AMlZQDW2hejnAiVRyU/vOwcsxpivW+P4mDPeVP+ZQXjw
   PYvws+Wba25cApiW/rLxUGLcxZw6wI6/Bhfunin9biFU2Olkx1PYqsA4M
   WM+LXCimsZgkI6AYp1oLtP7wjInfXXF6xLZFjvPDhWngEpRBK+yF67SLI
   Q==;
X-CSE-ConnectionGUID: +RzO3frZRmOLnHXtRhld+Q==
X-CSE-MsgGUID: VHdrlTtMQ+CBGwudkKmxEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85815512"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85815512"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 15:49:38 -0700
X-CSE-ConnectionGUID: leqXsRQ5R0y+x7oTDpoyVw==
X-CSE-MsgGUID: EtbBMBK5QT6RBrO2xwoqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="218742105"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Mar 2026 15:49:36 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0oqT-000000003E3-49ts;
	Thu, 12 Mar 2026 22:49:33 +0000
Date: Fri, 13 Mar 2026 06:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/3] tracing: Update futex syscall trace event to show
 more commands
Message-ID: <202603130608.WKdib8MH-lkp@intel.com>
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
In-Reply-To: <20260310201036.713629966@kernel.org>
References: <20260310201036.713629966@kernel.org>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: linux-kernel@vger.kernel.org
TO: linux-trace-kernel@vger.kernel.org
CC: Masami Hiramatsu <mhiramat@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Brian Geffon <bgeffon@google.com>
CC: John Stultz <jstultz@google.com>
CC: Ian Rogers <irogers@google.com>
CC: Suleiman Souhlal <suleiman@google.com>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on trace/for-next akpm-mm/mm-everything linus/master v7.0-rc3 next-20260311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Have-futex-syscall-trace-event-show-specific-user-data/20260311-041422
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20260310201036.713629966%40kernel.org
patch subject: [PATCH v2 2/3] tracing: Update futex syscall trace event to show more commands
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20260311 (https://download.01.org/0day-ci/archive/20260313/202603130608.WKdib8MH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603130608.WKdib8MH-lkp@intel.com/

smatch warnings:
kernel/trace/trace_syscalls.c:650 futex_fields() warn: missing unwind goto?

vim +650 kernel/trace/trace_syscalls.c

50307a45f8515f Lai Jiangshan  2009-12-15  633  
15901aaefa1313 Steven Rostedt 2026-03-10  634  static int __init futex_fields(struct trace_event_call *call, int offset)
15901aaefa1313 Steven Rostedt 2026-03-10  635  {
15901aaefa1313 Steven Rostedt 2026-03-10  636  	char *arg;
15901aaefa1313 Steven Rostedt 2026-03-10  637  	int ret;
15901aaefa1313 Steven Rostedt 2026-03-10  638  
15901aaefa1313 Steven Rostedt 2026-03-10  639  	arg = kstrdup("__value", GFP_KERNEL);
15901aaefa1313 Steven Rostedt 2026-03-10  640  	if (WARN_ON_ONCE(!arg))
15901aaefa1313 Steven Rostedt 2026-03-10  641  		return -ENOMEM;
15901aaefa1313 Steven Rostedt 2026-03-10  642  	ret = trace_define_field(call, "u32", arg, offset, sizeof(int), 0,
15901aaefa1313 Steven Rostedt 2026-03-10  643  				 FILTER_OTHER);
15901aaefa1313 Steven Rostedt 2026-03-10  644  	if (ret)
f3ff4ed51edb59 Steven Rostedt 2026-03-10  645  		goto free;
f3ff4ed51edb59 Steven Rostedt 2026-03-10  646  	offset += sizeof(int);
f3ff4ed51edb59 Steven Rostedt 2026-03-10  647  
f3ff4ed51edb59 Steven Rostedt 2026-03-10  648  	arg = kstrdup("__value2", GFP_KERNEL);
f3ff4ed51edb59 Steven Rostedt 2026-03-10  649  	if (WARN_ON_ONCE(!arg))
f3ff4ed51edb59 Steven Rostedt 2026-03-10 @650  		return -ENOMEM;
f3ff4ed51edb59 Steven Rostedt 2026-03-10  651  	ret = trace_define_field(call, "u32", arg, offset, sizeof(int), 0,
f3ff4ed51edb59 Steven Rostedt 2026-03-10  652  				 FILTER_OTHER);
f3ff4ed51edb59 Steven Rostedt 2026-03-10  653  	if (ret)
f3ff4ed51edb59 Steven Rostedt 2026-03-10  654  		goto free;
f3ff4ed51edb59 Steven Rostedt 2026-03-10  655  	offset += sizeof(int);
f3ff4ed51edb59 Steven Rostedt 2026-03-10  656  
f3ff4ed51edb59 Steven Rostedt 2026-03-10  657  	arg = kstrdup("__ts1", GFP_KERNEL);
f3ff4ed51edb59 Steven Rostedt 2026-03-10  658  	if (WARN_ON_ONCE(!arg))
f3ff4ed51edb59 Steven Rostedt 2026-03-10  659  		return -ENOMEM;
f3ff4ed51edb59 Steven Rostedt 2026-03-10  660  	ret = trace_define_field(call, "unsigned long", arg, offset,
f3ff4ed51edb59 Steven Rostedt 2026-03-10  661  				 sizeof(unsigned long), 0, FILTER_OTHER);
f3ff4ed51edb59 Steven Rostedt 2026-03-10  662  	if (ret)
f3ff4ed51edb59 Steven Rostedt 2026-03-10  663  		goto free;
f3ff4ed51edb59 Steven Rostedt 2026-03-10  664  	offset += sizeof(long);
f3ff4ed51edb59 Steven Rostedt 2026-03-10  665  
f3ff4ed51edb59 Steven Rostedt 2026-03-10  666  	arg = kstrdup("__ts2", GFP_KERNEL);
f3ff4ed51edb59 Steven Rostedt 2026-03-10  667  	if (WARN_ON_ONCE(!arg))
f3ff4ed51edb59 Steven Rostedt 2026-03-10  668  		return -ENOMEM;
f3ff4ed51edb59 Steven Rostedt 2026-03-10  669  	ret = trace_define_field(call, "unsigned long", arg, offset,
f3ff4ed51edb59 Steven Rostedt 2026-03-10  670  				 sizeof(unsigned long), 0, FILTER_OTHER);
f3ff4ed51edb59 Steven Rostedt 2026-03-10  671  	if (ret)
f3ff4ed51edb59 Steven Rostedt 2026-03-10  672  		goto free;
f3ff4ed51edb59 Steven Rostedt 2026-03-10  673  
f3ff4ed51edb59 Steven Rostedt 2026-03-10  674  	return 0;
f3ff4ed51edb59 Steven Rostedt 2026-03-10  675  
f3ff4ed51edb59 Steven Rostedt 2026-03-10  676  free:
15901aaefa1313 Steven Rostedt 2026-03-10  677  	kfree(arg);
15901aaefa1313 Steven Rostedt 2026-03-10  678  	return ret;
15901aaefa1313 Steven Rostedt 2026-03-10  679  }
15901aaefa1313 Steven Rostedt 2026-03-10  680  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
