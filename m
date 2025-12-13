Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC2E555
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 00:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586030; cv=none; b=oD5u8nn1WdKjIKJovEh8CFTXbrxOQT1xibXZRmFOI1Ao8LWFNkM0ewu6q4lRuftU82mEJ9dsz8muNkd4jWM8N8xsXWxD6yG7YVbTbs0wpd5C6/w8K/bq0or+9Jh+dixzcj/NqQ9OmSPiw2qtqpVAqi/1rTtLAS7LUqyhq4JRL6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586030; c=relaxed/simple;
	bh=NmjIMCmXTwodzHKjv+U4eP/EpAuiGCKtuMxZvlOGJlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hc9dVH+HEcpWv9HvJjCTX0r3tWVL1TvOWwUuizF2d6+xAtrRstZwZxXm9y0D40Q/OEJPHxvQEc9aqHcVCcACqgauusSE57kTKtv3ZNmfo23loQcCxwaAPljeJxp5VzMgfZ++B3bkLPRb9We31Hxn2nn2vwc02qFJF/L4MnInfDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9KZRD9t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9KZRD9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765586028; x=1797122028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NmjIMCmXTwodzHKjv+U4eP/EpAuiGCKtuMxZvlOGJlI=;
  b=l9KZRD9tlz1oCV4BKiP8YaveJEP+uskda7fQE49Mc8uB8uUeHmOxPpyb
   +8Wxcb2unjjJ601cWVemRwtbB3GJAWY6PXNZKDGGRnNKMtLxc9bfwxi44
   vEfTWiTFhcV/EcvdAcgHZ3mJyTx3PVjN6y+hKb5supZJ9wQVV0zOjE86t
   dIcOaWhYKIDBk8M4j0DZ/tH4/5E0b7npDsovVLhEVG+4sKomNjBsKS2I1
   t79xUPmwagcOMt4YfLwKhVWH3gZEb9Je7zZ0N7ugSxFderbyEZYPvbu9x
   9RY03e06ASp/e1JsS4IMGdI20mDqSmGEdYgn9u0bSd/PfAKxRNTaR2q3z
   w==;
X-CSE-ConnectionGUID: xLFnfBAqT/W5wl+9hwb10A==
X-CSE-MsgGUID: Lu6cW/m6SdyFsXaQppQQTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66581153"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66581153"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:33:45 -0800
X-CSE-ConnectionGUID: LXoPqPt5RYCqk0vJ8pWStQ==
X-CSE-MsgGUID: Eb4zM7oTSW+fuuoIgehA5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197718303"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 16:33:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUDZt-000000006pn-1gxB;
	Sat, 13 Dec 2025 00:33:41 +0000
Date: Sat, 13 Dec 2025 08:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/trace_functions_graph.c:950 print_graph_entry_nested()
 warn: bitwise AND condition is false here
Message-ID: <202512130854.MZP1H6wu-lkp@intel.com>
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
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm64-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130854.MZP1H6wu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130854.MZP1H6wu-lkp@intel.com/

smatch warnings:
kernel/trace/trace_functions_graph.c:950 print_graph_entry_nested() warn: bitwise AND condition is false here

vim +950 kernel/trace/trace_functions_graph.c

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
