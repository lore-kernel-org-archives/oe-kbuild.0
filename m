Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB387E556
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Jun 2024 05:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717910875; cv=none; b=JIClB18PkXf7ErnFGNm+3vdQr17c207l2Tz7WL6mY4cQxFqsyYIzt3oQo00RIx2eSr3uuGSsBVS4V7I5yqwjY0bBNQHMTgp5fhXKmbsNnoe4ymjktaLsy0cWduaNct/QfNwXLaGU2VI1xlVhLlVIfk/jErxR8i6LwMFZkLXPJoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717910875; c=relaxed/simple;
	bh=MgJOnflq29Pxc0oJ4fOgqoClAGXyxFKFBWGRecxiVVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YvKLGoOyniNxJX9rP0WlNepst1p9pK3wZphKzdTzf248hP1+Id7fNztxGPpunYpFCV5Z2qytfBOf73J/Itb/WD33a233ZK2QhFlbb0cMJsELQbZ2tTcXPfk6HF7qQxynOz2WyktM13A+HXcNbW5WuxSGzVvAXplpZbCXKc4i9NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGELaepG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGELaepG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717910874; x=1749446874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MgJOnflq29Pxc0oJ4fOgqoClAGXyxFKFBWGRecxiVVY=;
  b=BGELaepGTEyWLSz4NEvrmHCDKBMkIjD5eRgdaBWnFNL1n/t1sqDQnNCl
   aG67I1aOSDijolELEDfNNug044pyi+oUJM4VyVMiWLDu1gZ8X9riWVkV2
   urZHlueu/B3NBR0f3x+C/0tabKCjs+VFvFiTBvXZnQEt/NPf7NpwL+RZ1
   q9ngWIa11PFJnNdDq5Zef0B1g5GnChGC+gmGGDVHvoGfnE4ZHNhpHT7xl
   YMdbGfJWbPQp6p/YMsfv7vo9avI1OGcsPpjBVwzIYr3FUQLKvIMnYxLSR
   f8/IM0OSd3wUYRBKEP9Mb0wtNfOIp3nmgw66FBKw8CaJYWsnCJFHQp4Hk
   w==;
X-CSE-ConnectionGUID: 8V4fvS/yTLekb0sZ0o5+Ig==
X-CSE-MsgGUID: NF2+tJuVR4iubhHDhBblng==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="25168226"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="25168226"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 22:27:54 -0700
X-CSE-ConnectionGUID: kzpr3pGFQAiFRrvPMVPj4Q==
X-CSE-MsgGUID: sBe+QqxNQY+JOeBK7cAJxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="38667065"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jun 2024 22:27:52 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGB5p-0000sY-2k;
	Sun, 09 Jun 2024 05:27:49 +0000
Date: Sun, 9 Jun 2024 13:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 1/4] tracing: add __print_sym() to replace
 __print_symbolic()
Message-ID: <202406091325.geCfGiQ5-lkp@intel.com>
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
In-Reply-To: <20240607160527.23624-7-johannes@sipsolutions.net>
References: <20240607160527.23624-7-johannes@sipsolutions.net>
TO: Johannes Berg <johannes@sipsolutions.net>
TO: linux-kernel@vger.kernel.org
CC: linux-trace-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: linux-wireless@vger.kernel.org
CC: Johannes Berg <johannes.berg@intel.com>

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on arnd-asm-generic/master tip/timers/core net/main net-next/main linus/master horms-ipvs/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/tracing-add-__print_sym-to-replace-__print_symbolic/20240608-000918
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20240607160527.23624-7-johannes%40sipsolutions.net
patch subject: [PATCH v4 1/4] tracing: add __print_sym() to replace __print_symbolic()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-r071-20240609 (https://download.01.org/0day-ci/archive/20240609/202406091325.geCfGiQ5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406091325.geCfGiQ5-lkp@intel.com/

smatch warnings:
kernel/trace/trace_events.c:1595 show_sym_list() error: uninitialized symbol 'n_sym_defs'.
kernel/trace/trace_events.c:1598 show_sym_list() error: uninitialized symbol 'sym_defs'.

vim +/n_sym_defs +1595 kernel/trace/trace_events.c

58efca9067642c Johannes Berg 2024-06-07  1575  
58efca9067642c Johannes Berg 2024-06-07  1576  /* note: @name is not NUL-terminated */
58efca9067642c Johannes Berg 2024-06-07  1577  static void show_sym_list(struct seq_file *m, struct trace_event_call *call,
58efca9067642c Johannes Berg 2024-06-07  1578  			  const char *name, unsigned int name_len)
58efca9067642c Johannes Berg 2024-06-07  1579  {
58efca9067642c Johannes Berg 2024-06-07  1580  	struct trace_sym_def **sym_defs;
58efca9067642c Johannes Berg 2024-06-07  1581  	unsigned int n_sym_defs, i;
58efca9067642c Johannes Berg 2024-06-07  1582  
58efca9067642c Johannes Berg 2024-06-07  1583  	if ((call->flags & TRACE_EVENT_FL_DYNAMIC) || !call->module) {
58efca9067642c Johannes Berg 2024-06-07  1584  		sym_defs = __start_ftrace_sym_defs;
58efca9067642c Johannes Berg 2024-06-07  1585  		n_sym_defs = __stop_ftrace_sym_defs - __start_ftrace_sym_defs;
58efca9067642c Johannes Berg 2024-06-07  1586  #ifdef CONFIG_MODULES
58efca9067642c Johannes Berg 2024-06-07  1587  	} else {
58efca9067642c Johannes Berg 2024-06-07  1588  		struct module *mod = call->module;
58efca9067642c Johannes Berg 2024-06-07  1589  
58efca9067642c Johannes Berg 2024-06-07  1590  		sym_defs = mod->trace_sym_defs;
58efca9067642c Johannes Berg 2024-06-07  1591  		n_sym_defs = mod->num_trace_sym_defs;
58efca9067642c Johannes Berg 2024-06-07  1592  #endif /* CONFIG_MODULES */
58efca9067642c Johannes Berg 2024-06-07  1593  	}
58efca9067642c Johannes Berg 2024-06-07  1594  
58efca9067642c Johannes Berg 2024-06-07 @1595  	for (i = 0; i < n_sym_defs; i++) {
58efca9067642c Johannes Berg 2024-06-07  1596  		unsigned int sym_len;
58efca9067642c Johannes Berg 2024-06-07  1597  
58efca9067642c Johannes Berg 2024-06-07 @1598  		if (!sym_defs[i])
58efca9067642c Johannes Berg 2024-06-07  1599  			continue;
58efca9067642c Johannes Berg 2024-06-07  1600  		if (sym_defs[i]->system != call->class->system)
58efca9067642c Johannes Berg 2024-06-07  1601  			continue;
58efca9067642c Johannes Berg 2024-06-07  1602  		sym_len = strlen(sym_defs[i]->symbol_id);
58efca9067642c Johannes Berg 2024-06-07  1603  		if (name_len != sym_len)
58efca9067642c Johannes Berg 2024-06-07  1604  			continue;
58efca9067642c Johannes Berg 2024-06-07  1605  		if (strncmp(sym_defs[i]->symbol_id, name, sym_len))
58efca9067642c Johannes Berg 2024-06-07  1606  			continue;
58efca9067642c Johannes Berg 2024-06-07  1607  		if (sym_defs[i]->show)
58efca9067642c Johannes Berg 2024-06-07  1608  			sym_defs[i]->show(m);
58efca9067642c Johannes Berg 2024-06-07  1609  		break;
58efca9067642c Johannes Berg 2024-06-07  1610  	}
58efca9067642c Johannes Berg 2024-06-07  1611  }
58efca9067642c Johannes Berg 2024-06-07  1612  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
