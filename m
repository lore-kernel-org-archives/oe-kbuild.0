Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FC92417C6
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 02:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765592093; cv=none; b=gyyVw2YfgqVrgpDrNjleSoWp4eEG0J8CPN1WNM4pj52ZhpEeNAr0TsJjwCCVradeTPNlj2Uf/u+OiIGXRlDM9/C8aStHzjcJn1voSWV9QHkJlwH9sxEnXMsB/+OQjKtel/irKeO4EafZQPUvmhDah41RpCyrI1mfaCH5QBkt5aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765592093; c=relaxed/simple;
	bh=NDnkPEdDXXbQ2qoW7FodXEILw9NcaBfHg0FcTk0l1+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TV01rCWbgsUQpSe6madyaF7sjnmua4vRqXhTCJzW3s3Yl97qX6er50JmW5HSKH9DqcaaTpwtY8zNzgQ64gdjxd+fAKFTvA8NdrxciQKCdkNQcAnm2Y5yIeewrgr/DpSy3WoZgB962tbzuRRJ9/lyynDZofcbNG+qi8XJpfCOiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHFQ/aZA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHFQ/aZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765592091; x=1797128091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDnkPEdDXXbQ2qoW7FodXEILw9NcaBfHg0FcTk0l1+4=;
  b=UHFQ/aZA99/BjGXSgg8LgMhMCwAK8v6pfsi7V0qlhvyHvytP4Tl2iAp0
   ASzHtzSYuaawHOVlIRoNVM7Wr2sOHjWEgEKp7iR4+Sj7Tm9K39+/ITFSf
   hmCbhF1PKgm8XAF8Ri5W7gtprRHyFwS8a5m73SWpffj6Rlmc3VTFdmQfF
   8CpZp/5vLIUFBloashXHYp/85CpNiyzHkVFw0x/IjtUpu4Qu7vpKRQher
   VSlKBr5AsBQilB3HuVmPn0sipB/4w47Ww9j4KNH5OwsQGRB+w2wmBPPc8
   G4DOUJxKyFuqUR/II68KClUEg5Jtw+4/d62y5DyPfta/pIJKiXh8wtiTN
   A==;
X-CSE-ConnectionGUID: v75GK+wVQ9aUy3ZUFY9Zig==
X-CSE-MsgGUID: UimQ2q9jR+iMy0oYuJzc+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67751893"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67751893"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:14:50 -0800
X-CSE-ConnectionGUID: evQ7ax2QR3KRHd7ZpLvlOA==
X-CSE-MsgGUID: Zl/D3xXKQqCKiqWOzY4hsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201649005"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 18:14:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUF9i-000000006vH-3B66;
	Sat, 13 Dec 2025 02:14:46 +0000
Date: Sat, 13 Dec 2025 10:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/trace_functions_graph.c:902 print_graph_entry_leaf()
 warn: bitwise AND condition is false here
Message-ID: <202512131021.IPSFvKWt-lkp@intel.com>
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
TO: Donglin Peng <pengdonglin@xiaomi.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 21e92806d39c68af2accd1fb238c2daecfcf9fbd function_graph: Support recording and printing the function return address
date:   1 year, 2 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 2 months ago
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131021.IPSFvKWt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131021.IPSFvKWt-lkp@intel.com/

smatch warnings:
kernel/trace/trace_functions_graph.c:902 print_graph_entry_leaf() warn: bitwise AND condition is false here

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
