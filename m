Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452780F
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Oct 2023 04:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbjLF4qC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698209690; x=1729745690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qCOdngeYO+YINSWMntyaDLzmSWcFYMTrKsgBvI3PE8Y=;
  b=TbjLF4qClMpNRVOggHhYDjBF226S0qYDGqsnnbmH58zgXXaWRfghk73T
   tXSSDVef9JI+IuVKUt/5he+wqFLpMJKVJu0oCYIykzE/rcVF+ZkEAml62
   2G+Imw5TfYGVtC6WR6DF3jphsApuEx4FZZt4LHFS0l5xDN5/SydmlF00Q
   46sFfF1lip//jaqdtxblKFUPadwEY3qlRVRaIO6Z/wJY+1Iyxe3DRk5aC
   DactiLijfAauV968JBSyfIzxUrSeDaG7ywqyy/9Jk03Iu141z7uENdODu
   lcLqMLhyccsMVbTN6sPUIHUTJQE1jCP3DoVsg/FvK/FRsUhN7GpAqdmR+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="391103945"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="391103945"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 21:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="735270500"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="735270500"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Oct 2023 21:54:48 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvVuo-0008cz-1g;
	Wed, 25 Oct 2023 04:54:46 +0000
Date: Wed, 25 Oct 2023 12:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/trace_functions_graph.c:726 print_graph_entry_leaf()
 warn: bitwise AND condition is false here
Message-ID: <202310251227.sj6QknQV-lkp@intel.com>
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
TO: Donglin Peng <pengdonglin@sangfor.com.cn>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4f82870119a46b0d04d91ef4697ac4977a255a9d
commit: a1be9ccc57f07d54278be34eed6bd679bc941c97 function_graph: Support recording and printing the return value of function
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20231025 (https://download.01.org/0day-ci/archive/20231025/202310251227.sj6QknQV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231025/202310251227.sj6QknQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310251227.sj6QknQV-lkp@intel.com/

smatch warnings:
kernel/trace/trace_functions_graph.c:726 print_graph_entry_leaf() warn: bitwise AND condition is false here
kernel/trace/trace_functions_graph.c:1012 print_graph_return() warn: bitwise AND condition is false here

vim +726 kernel/trace/trace_functions_graph.c

a1be9ccc57f07d Donglin Peng             2023-04-08  677  
83a8df618eb04b Frederic Weisbecker      2008-11-27  678  /* Case of a leaf function on its call entry */
287b6e68ca7209 Frederic Weisbecker      2008-11-26  679  static enum print_line_t
83a8df618eb04b Frederic Weisbecker      2008-11-27  680  print_graph_entry_leaf(struct trace_iterator *iter,
b91facc367366b Frederic Weisbecker      2009-02-06  681  		struct ftrace_graph_ent_entry *entry,
d7a8d9e907cc29 Jiri Olsa                2010-04-02  682  		struct ftrace_graph_ret_entry *ret_entry,
d7a8d9e907cc29 Jiri Olsa                2010-04-02  683  		struct trace_seq *s, u32 flags)
fb52607afcd062 Frederic Weisbecker      2008-11-25  684  {
2fbcdb35aca614 Steven Rostedt           2009-03-19  685  	struct fgraph_data *data = iter->private;
983f938ae69585 Steven Rostedt (Red Hat  2015-09-30  686) 	struct trace_array *tr = iter->tr;
83a8df618eb04b Frederic Weisbecker      2008-11-27  687  	struct ftrace_graph_ret *graph_ret;
83a8df618eb04b Frederic Weisbecker      2008-11-27  688  	struct ftrace_graph_ent *call;
83a8df618eb04b Frederic Weisbecker      2008-11-27  689  	unsigned long long duration;
1fe4293f4b8de7 Changbin Du              2018-01-31  690  	int cpu = iter->cpu;
1a056155edd458 Frederic Weisbecker      2008-11-28  691  	int i;
fb52607afcd062 Frederic Weisbecker      2008-11-25  692  
83a8df618eb04b Frederic Weisbecker      2008-11-27  693  	graph_ret = &ret_entry->ret;
83a8df618eb04b Frederic Weisbecker      2008-11-27  694  	call = &entry->graph_ent;
83a8df618eb04b Frederic Weisbecker      2008-11-27  695  	duration = graph_ret->rettime - graph_ret->calltime;
83a8df618eb04b Frederic Weisbecker      2008-11-27  696  
2fbcdb35aca614 Steven Rostedt           2009-03-19  697  	if (data) {
f1c7f517a5dc23 Steven Rostedt           2010-02-26  698  		struct fgraph_cpu_data *cpu_data;
f1c7f517a5dc23 Steven Rostedt           2010-02-26  699  
f1c7f517a5dc23 Steven Rostedt           2010-02-26  700  		cpu_data = per_cpu_ptr(data->cpu_data, cpu);
2fbcdb35aca614 Steven Rostedt           2009-03-19  701  
2fbcdb35aca614 Steven Rostedt           2009-03-19  702  		/*
2fbcdb35aca614 Steven Rostedt           2009-03-19  703  		 * Comments display at + 1 to depth. Since
2fbcdb35aca614 Steven Rostedt           2009-03-19  704  		 * this is a leaf function, keep the comments
2fbcdb35aca614 Steven Rostedt           2009-03-19  705  		 * equal to this depth.
2fbcdb35aca614 Steven Rostedt           2009-03-19  706  		 */
f1c7f517a5dc23 Steven Rostedt           2010-02-26  707  		cpu_data->depth = call->depth - 1;
f1c7f517a5dc23 Steven Rostedt           2010-02-26  708  
f1c7f517a5dc23 Steven Rostedt           2010-02-26  709  		/* No need to keep this function around for this depth */
794de08a16cf1f Steven Rostedt (Red Hat  2016-12-08  710) 		if (call->depth < FTRACE_RETFUNC_DEPTH &&
794de08a16cf1f Steven Rostedt (Red Hat  2016-12-08  711) 		    !WARN_ON_ONCE(call->depth < 0))
f1c7f517a5dc23 Steven Rostedt           2010-02-26  712  			cpu_data->enter_funcs[call->depth] = 0;
2fbcdb35aca614 Steven Rostedt           2009-03-19  713  	}
2fbcdb35aca614 Steven Rostedt           2009-03-19  714  
ffeb80fc30acbf Jiri Olsa                2011-06-03  715  	/* Overhead and duration */
983f938ae69585 Steven Rostedt (Red Hat  2015-09-30  716) 	print_graph_duration(tr, duration, s, flags);
437f24fb897d40 Steven Rostedt           2008-11-26  717  
83a8df618eb04b Frederic Weisbecker      2008-11-27  718  	/* Function */
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  719) 	for (i = 0; i < call->depth * TRACE_GRAPH_INDENT; i++)
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  720) 		trace_seq_putc(s, ' ');
287b6e68ca7209 Frederic Weisbecker      2008-11-26  721  
a1be9ccc57f07d Donglin Peng             2023-04-08  722  	/*
a1be9ccc57f07d Donglin Peng             2023-04-08  723  	 * Write out the function return value if the option function-retval is
a1be9ccc57f07d Donglin Peng             2023-04-08  724  	 * enabled.
a1be9ccc57f07d Donglin Peng             2023-04-08  725  	 */
a1be9ccc57f07d Donglin Peng             2023-04-08 @726  	if (flags & __TRACE_GRAPH_PRINT_RETVAL)
a1be9ccc57f07d Donglin Peng             2023-04-08  727  		print_graph_retval(s, graph_ret->retval, true, (void *)call->func,
a1be9ccc57f07d Donglin Peng             2023-04-08  728  				!!(flags & TRACE_GRAPH_PRINT_RETVAL_HEX));
a1be9ccc57f07d Donglin Peng             2023-04-08  729  	else
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  730) 		trace_seq_printf(s, "%ps();\n", (void *)call->func);
83a8df618eb04b Frederic Weisbecker      2008-11-27  731  
1fe4293f4b8de7 Changbin Du              2018-01-31  732  	print_graph_irq(iter, graph_ret->func, TRACE_GRAPH_RET,
1fe4293f4b8de7 Changbin Du              2018-01-31  733  			cpu, iter->ent->pid, flags);
1fe4293f4b8de7 Changbin Du              2018-01-31  734  
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  735) 	return trace_handle_return(s);
83a8df618eb04b Frederic Weisbecker      2008-11-27  736  }
83a8df618eb04b Frederic Weisbecker      2008-11-27  737  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
