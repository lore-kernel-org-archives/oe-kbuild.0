Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A12F24
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jun 2023 23:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687910069; x=1719446069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlAOHlevmsx6k9rdo/5CRRDzNdTrEoOv9uIgFxgoyJw=;
  b=SzE0Mqdfewo6ht+JA398LSuvj2N9xxM8pGKb+JjbNNzPFgHs7UTzOZnj
   esSV/ib4Aju88/JNvJYXleFA1KHIakLCjWTCWOGD6nJTmyCaaV0o9f9+W
   jPZXBepjCjLlJT8Vz/dQxgxDtjHae88MNkDbKXdeFtqy8Cf9BRB8av/Ya
   uB9nWGv7WVnj+zN/6+zRUj+AG/hZY/JwHsSfz7dwgVw2KyDfVIOaZbDdc
   wc2pJDLZ0ZWVbeTmNAd0rtpR11LkcD8kJYRhAyAkiUVCnvkhesBxV8SFI
   Ouf0nRib0OGJwnmYoFQ9x8vfxRErLOmWyRxeRc0/CygE62bTrUFVB98Jg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361751963"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="361751963"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="806679746"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="806679746"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2023 16:54:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEIVu-000CMY-0S;
	Tue, 27 Jun 2023 23:54:26 +0000
Date: Wed, 28 Jun 2023 07:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10892/12601]
 kernel/trace/trace_functions_graph.c:726 print_graph_entry_leaf() warn:
 bitwise AND condition is false here
Message-ID: <202306280720.tfcHZJtR-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Donglin Peng <pengdonglin@sangfor.com.cn>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   53cdf865f90ba922a854c65ed05b519f9d728424
commit: a1be9ccc57f07d54278be34eed6bd679bc941c97 [10892/12601] function_graph: Support recording and printing the return value of function
:::::: branch date: 17 hours ago
:::::: commit date: 7 days ago
config: arm-randconfig-m041-20230627 (https://download.01.org/0day-ci/archive/20230628/202306280720.tfcHZJtR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280720.tfcHZJtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306280720.tfcHZJtR-lkp@intel.com/

smatch warnings:
kernel/trace/trace_functions_graph.c:726 print_graph_entry_leaf() warn: bitwise AND condition is false here
kernel/trace/trace_functions_graph.c:1012 print_graph_return() warn: bitwise AND condition is false here

vim +726 kernel/trace/trace_functions_graph.c

a1be9ccc57f07d5 Donglin Peng             2023-04-08  677  
83a8df618eb04bd Frederic Weisbecker      2008-11-27  678  /* Case of a leaf function on its call entry */
287b6e68ca7209c Frederic Weisbecker      2008-11-26  679  static enum print_line_t
83a8df618eb04bd Frederic Weisbecker      2008-11-27  680  print_graph_entry_leaf(struct trace_iterator *iter,
b91facc367366b3 Frederic Weisbecker      2009-02-06  681  		struct ftrace_graph_ent_entry *entry,
d7a8d9e907cc294 Jiri Olsa                2010-04-02  682  		struct ftrace_graph_ret_entry *ret_entry,
d7a8d9e907cc294 Jiri Olsa                2010-04-02  683  		struct trace_seq *s, u32 flags)
fb52607afcd0629 Frederic Weisbecker      2008-11-25  684  {
2fbcdb35aca614f Steven Rostedt           2009-03-19  685  	struct fgraph_data *data = iter->private;
983f938ae695852 Steven Rostedt (Red Hat  2015-09-30  686) 	struct trace_array *tr = iter->tr;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  687  	struct ftrace_graph_ret *graph_ret;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  688  	struct ftrace_graph_ent *call;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  689  	unsigned long long duration;
1fe4293f4b8de75 Changbin Du              2018-01-31  690  	int cpu = iter->cpu;
1a056155edd458e Frederic Weisbecker      2008-11-28  691  	int i;
fb52607afcd0629 Frederic Weisbecker      2008-11-25  692  
83a8df618eb04bd Frederic Weisbecker      2008-11-27  693  	graph_ret = &ret_entry->ret;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  694  	call = &entry->graph_ent;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  695  	duration = graph_ret->rettime - graph_ret->calltime;
83a8df618eb04bd Frederic Weisbecker      2008-11-27  696  
2fbcdb35aca614f Steven Rostedt           2009-03-19  697  	if (data) {
f1c7f517a5dc23b Steven Rostedt           2010-02-26  698  		struct fgraph_cpu_data *cpu_data;
f1c7f517a5dc23b Steven Rostedt           2010-02-26  699  
f1c7f517a5dc23b Steven Rostedt           2010-02-26  700  		cpu_data = per_cpu_ptr(data->cpu_data, cpu);
2fbcdb35aca614f Steven Rostedt           2009-03-19  701  
2fbcdb35aca614f Steven Rostedt           2009-03-19  702  		/*
2fbcdb35aca614f Steven Rostedt           2009-03-19  703  		 * Comments display at + 1 to depth. Since
2fbcdb35aca614f Steven Rostedt           2009-03-19  704  		 * this is a leaf function, keep the comments
2fbcdb35aca614f Steven Rostedt           2009-03-19  705  		 * equal to this depth.
2fbcdb35aca614f Steven Rostedt           2009-03-19  706  		 */
f1c7f517a5dc23b Steven Rostedt           2010-02-26  707  		cpu_data->depth = call->depth - 1;
f1c7f517a5dc23b Steven Rostedt           2010-02-26  708  
f1c7f517a5dc23b Steven Rostedt           2010-02-26  709  		/* No need to keep this function around for this depth */
794de08a16cf1fc Steven Rostedt (Red Hat  2016-12-08  710) 		if (call->depth < FTRACE_RETFUNC_DEPTH &&
794de08a16cf1fc Steven Rostedt (Red Hat  2016-12-08  711) 		    !WARN_ON_ONCE(call->depth < 0))
f1c7f517a5dc23b Steven Rostedt           2010-02-26  712  			cpu_data->enter_funcs[call->depth] = 0;
2fbcdb35aca614f Steven Rostedt           2009-03-19  713  	}
2fbcdb35aca614f Steven Rostedt           2009-03-19  714  
ffeb80fc30acbf6 Jiri Olsa                2011-06-03  715  	/* Overhead and duration */
983f938ae695852 Steven Rostedt (Red Hat  2015-09-30  716) 	print_graph_duration(tr, duration, s, flags);
437f24fb897d409 Steven Rostedt           2008-11-26  717  
83a8df618eb04bd Frederic Weisbecker      2008-11-27  718  	/* Function */
9d9add34ec7b2cd Steven Rostedt (Red Hat  2014-11-12  719) 	for (i = 0; i < call->depth * TRACE_GRAPH_INDENT; i++)
9d9add34ec7b2cd Steven Rostedt (Red Hat  2014-11-12  720) 		trace_seq_putc(s, ' ');
287b6e68ca7209c Frederic Weisbecker      2008-11-26  721  
a1be9ccc57f07d5 Donglin Peng             2023-04-08  722  	/*
a1be9ccc57f07d5 Donglin Peng             2023-04-08  723  	 * Write out the function return value if the option function-retval is
a1be9ccc57f07d5 Donglin Peng             2023-04-08  724  	 * enabled.
a1be9ccc57f07d5 Donglin Peng             2023-04-08  725  	 */
a1be9ccc57f07d5 Donglin Peng             2023-04-08 @726  	if (flags & __TRACE_GRAPH_PRINT_RETVAL)
a1be9ccc57f07d5 Donglin Peng             2023-04-08  727  		print_graph_retval(s, graph_ret->retval, true, (void *)call->func,
a1be9ccc57f07d5 Donglin Peng             2023-04-08  728  				!!(flags & TRACE_GRAPH_PRINT_RETVAL_HEX));
a1be9ccc57f07d5 Donglin Peng             2023-04-08  729  	else
9d9add34ec7b2cd Steven Rostedt (Red Hat  2014-11-12  730) 		trace_seq_printf(s, "%ps();\n", (void *)call->func);
83a8df618eb04bd Frederic Weisbecker      2008-11-27  731  
1fe4293f4b8de75 Changbin Du              2018-01-31  732  	print_graph_irq(iter, graph_ret->func, TRACE_GRAPH_RET,
1fe4293f4b8de75 Changbin Du              2018-01-31  733  			cpu, iter->ent->pid, flags);
1fe4293f4b8de75 Changbin Du              2018-01-31  734  
9d9add34ec7b2cd Steven Rostedt (Red Hat  2014-11-12  735) 	return trace_handle_return(s);
83a8df618eb04bd Frederic Weisbecker      2008-11-27  736  }
83a8df618eb04bd Frederic Weisbecker      2008-11-27  737  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
