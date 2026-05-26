Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180FC3C3C0F
	for <oe-kbuild@lists.linux.dev>; Tue, 26 May 2026 22:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779835421; cv=none; b=VUzxRwONZ9c8ECNdqcY6Mm5SxdV6F75zH3nkRUHfM4Qsn9jKceT2eyI3rGmIJBs3+vSpbdbirfMsaepEm5lsVkC3yLLQ6SOVMvaYEqWMHp4TNCyEaTKq6CV3cAcVxh0j1U+Y1NTEqZfsaCO19spM+8TK3OoMbVjmIPGAkK+4oWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779835421; c=relaxed/simple;
	bh=Oj8vT0OfYn8C+/b4choPrOWuCgVkfRYnddlSYIYoY9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lN/GlmJh2O6+JfgFF5touPI366OGZ71fT0l01PvKiYGwS3H7cRk05tDM7QUTX/kMsZkA9MJ4eo7xJQytCa9IW2hfiNv74PEyGUlUY6sXxlHHccUfm5NU6+hybEfDMTIH4s2SFq7nEiXgsT38pH1MRF+pd8MqDGD2qAWOrR5e7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzdELumn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzdELumn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779835419; x=1811371419;
  h=date:from:to:cc:subject:message-id;
  bh=Oj8vT0OfYn8C+/b4choPrOWuCgVkfRYnddlSYIYoY9I=;
  b=PzdELumnUFVrqDOob6ZAX5Y6TypKlEUJ2RJl32+jmBtWE4YXhfKdUQUO
   clpOEZMSiIBvELnpGyAndp5B4hufJFBNeEdOjEyJcOpWh3tEs46uT+wLR
   N6T6AJL7h+XMEGv+8D8bEOUDY/2UEO6JtcOgt0TYsYJJXjYrG7/4/th7r
   KKEigS5fNButV+oGoFRa9PEPoCj9Z/UnRqTayaL1l2isRd+s/DTTAf7cE
   38pC83iDc6++tmpVNKyYml1rXUHavltOyLEE7gQ6FjBbbGJtZ+ECTb1qA
   8iNsbhfd5vMUarGVXHfejFeZAcWa8zROOWpEgXTOYd6ImHpmP8diTf3Fd
   w==;
X-CSE-ConnectionGUID: 0p+S49WQQ0aX7baejaGSXQ==
X-CSE-MsgGUID: oGCTgKhYSdi/t/8Yg7ty2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79808842"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="79808842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 15:43:38 -0700
X-CSE-ConnectionGUID: tlT68PipT9q0WlVGyAvdRw==
X-CSE-MsgGUID: mS0SrDqWQ66e48gIDBLFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="239053239"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 May 2026 15:43:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS0Up-00000000CVl-1PWv;
	Tue, 26 May 2026 22:43:35 +0000
Date: Wed, 27 May 2026 00:43:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/verifier.c:17312:51: warning: format '%ld'
 expects argument of type 'long int', but argument 3 has type 'int'
Message-ID: <202605270018.HUv1AvAl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eduard Zingerman <eddyz87@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-move-live-registers-and-scc-printout-to-a-standalone-function/20260526-180053
head:   71a332b01f49d441d062c1af011313255cbce050
commit: 2ce56afff3fb6a40dc9dd6fa274faddf8f4cd661 bpf: report hot simulated callchains when 1M instructions limit is met
date:   13 hours ago
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260527/202605270018.HUv1AvAl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270018.HUv1AvAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605270018.HUv1AvAl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'print_callchain_entry':
>> kernel/bpf/verifier.c:17312:51: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
   17312 |                         verbose(env, "  subprog#%ld/%d", sub - env->subprog_info, insn_idx);
         |                                                 ~~^      ~~~~~~~~~~~~~~~~~~~~~~~
         |                                                   |          |
         |                                                   long int   int
         |                                                 %d
   kernel/bpf/verifier.c: In function 'disasm_subprog':
   kernel/bpf/verifier.c:17328:41: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
   17328 |                 verbose(env, "subprog#%ld:\n", sub - env->subprog_info);
         |                                       ~~^      ~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |          |
         |                                         long int   int
         |                                       %d


vim +17312 kernel/bpf/verifier.c

2ce56afff3fb6a Eduard Zingerman 2026-05-26  17294  
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17295  static void print_callchain_entry(struct bpf_verifier_env *env,
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17296  				  struct bpf_callchain_entry *entry, int idx)
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17297  {
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17298  	struct bpf_callchain *cc = &entry->cc;
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17299  	const struct bpf_line_info *linfo;
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17300  	struct bpf_subprog_info *sub;
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17301  	int i, insn_idx;
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17302  
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17303  	verbose(env, "#%d most visited simulated stacktrace (visited %llu times):\n",
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17304  		idx, entry->count);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17305  	for (i = 0; i <= cc->curframe; i++) {
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17306  		insn_idx = cc->insn_idx[i];
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17307  		sub = bpf_find_containing_subprog(env, insn_idx);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17308  		linfo = bpf_find_linfo(env->prog, insn_idx);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17309  		if (sub->name)
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17310  			verbose(env, "  %s/%d", sub->name, insn_idx);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17311  		else
2ce56afff3fb6a Eduard Zingerman 2026-05-26 @17312  			verbose(env, "  subprog#%ld/%d", sub - env->subprog_info, insn_idx);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17313  		if (linfo)
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17314  			verbose(env, " (%s:%u)",
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17315  				btf_name_by_offset(env->prog->aux->btf, linfo->file_name_off),
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17316  				BPF_LINE_INFO_LINE_NUM(linfo->line_col));
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17317  		verbose(env, "\n");
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17318  	}
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17319  }
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17320  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
