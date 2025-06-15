Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ACD8C11
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Jun 2025 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750010674; cv=none; b=FUykm8WTykgPRZaP9o5SSIFlvoZfUlUrNLTcyLmPyDNyv5KPkILnzw8kCoTfypLdSm4rTFqeBkHIRA7ijc71zxytAyePSY3vkvUYd+kDea9JtzPAeMIS9sbImS5oSmZGxUl/2QTvdJOe+EcRyTLbPztC37pXIwLErVTC3Yw7VHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750010674; c=relaxed/simple;
	bh=HHDsU0DdHvnlItb6gz8XJmUjwf/PDRDgF4CPSloLVXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uK4WnOanDjFUxopLykvwYnkQ6BVQLvX1AjlHzNKzjoKLU78HVlWTj1zZ8i6UPwWYG9KLBixSLsRgvwlULemhSUsE7cOSKGr57cJyhwysJyZUHtSwV0Vjf1FuljhMTDH+xRvQa6ACdb0Qvhb68Q3VKq3x+Tl+e21oeZMi16JhBF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdrOiBW3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdrOiBW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750010671; x=1781546671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHDsU0DdHvnlItb6gz8XJmUjwf/PDRDgF4CPSloLVXc=;
  b=TdrOiBW3H4vOhYbWcuddPuvtWnbnHX5/WpVoendhUZf7JkysXVpgTxlR
   237KdQ/Ghap+cQPpgw9rHXQ+mPVN7nmn5ojSsEPQAfcEAwXejbSYOf2Yq
   1NL7R5E0ssBg9n70Ih4RvmfL4e67ao1mnPqOUgWr0bNW9cR05TKODGTFB
   oTNlqbR0PVOXzuw3blnjZFDLnYENi9x0wtSZDwe5OPht8WNeuNdGwHXvB
   lC+p1IfplAQxcR5tp1pYWGYi4agZvueXEbcn13Sl5gXKG08U3YC+f/FHy
   wChbffd0uREZJFNYIyguv2nh5s2aZc/5/kCThBWmozZ0on5m2dxhsUJ95
   Q==;
X-CSE-ConnectionGUID: 6fM46n0gSz2pzkNg7ZYk0Q==
X-CSE-MsgGUID: h2DHmYAVRPupOdg9TG104Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52294598"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="52294598"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 11:04:30 -0700
X-CSE-ConnectionGUID: 2U56Aai3TQmCobZVNDbSWA==
X-CSE-MsgGUID: DjDGD/LxQhiFDVJw7vOdug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="149157370"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2025 11:04:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQriV-000ETA-0y;
	Sun, 15 Jun 2025 18:04:27 +0000
Date: Mon, 16 Jun 2025 02:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v14 31/32] fs/resctrl: Introduce the interface to switch
 between monitor modes
Message-ID: <202506160118.OzwDWrcT-lkp@intel.com>
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
In-Reply-To: <dada02bec2f7ea2fa316f892560c07e0bc45df41.1749848715.git.babu.moger@amd.com>
References: <dada02bec2f7ea2fa316f892560c07e0bc45df41.1749848715.git.babu.moger@amd.com>
TO: Babu Moger <babu.moger@amd.com>
TO: babu.moger@amd.com
TO: corbet@lwn.net
TO: tony.luck@intel.com
TO: reinette.chatre@intel.com
TO: Dave.Martin@arm.com
TO: james.morse@arm.com
TO: tglx@linutronix.de
TO: mingo@redhat.com
TO: bp@alien8.de
TO: dave.hansen@linux.intel.com
CC: x86@kernel.org
CC: hpa@zytor.com
CC: akpm@linux-foundation.org
CC: rostedt@goodmis.org
CC: paulmck@kernel.org
CC: thuth@redhat.com
CC: ardb@kernel.org
CC: gregkh@linuxfoundation.org
CC: seanjc@google.com
CC: thomas.lendacky@amd.com
CC: pawan.kumar.gupta@linux.intel.com
CC: manali.shukla@amd.com
CC: perry.yuan@amd.com
CC: kai.huang@intel.com
CC: peterz@infradead.org
CC: xiaoyao.li@intel.com
CC: kan.liang@linux.intel.com
CC: mario.limonciello@amd.com
CC: xin3.li@intel.com
CC: gautham.shenoy@amd.com

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.16-rc1 next-20250613]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-fs-resctrl-Remove-unappropriate-references-to-cacheinfo-in-the-resctrl-subsystem/20250614-051344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/dada02bec2f7ea2fa316f892560c07e0bc45df41.1749848715.git.babu.moger%40amd.com
patch subject: [PATCH v14 31/32] fs/resctrl: Introduce the interface to switch between monitor modes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250615 (https://download.01.org/0day-ci/archive/20250616/202506160118.OzwDWrcT-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506160118.OzwDWrcT-lkp@intel.com/

New smatch warnings:
fs/resctrl/rdtgroup.c:2338 resctrl_process_assign() warn: excess argument passed to 'sprintf'

Old smatch warnings:
fs/resctrl/rdtgroup.c:4870 domain_setup_mon_state() error: uninitialized symbol 'idx'.

vim +/sprintf +2338 fs/resctrl/rdtgroup.c

8d241742f76648 Babu Moger 2025-06-13  2267  
8d241742f76648 Babu Moger 2025-06-13  2268  static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
8d241742f76648 Babu Moger 2025-06-13  2269  				  char *event, char *tok)
8d241742f76648 Babu Moger 2025-06-13  2270  {
8d241742f76648 Babu Moger 2025-06-13  2271  	struct rdt_mon_domain *d;
8d241742f76648 Babu Moger 2025-06-13  2272  	unsigned long dom_id = 0;
8d241742f76648 Babu Moger 2025-06-13  2273  	char *dom_str, *id_str;
8d241742f76648 Babu Moger 2025-06-13  2274  	struct mon_evt *mevt;
8d241742f76648 Babu Moger 2025-06-13  2275  	int assign_state;
8d241742f76648 Babu Moger 2025-06-13  2276  	char domain[10];
8b5e58fe62862b Babu Moger 2025-06-13  2277  	int ret = 0;
8d241742f76648 Babu Moger 2025-06-13  2278  	bool found;
8d241742f76648 Babu Moger 2025-06-13  2279  
8d241742f76648 Babu Moger 2025-06-13  2280  	mevt = mbm_get_mon_event_by_name(r, event);
8d241742f76648 Babu Moger 2025-06-13  2281  	if (!mevt) {
8d241742f76648 Babu Moger 2025-06-13  2282  		rdt_last_cmd_printf("Invalid event %s\n", event);
8d241742f76648 Babu Moger 2025-06-13  2283  		return  -ENOENT;
8d241742f76648 Babu Moger 2025-06-13  2284  	}
8d241742f76648 Babu Moger 2025-06-13  2285  
8d241742f76648 Babu Moger 2025-06-13  2286  next:
8d241742f76648 Babu Moger 2025-06-13  2287  	if (!tok || tok[0] == '\0')
8d241742f76648 Babu Moger 2025-06-13  2288  		return 0;
8d241742f76648 Babu Moger 2025-06-13  2289  
8d241742f76648 Babu Moger 2025-06-13  2290  	/* Start processing the strings for each domain */
8d241742f76648 Babu Moger 2025-06-13  2291  	dom_str = strim(strsep(&tok, ";"));
8d241742f76648 Babu Moger 2025-06-13  2292  
8d241742f76648 Babu Moger 2025-06-13  2293  	id_str = strsep(&dom_str, "=");
8d241742f76648 Babu Moger 2025-06-13  2294  
8d241742f76648 Babu Moger 2025-06-13  2295  	/* Check for domain id '*' which means all domains */
8d241742f76648 Babu Moger 2025-06-13  2296  	if (id_str && *id_str == '*') {
8d241742f76648 Babu Moger 2025-06-13  2297  		d = NULL;
8d241742f76648 Babu Moger 2025-06-13  2298  		goto check_state;
8d241742f76648 Babu Moger 2025-06-13  2299  	} else if (!id_str || kstrtoul(id_str, 10, &dom_id)) {
8d241742f76648 Babu Moger 2025-06-13  2300  		rdt_last_cmd_puts("Missing domain id\n");
8d241742f76648 Babu Moger 2025-06-13  2301  		return -EINVAL;
8d241742f76648 Babu Moger 2025-06-13  2302  	}
8d241742f76648 Babu Moger 2025-06-13  2303  
8d241742f76648 Babu Moger 2025-06-13  2304  	/* Verify if the dom_id is valid */
8d241742f76648 Babu Moger 2025-06-13  2305  	found = false;
8d241742f76648 Babu Moger 2025-06-13  2306  	list_for_each_entry(d, &r->mon_domains, hdr.list) {
8d241742f76648 Babu Moger 2025-06-13  2307  		if (d->hdr.id == dom_id) {
8d241742f76648 Babu Moger 2025-06-13  2308  			found = true;
8d241742f76648 Babu Moger 2025-06-13  2309  			break;
8d241742f76648 Babu Moger 2025-06-13  2310  		}
8d241742f76648 Babu Moger 2025-06-13  2311  	}
8d241742f76648 Babu Moger 2025-06-13  2312  
8d241742f76648 Babu Moger 2025-06-13  2313  	if (!found) {
8d241742f76648 Babu Moger 2025-06-13  2314  		rdt_last_cmd_printf("Invalid domain id %ld\n", dom_id);
8d241742f76648 Babu Moger 2025-06-13  2315  		return -EINVAL;
8d241742f76648 Babu Moger 2025-06-13  2316  	}
8d241742f76648 Babu Moger 2025-06-13  2317  
8d241742f76648 Babu Moger 2025-06-13  2318  check_state:
8d241742f76648 Babu Moger 2025-06-13  2319  	assign_state = resctrl_get_assign_state(dom_str);
8d241742f76648 Babu Moger 2025-06-13  2320  
8d241742f76648 Babu Moger 2025-06-13  2321  	switch (assign_state) {
8d241742f76648 Babu Moger 2025-06-13  2322  	case ASSIGN_NONE:
8b5e58fe62862b Babu Moger 2025-06-13  2323  		resctrl_unassign_cntr_event(r, d, rdtgrp, mevt);
8d241742f76648 Babu Moger 2025-06-13  2324  		break;
8d241742f76648 Babu Moger 2025-06-13  2325  	case ASSIGN_EXCLUSIVE:
8d241742f76648 Babu Moger 2025-06-13  2326  		ret = resctrl_assign_cntr_event(r, d, rdtgrp, mevt);
8d241742f76648 Babu Moger 2025-06-13  2327  		break;
8d241742f76648 Babu Moger 2025-06-13  2328  	case ASSIGN_INVALID:
8d241742f76648 Babu Moger 2025-06-13  2329  		ret = -EINVAL;
8d241742f76648 Babu Moger 2025-06-13  2330  	}
8d241742f76648 Babu Moger 2025-06-13  2331  
8d241742f76648 Babu Moger 2025-06-13  2332  	if (ret)
8d241742f76648 Babu Moger 2025-06-13  2333  		goto out_fail;
8d241742f76648 Babu Moger 2025-06-13  2334  
8d241742f76648 Babu Moger 2025-06-13  2335  	goto next;
8d241742f76648 Babu Moger 2025-06-13  2336  
8d241742f76648 Babu Moger 2025-06-13  2337  out_fail:
8d241742f76648 Babu Moger 2025-06-13 @2338  	sprintf(domain, d ? "%ld" : "*", dom_id);
8d241742f76648 Babu Moger 2025-06-13  2339  
8d241742f76648 Babu Moger 2025-06-13  2340  	rdt_last_cmd_printf("Assign operation '%s:%s=%s' failed\n", event, domain, dom_str);
8d241742f76648 Babu Moger 2025-06-13  2341  
8d241742f76648 Babu Moger 2025-06-13  2342  	return ret;
8d241742f76648 Babu Moger 2025-06-13  2343  }
8d241742f76648 Babu Moger 2025-06-13  2344  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
