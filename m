Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500C31F3FE2
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762499930; cv=none; b=KRUe0Ft2ptbt4/TCi0QvDYkor2hPlCfCgtiROgyqh/tXsz7KyqHbwuZLkO10x3fjaTKNRrISh3qQ4+DQ8CbrVJ57BAXQLWxISUAGgwefVA65d5TX48L30/RHplcMDooImgHYQcGkvYyMV9arBwgQfFiOzQhdR59tWkc9ZkUX1p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762499930; c=relaxed/simple;
	bh=D5/dCptSjKP16GzqBkpfMqjSh7KIOUzL8wjo1pEE52Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8QkGIh648sEKKtkBxc7Ehn++Jv0XXwN5cOq+Lua8+nyg3T+bGq+E72tp6WXcVkiD5VKPt7zLMxSIWFARJ01EeLME/X0BPY1UNm8oPmLdscDMt4WA7gOUFIkoIhOvTlxCfqW+6MKOU0fJ8cS8sQRdarYPrmDApv+YvBi3Ah5DiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxcSf6uq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxcSf6uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762499928; x=1794035928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D5/dCptSjKP16GzqBkpfMqjSh7KIOUzL8wjo1pEE52Y=;
  b=QxcSf6uqrvEUpI1GUBTu8waTOrdj2WeaoRvmkQiCZsOr8N5B2Z6pdCPg
   k27LG8w4zPTSoUPk+fTg/iMPxjV57HFvdhG9nRFH52S8TW5TdL5M/VTyp
   qt6F1XrTA6JztmpnyJ4kB9dawtERQHnoAVKPgSgEpFEH5qX9nR3s+sfVj
   CEpLEYLdxdhteBNJ5QnJ23t4AM90hIt7ootxFK11OLPREaqHLuKRxSXFY
   PLjbWIDqavkcYham4EpuOXDeG2MHvVvCQzJZVpas+oSYjvfnfe+Ni+7pA
   6SFKePY6f5yHh1OhBDVet/Jw7kGYFP6huKzFEsZfLfc8EBPnNh0E+QHyd
   Q==;
X-CSE-ConnectionGUID: mRydMxHOSjKXO4mf35dttw==
X-CSE-MsgGUID: AF01cABUS5SGIzxHXOwAIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64574031"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64574031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 23:18:47 -0800
X-CSE-ConnectionGUID: DzxOQ+JISfai/bMz2AiFow==
X-CSE-MsgGUID: w0lzZzjtRIaz0DNcvPJqHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="193006325"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2025 23:18:45 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHGk7-000Upc-1X;
	Fri, 07 Nov 2025 07:18:43 +0000
Date: Fri, 7 Nov 2025 15:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/5] tracing: Have tracer option be instance specific
Message-ID: <202511071533.domGENBS-lkp@intel.com>
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
In-Reply-To: <20251105161935.545400234@kernel.org>
References: <20251105161935.545400234@kernel.org>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: linux-kernel@vger.kernel.org
TO: linux-trace-kernel@vger.kernel.org
CC: Masami Hiramatsu <mhiramat@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[cannot apply to linus/master v6.18-rc4 next-20251107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Remove-dummy-options-and-flags/20251106-010511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20251105161935.545400234%40kernel.org
patch subject: [PATCH 3/5] tracing: Have tracer option be instance specific
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r072-20251107 (https://download.01.org/0day-ci/archive/20251107/202511071533.domGENBS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511071533.domGENBS-lkp@intel.com/

smatch warnings:
kernel/trace/trace.c:6313 tracing_set_tracer() warn: iterator used outside loop: 't'

vim +/t +6313 kernel/trace/trace.c

ef9188bcc6ca1d8 Mark-PK Tsai             2022-04-26  6284  
9c5b9d3d65e4858 Masami Hiramatsu         2020-01-11  6285  int tracing_set_tracer(struct trace_array *tr, const char *buf)
09d23a1d8a82e81 Steven Rostedt (Red Hat  2015-02-03  6286) {
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6287  	struct tracer *trace;
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6288  	struct tracers *t;
12883efb670c28d Steven Rostedt (Red Hat  2013-03-05  6289) #ifdef CONFIG_TRACER_MAX_TRACE
34600f0e9c33c9c Steven Rostedt           2013-01-22  6290  	bool had_max_tr;
12883efb670c28d Steven Rostedt (Red Hat  2013-03-05  6291) #endif
d33b10c0c73adca Steven Rostedt           2024-12-24  6292  	int ret;
bc0c38d139ec7fc Steven Rostedt           2008-05-12  6293  
d33b10c0c73adca Steven Rostedt           2024-12-24  6294  	guard(mutex)(&trace_types_lock);
1027fcb206a0fb8 Steven Rostedt           2009-03-12  6295  
7a1d1e4b9639ff0 Steven Rostedt (Google   2024-06-12  6296) 	update_last_data(tr);
7a1d1e4b9639ff0 Steven Rostedt (Google   2024-06-12  6297) 
a1f157c7a3bb342 Zheng Yejian             2023-09-06  6298  	if (!tr->ring_buffer_expanded) {
2b6080f28c7cc3e Steven Rostedt           2012-05-11  6299  		ret = __tracing_resize_ring_buffer(tr, trace_buf_size,
438ced1720b5840 Vaibhav Nagarnaik        2012-02-02  6300  						RING_BUFFER_ALL_CPUS);
73c5162aa362a54 Steven Rostedt           2009-03-11  6301  		if (ret < 0)
d33b10c0c73adca Steven Rostedt           2024-12-24  6302  			return ret;
73c5162aa362a54 Steven Rostedt           2009-03-11  6303  		ret = 0;
73c5162aa362a54 Steven Rostedt           2009-03-11  6304  	}
73c5162aa362a54 Steven Rostedt           2009-03-11  6305  
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6306  	list_for_each_entry(t, &tr->tracers, list) {
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6307  		if (strcmp(t->tracer->name, buf) == 0)
bc0c38d139ec7fc Steven Rostedt           2008-05-12  6308  			break;
bc0c38d139ec7fc Steven Rostedt           2008-05-12  6309  	}
d33b10c0c73adca Steven Rostedt           2024-12-24  6310  	if (!t)
d33b10c0c73adca Steven Rostedt           2024-12-24  6311  		return -EINVAL;
d33b10c0c73adca Steven Rostedt           2024-12-24  6312  
4699bbb369ba1d3 Steven Rostedt           2025-11-05 @6313  	if (t->tracer == tr->current_trace)
d33b10c0c73adca Steven Rostedt           2024-12-24  6314  		return 0;
bc0c38d139ec7fc Steven Rostedt           2008-05-12  6315  
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6316  	trace = t->tracer;
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
