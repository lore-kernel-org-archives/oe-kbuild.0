Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8895CDF1
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jan 2025 20:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736886886; cv=none; b=GfdZmbUAO5YNlIcrgqXj1hOZSorXdwQ25kcq6ARCVIrsUuE6zAEy8A0uLS7C6i9yi4o1T/jqY5bwWm6dPgazxRK5fQvBLYGunbrAP4/hG5fiRbHB6PFqLMnGJ6n76lIZhOR+0J55SMJfQHismJe/YOiuzj7/7bQ2tu2oknT2PLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736886886; c=relaxed/simple;
	bh=JuydQg8gGCHpvjWtg/nqcNj5IkvpkGFQwiSWeL/nklY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HkbCOTHFTeYGfQo8PxfWUaK4ZsZEBIM9qQlEh8q8UTuq/Jo6ikElFDmVAlMxHJcPiyViiT2+On+HRtcJclkO8lOSIeVW1FkyMw7RRyTQqo4kvzQQ6yQFfUp3tjqSsmgOGDss9/8mzq+ajGnQ6wgfSr83hyBUWOnYDgnr35cyMTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsJ/g6wd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsJ/g6wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736886884; x=1768422884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JuydQg8gGCHpvjWtg/nqcNj5IkvpkGFQwiSWeL/nklY=;
  b=RsJ/g6wdnB5eN4HWn2uT9516IGPWoF2Ll0qZNGKGtFCAiGMTBSgUVjuS
   SrR5x3b/8ej/Y3BBOi6D0JTrekVN4piISyiMFJnPZERiTs60H1B/IGcR/
   5xcVE1T8MTxbFfLbWxy6mLbvZVi3f9+TADObe1f+dve0xYMllLAqARJLv
   /1knfHtKT90FujyLbskI79zIkUyzU+8dYRpDGUY6HLk2ng0wRJhlje/4r
   ttqdmXmmMhl1ESzeViKIGIVq5DUOTg/gJCwtXN3PjRBbA7zutxhbjDwiq
   qudSjs5DgomlAU6LHgk+/hpXi5OZoRZcFUgDCkMT+xqwbIZRnM3iRgqqH
   g==;
X-CSE-ConnectionGUID: JBPpg8NgTxOzLsIn59tyTA==
X-CSE-MsgGUID: Z4onPxmqR12o2HaCQSBmbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48588829"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="48588829"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 12:34:44 -0800
X-CSE-ConnectionGUID: HoEl+rAdQwmS5VAy6xwh0Q==
X-CSE-MsgGUID: Ud9BGIjXR8yvlOWqawDadw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108975636"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jan 2025 12:34:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXncV-000P11-2s;
	Tue, 14 Jan 2025 20:34:39 +0000
Date: Wed, 15 Jan 2025 04:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ftrace: Implement :mod: cache filtering on kernel
 command line
Message-ID: <202501150434.2MjHjPP5-lkp@intel.com>
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
In-Reply-To: <20250109174639.32e6f43a@gandalf.local.home>
References: <20250109174639.32e6f43a@gandalf.local.home>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: LKML <linux-kernel@vger.kernel.org>
TO: Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: jochensp@jochen.sprickerhof.de

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc7 next-20250114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ftrace-Implement-mod-cache-filtering-on-kernel-command-line/20250110-064649
base:   linus/master
patch link:    https://lore.kernel.org/r/20250109174639.32e6f43a%40gandalf.local.home
patch subject: [PATCH] ftrace: Implement :mod: cache filtering on kernel command line
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r071-20250114 (https://download.01.org/0day-ci/archive/20250115/202501150434.2MjHjPP5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501150434.2MjHjPP5-lkp@intel.com/

smatch warnings:
kernel/trace/ftrace.c:6246 ftrace_set_regex() error: uninitialized symbol 'mod'.

vim +/mod +6246 kernel/trace/ftrace.c

d032ae8921ea79 Joel Fernandes   2016-11-15  6219  
647664eaf40335 Masami Hiramatsu 2012-06-05  6220  static int
647664eaf40335 Masami Hiramatsu 2012-06-05  6221  ftrace_set_regex(struct ftrace_ops *ops, unsigned char *buf, int len,
647664eaf40335 Masami Hiramatsu 2012-06-05  6222  		 int reset, int enable)
647664eaf40335 Masami Hiramatsu 2012-06-05  6223  {
f211b937514063 Steven Rostedt   2025-01-09  6224  	char *mod, *func, *command, *next = buf;
f211b937514063 Steven Rostedt   2025-01-09  6225  	char *tmp __free(kfree) = NULL;
f211b937514063 Steven Rostedt   2025-01-09  6226  	struct trace_array *tr = ops->private;
f211b937514063 Steven Rostedt   2025-01-09  6227  	int ret;
f211b937514063 Steven Rostedt   2025-01-09  6228  
f211b937514063 Steven Rostedt   2025-01-09  6229  	func = strsep(&next, ":");
f211b937514063 Steven Rostedt   2025-01-09  6230  
f211b937514063 Steven Rostedt   2025-01-09  6231  	/* This can also handle :mod: parsing */
f211b937514063 Steven Rostedt   2025-01-09  6232  	if (next) {
f211b937514063 Steven Rostedt   2025-01-09  6233  		if (!tr)
f211b937514063 Steven Rostedt   2025-01-09  6234  			return -EINVAL;
f211b937514063 Steven Rostedt   2025-01-09  6235  
f211b937514063 Steven Rostedt   2025-01-09  6236  		command = strsep(&next, ":");
f211b937514063 Steven Rostedt   2025-01-09  6237  		if (strcmp(command, "mod") != 0)
f211b937514063 Steven Rostedt   2025-01-09  6238  			return -EINVAL;
f211b937514063 Steven Rostedt   2025-01-09  6239  
f211b937514063 Steven Rostedt   2025-01-09  6240  		mod = next;
f211b937514063 Steven Rostedt   2025-01-09  6241  		len = command - func;
f211b937514063 Steven Rostedt   2025-01-09  6242  		/* Save the original func as ftrace_set_hash() can modify it */
f211b937514063 Steven Rostedt   2025-01-09  6243  		tmp = kstrdup(func, GFP_KERNEL);
f211b937514063 Steven Rostedt   2025-01-09  6244  	}
f211b937514063 Steven Rostedt   2025-01-09  6245  
f211b937514063 Steven Rostedt   2025-01-09 @6246  	ret = ftrace_set_hash(ops, func, len, NULL, 0, 0, reset, enable, mod);
f211b937514063 Steven Rostedt   2025-01-09  6247  
f211b937514063 Steven Rostedt   2025-01-09  6248  	if (tr && mod && ret < 0) {
f211b937514063 Steven Rostedt   2025-01-09  6249  		/* Did tmp fail to allocate? */
f211b937514063 Steven Rostedt   2025-01-09  6250  		if (!tmp)
f211b937514063 Steven Rostedt   2025-01-09  6251  			return -ENOMEM;
f211b937514063 Steven Rostedt   2025-01-09  6252  		ret = cache_mod(tr, tmp, mod, enable);
f211b937514063 Steven Rostedt   2025-01-09  6253  	}
f211b937514063 Steven Rostedt   2025-01-09  6254  
f211b937514063 Steven Rostedt   2025-01-09  6255  	return ret;
647664eaf40335 Masami Hiramatsu 2012-06-05  6256  }
647664eaf40335 Masami Hiramatsu 2012-06-05  6257  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
