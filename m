Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FA6161326
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 02:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729046613; cv=none; b=dSsaE3jD9Cz1OVibtmfrrAm5A7m5HhNd7jJ9fuzVpRw81Ema/vZfDpZIJUkNYsYYJ0ju45huH8xY5QXVakcumdCwK9fPDzak6K3zagD986VCoq0P6mUeputKmBAN0BTpQGune2PnIY70obqTqc9o5rwWooHWn6for0Z6dDIfhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729046613; c=relaxed/simple;
	bh=+j3MpRLujkBuZ/UcNTtc9r6R3HEimxcQtObcZst+WyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FKPyAqOxCupLi7Mw4VbZYMIY4v6lxfTaKULtj5fhBP7h0jFdvN+TvGILy5lxdm+uxTuVdQVOJj1G6faChgctURwZiGw6NTrDFkS0AI714KhXr6qWhlAVVMLdmUKXp2E3MvSki61V7YoPy5+y6NZrEYEpt5bxKi3KayyVeS+do7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4Zg/o+b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4Zg/o+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729046612; x=1760582612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+j3MpRLujkBuZ/UcNTtc9r6R3HEimxcQtObcZst+WyM=;
  b=H4Zg/o+bvgaR416ws5zO5ErIkMS6nX6/m30qg4Lp0QmO0266ci+GkPna
   X9V96miLA4c/CDiwQp2VxG1BihQ5gxflCW4VONFducT9VxSz0r+dfX2iE
   Nz4/NUNGlvMd6T2uG1eqhEBB/BvVnKtptepFgVJliRhTyaj8cglnzLJ0e
   jnnofJ2hljyQjrNDkb0ASXU9kFwKjbyvfzB44iaHNUJk9if5FBU50Zraf
   O9B5SwbsoFt+2VaZfbkvzuKRMa69YsbInfYDO8jGdC99n+vTWIv8LxDbK
   RRWtw4pYt/f1vwCj+28ArKopWIVd2tCsWN80n0vNADtW7IiuuJgmTFF03
   w==;
X-CSE-ConnectionGUID: 1jhrzi5RTfSBKtKQT9Lq+A==
X-CSE-MsgGUID: zuT5IdlUSVar/NqjcO/klw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32168795"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32168795"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 19:43:29 -0700
X-CSE-ConnectionGUID: FJWbEdAPRbytLy6c1FnubA==
X-CSE-MsgGUID: DV5LQweWTlem0K3fgE9GLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="82063705"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2024 19:43:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0u0T-000KBR-0Q;
	Wed, 16 Oct 2024 02:43:25 +0000
Date: Wed, 16 Oct 2024 10:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [trace:ftrace/for-next 6/14]
 kernel/trace/trace_functions_graph.c:902 print_graph_entry_leaf() warn:
 bitwise AND condition is false here
Message-ID: <202410161057.D5G3l8BW-lkp@intel.com>
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
TO: Donglin Peng <pengdonglin@xiaomi.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ftrace/for-next
head:   2d17932da44fdc1ba835ad05110ab996d2912dbf
commit: 21e92806d39c68af2accd1fb238c2daecfcf9fbd [6/14] function_graph: Support recording and printing the function return address
:::::: branch date: 5 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-141-20241015 (https://download.01.org/0day-ci/archive/20241016/202410161057.D5G3l8BW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410161057.D5G3l8BW-lkp@intel.com/

smatch warnings:
kernel/trace/trace_functions_graph.c:902 print_graph_entry_leaf() warn: bitwise AND condition is false here
kernel/trace/trace_functions_graph.c:950 print_graph_entry_nested() warn: bitwise AND condition is false here

vim +902 kernel/trace/trace_functions_graph.c

a1be9ccc57f07d Donglin Peng             2023-04-08  851  
83a8df618eb04b Frederic Weisbecker      2008-11-27  852  /* Case of a leaf function on its call entry */
287b6e68ca7209 Frederic Weisbecker      2008-11-26  853  static enum print_line_t
83a8df618eb04b Frederic Weisbecker      2008-11-27  854  print_graph_entry_leaf(struct trace_iterator *iter,
b91facc367366b Frederic Weisbecker      2009-02-06  855  		struct ftrace_graph_ent_entry *entry,
d7a8d9e907cc29 Jiri Olsa                2010-04-02  856  		struct ftrace_graph_ret_entry *ret_entry,
d7a8d9e907cc29 Jiri Olsa                2010-04-02  857  		struct trace_seq *s, u32 flags)
fb52607afcd062 Frederic Weisbecker      2008-11-25  858  {
2fbcdb35aca614 Steven Rostedt           2009-03-19  859  	struct fgraph_data *data = iter->private;
983f938ae69585 Steven Rostedt (Red Hat  2015-09-30  860) 	struct trace_array *tr = iter->tr;
83a8df618eb04b Frederic Weisbecker      2008-11-27  861  	struct ftrace_graph_ret *graph_ret;
83a8df618eb04b Frederic Weisbecker      2008-11-27  862  	struct ftrace_graph_ent *call;
83a8df618eb04b Frederic Weisbecker      2008-11-27  863  	unsigned long long duration;
4c57d0be528b12 Steven Rostedt           2024-08-13  864  	unsigned long func;
1fe4293f4b8de7 Changbin Du              2018-01-31  865  	int cpu = iter->cpu;
1a056155edd458 Frederic Weisbecker      2008-11-28  866  	int i;
fb52607afcd062 Frederic Weisbecker      2008-11-25  867  
83a8df618eb04b Frederic Weisbecker      2008-11-27  868  	graph_ret = &ret_entry->ret;
83a8df618eb04b Frederic Weisbecker      2008-11-27  869  	call = &entry->graph_ent;
83a8df618eb04b Frederic Weisbecker      2008-11-27  870  	duration = graph_ret->rettime - graph_ret->calltime;
83a8df618eb04b Frederic Weisbecker      2008-11-27  871  
4c57d0be528b12 Steven Rostedt           2024-08-13  872  	func = call->func + iter->tr->text_delta;
4c57d0be528b12 Steven Rostedt           2024-08-13  873  
2fbcdb35aca614 Steven Rostedt           2009-03-19  874  	if (data) {
f1c7f517a5dc23 Steven Rostedt           2010-02-26  875  		struct fgraph_cpu_data *cpu_data;
f1c7f517a5dc23 Steven Rostedt           2010-02-26  876  
f1c7f517a5dc23 Steven Rostedt           2010-02-26  877  		cpu_data = per_cpu_ptr(data->cpu_data, cpu);
2fbcdb35aca614 Steven Rostedt           2009-03-19  878  
2fbcdb35aca614 Steven Rostedt           2009-03-19  879  		/*
2fbcdb35aca614 Steven Rostedt           2009-03-19  880  		 * Comments display at + 1 to depth. Since
2fbcdb35aca614 Steven Rostedt           2009-03-19  881  		 * this is a leaf function, keep the comments
2fbcdb35aca614 Steven Rostedt           2009-03-19  882  		 * equal to this depth.
2fbcdb35aca614 Steven Rostedt           2009-03-19  883  		 */
f1c7f517a5dc23 Steven Rostedt           2010-02-26  884  		cpu_data->depth = call->depth - 1;
f1c7f517a5dc23 Steven Rostedt           2010-02-26  885  
f1c7f517a5dc23 Steven Rostedt           2010-02-26  886  		/* No need to keep this function around for this depth */
794de08a16cf1f Steven Rostedt (Red Hat  2016-12-08  887) 		if (call->depth < FTRACE_RETFUNC_DEPTH &&
794de08a16cf1f Steven Rostedt (Red Hat  2016-12-08  888) 		    !WARN_ON_ONCE(call->depth < 0))
f1c7f517a5dc23 Steven Rostedt           2010-02-26  889  			cpu_data->enter_funcs[call->depth] = 0;
2fbcdb35aca614 Steven Rostedt           2009-03-19  890  	}
2fbcdb35aca614 Steven Rostedt           2009-03-19  891  
ffeb80fc30acbf Jiri Olsa                2011-06-03  892  	/* Overhead and duration */
983f938ae69585 Steven Rostedt (Red Hat  2015-09-30  893) 	print_graph_duration(tr, duration, s, flags);
437f24fb897d40 Steven Rostedt           2008-11-26  894  
83a8df618eb04b Frederic Weisbecker      2008-11-27  895  	/* Function */
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  896) 	for (i = 0; i < call->depth * TRACE_GRAPH_INDENT; i++)
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  897) 		trace_seq_putc(s, ' ');
287b6e68ca7209 Frederic Weisbecker      2008-11-26  898  
a1be9ccc57f07d Donglin Peng             2023-04-08  899  	/*
21e92806d39c68 Donglin Peng             2024-09-14  900  	 * Write out the function return value or return address
a1be9ccc57f07d Donglin Peng             2023-04-08  901  	 */
21e92806d39c68 Donglin Peng             2024-09-14 @902  	if (flags & (__TRACE_GRAPH_PRINT_RETVAL | __TRACE_GRAPH_PRINT_RETADDR)) {
21e92806d39c68 Donglin Peng             2024-09-14  903  		print_graph_retval(s, entry, graph_ret,
21e92806d39c68 Donglin Peng             2024-09-14  904  				   (void *)graph_ret->func + iter->tr->text_delta,
21e92806d39c68 Donglin Peng             2024-09-14  905  				   flags, tr->trace_flags);
21e92806d39c68 Donglin Peng             2024-09-14  906  	} else {
4c57d0be528b12 Steven Rostedt           2024-08-13  907  		trace_seq_printf(s, "%ps();\n", (void *)func);
21e92806d39c68 Donglin Peng             2024-09-14  908  	}
83a8df618eb04b Frederic Weisbecker      2008-11-27  909  
1fe4293f4b8de7 Changbin Du              2018-01-31  910  	print_graph_irq(iter, graph_ret->func, TRACE_GRAPH_RET,
1fe4293f4b8de7 Changbin Du              2018-01-31  911  			cpu, iter->ent->pid, flags);
1fe4293f4b8de7 Changbin Du              2018-01-31  912  
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  913) 	return trace_handle_return(s);
83a8df618eb04b Frederic Weisbecker      2008-11-27  914  }
83a8df618eb04b Frederic Weisbecker      2008-11-27  915  
83a8df618eb04b Frederic Weisbecker      2008-11-27  916  static enum print_line_t
2fbcdb35aca614 Steven Rostedt           2009-03-19  917  print_graph_entry_nested(struct trace_iterator *iter,
2fbcdb35aca614 Steven Rostedt           2009-03-19  918  			 struct ftrace_graph_ent_entry *entry,
d7a8d9e907cc29 Jiri Olsa                2010-04-02  919  			 struct trace_seq *s, int cpu, u32 flags)
83a8df618eb04b Frederic Weisbecker      2008-11-27  920  {
83a8df618eb04b Frederic Weisbecker      2008-11-27  921  	struct ftrace_graph_ent *call = &entry->graph_ent;
2fbcdb35aca614 Steven Rostedt           2009-03-19  922  	struct fgraph_data *data = iter->private;
983f938ae69585 Steven Rostedt (Red Hat  2015-09-30  923) 	struct trace_array *tr = iter->tr;
4c57d0be528b12 Steven Rostedt           2024-08-13  924  	unsigned long func;
2fbcdb35aca614 Steven Rostedt           2009-03-19  925  	int i;
2fbcdb35aca614 Steven Rostedt           2009-03-19  926  
2fbcdb35aca614 Steven Rostedt           2009-03-19  927  	if (data) {
f1c7f517a5dc23 Steven Rostedt           2010-02-26  928  		struct fgraph_cpu_data *cpu_data;
2fbcdb35aca614 Steven Rostedt           2009-03-19  929  		int cpu = iter->cpu;
2fbcdb35aca614 Steven Rostedt           2009-03-19  930  
f1c7f517a5dc23 Steven Rostedt           2010-02-26  931  		cpu_data = per_cpu_ptr(data->cpu_data, cpu);
f1c7f517a5dc23 Steven Rostedt           2010-02-26  932  		cpu_data->depth = call->depth;
f1c7f517a5dc23 Steven Rostedt           2010-02-26  933  
f1c7f517a5dc23 Steven Rostedt           2010-02-26  934  		/* Save this function pointer to see if the exit matches */
794de08a16cf1f Steven Rostedt (Red Hat  2016-12-08  935) 		if (call->depth < FTRACE_RETFUNC_DEPTH &&
794de08a16cf1f Steven Rostedt (Red Hat  2016-12-08  936) 		    !WARN_ON_ONCE(call->depth < 0))
f1c7f517a5dc23 Steven Rostedt           2010-02-26  937  			cpu_data->enter_funcs[call->depth] = call->func;
2fbcdb35aca614 Steven Rostedt           2009-03-19  938  	}
83a8df618eb04b Frederic Weisbecker      2008-11-27  939  
1a056155edd458 Frederic Weisbecker      2008-11-28  940  	/* No time */
983f938ae69585 Steven Rostedt (Red Hat  2015-09-30  941) 	print_graph_duration(tr, 0, s, flags | FLAGS_FILL_FULL);
f8b755ac8e0cc3 Frederic Weisbecker      2008-12-09  942  
83a8df618eb04b Frederic Weisbecker      2008-11-27  943  	/* Function */
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  944) 	for (i = 0; i < call->depth * TRACE_GRAPH_INDENT; i++)
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  945) 		trace_seq_putc(s, ' ');
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  946) 
4c57d0be528b12 Steven Rostedt           2024-08-13  947  	func = call->func + iter->tr->text_delta;
4c57d0be528b12 Steven Rostedt           2024-08-13  948  
21e92806d39c68 Donglin Peng             2024-09-14  949  	trace_seq_printf(s, "%ps() {", (void *)func);
21e92806d39c68 Donglin Peng             2024-09-14 @950  	if (flags & __TRACE_GRAPH_PRINT_RETADDR  &&
21e92806d39c68 Donglin Peng             2024-09-14  951  		entry->ent.type == TRACE_GRAPH_RETADDR_ENT)
21e92806d39c68 Donglin Peng             2024-09-14  952  		print_graph_retaddr(s, (struct fgraph_retaddr_ent_entry *)entry,
21e92806d39c68 Donglin Peng             2024-09-14  953  			tr->trace_flags, true);
21e92806d39c68 Donglin Peng             2024-09-14  954  	trace_seq_putc(s, '\n');
fb52607afcd062 Frederic Weisbecker      2008-11-25  955  
9d9add34ec7b2c Steven Rostedt (Red Hat  2014-11-12  956) 	if (trace_seq_has_overflowed(s))
83a8df618eb04b Frederic Weisbecker      2008-11-27  957  		return TRACE_TYPE_PARTIAL_LINE;
83a8df618eb04b Frederic Weisbecker      2008-11-27  958  
b91facc367366b Frederic Weisbecker      2009-02-06  959  	/*
b91facc367366b Frederic Weisbecker      2009-02-06  960  	 * we already consumed the current entry to check the next one
b91facc367366b Frederic Weisbecker      2009-02-06  961  	 * and see if this is a leaf.
b91facc367366b Frederic Weisbecker      2009-02-06  962  	 */
b91facc367366b Frederic Weisbecker      2009-02-06  963  	return TRACE_TYPE_NO_CONSUME;
287b6e68ca7209 Frederic Weisbecker      2008-11-26  964  }
fb52607afcd062 Frederic Weisbecker      2008-11-25  965  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
