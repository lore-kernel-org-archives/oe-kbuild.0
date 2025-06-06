Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A36BA38
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749242970; cv=none; b=ldxXZc6rTLBebdiwdZGHMl2ehEhcwJVRUX8xbB7fsZBSGV0iijeAwNIY1gYmznBXG7KaCu8Uhi8SLG2HYnnfGjAnWTG45wz7//Y2nOBDx6xugJ0w6vZ30GBGIco2/3KPNcs3QybgS56z579mbWeWZ7EozyWRpb5RFqsM4H+qdeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749242970; c=relaxed/simple;
	bh=sF3/r8nlfwSBIbQXips6CtSDQ6ipztCcljXzJgilpb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M6EeEeelyxnWCnBT4ojAQ8azHz0jlYnA3nPYFnafLwBdHjoBAgk1Lg0vAa0LWH2pCeVEfbe0u73Udm708BxFa39PbEyfj3nhRVF8SGsMirYFDxmjxSJJeLXC6gcGe7nHOAY1rgVuE73S/NJKS4eb8ZPLO64EswvSBJVOHqeQyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+TW8HdN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+TW8HdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749242967; x=1780778967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sF3/r8nlfwSBIbQXips6CtSDQ6ipztCcljXzJgilpb0=;
  b=J+TW8HdNGkpYrKMfsPRGKNtdcx49brdgTFtevCMSYdEk+aptl0aKLw1q
   Tgr5yRIzEGtN4Du+qApLVd1fEi3YXm/hZ3B55X02r9jkxq2EtiiVPVO7I
   WYlZng/Ng4gQvMCqtHVArnqzqLg7ql7aa7CYX870oKXgSPqhHXf/JWH4j
   3k4saRmfP39DMSc6i07ueRNK3yhwEsFi3voE4LsvOmwQY7Tw6Hgt3t6ew
   4bAJGhkyqqG/7j7qG2/2e2rBMnlPjAUV4g2Rsbyn3NvCm/FUOfuJPURsq
   iHtBD3UlnkIUnQl/mUUqYDECaG+dJBI0tNDaV04y+9Wti1Afwp30OSfRW
   w==;
X-CSE-ConnectionGUID: Ou0wT1YAQjSFeBtFnKuerA==
X-CSE-MsgGUID: 5fl7naAOSiS5o52Qxy8E8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="50633292"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="50633292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 13:49:27 -0700
X-CSE-ConnectionGUID: wvofDFOTTimwdCmfXfZ3/A==
X-CSE-MsgGUID: Fi9OKLJTQAqtmVGLMrJEig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="146276949"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2025 13:49:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNe0B-0005GJ-36;
	Fri, 06 Jun 2025 20:49:23 +0000
Date: Sat, 7 Jun 2025 04:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] tracing: Fix regression of filter waiting a long time on
 RCU synchronization
Message-ID: <202506070424.lCiNreTI-lkp@intel.com>
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
In-Reply-To: <20250605161701.35f7989a@gandalf.local.home>
References: <20250605161701.35f7989a@gandalf.local.home>
TO: Steven Rostedt <rostedt@goodmis.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Fix-regression-of-filter-waiting-a-long-time-on-RCU-synchronization/20250606-041722
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250605161701.35f7989a%40gandalf.local.home
patch subject: [PATCH] tracing: Fix regression of filter waiting a long time on RCU synchronization
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: riscv-randconfig-r072-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070424.lCiNreTI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506070424.lCiNreTI-lkp@intel.com/

smatch warnings:
kernel/trace/trace_events_filter.c:1452 filter_free_subsystem_filters() warn: 'head' double freed

vim +/head +1452 kernel/trace/trace_events_filter.c

f306cc82a93d6b Tom Zanussi              2013-10-24  1411  
7967b3e0c40ff7 Steven Rostedt (Red Hat  2015-05-13  1412) static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1413  					  struct trace_array *tr,
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1414  					  struct event_filter *filter)
f306cc82a93d6b Tom Zanussi              2013-10-24  1415  {
7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05  1416) 	struct trace_event_file *file;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1417  	struct filter_head *head;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1418  	struct filter_list *item;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1419  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1420  	head = kmalloc(sizeof(*head), GFP_KERNEL);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1421  	if (!head)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1422  		goto free_now;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1423  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1424  	INIT_LIST_HEAD(&head->list);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1425  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1426  	item = kmalloc(sizeof(*item), GFP_KERNEL);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1427  	if (!item) {
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1428  		kfree(head);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1429  		goto free_now;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1430  	}
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1431  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1432  	item->filter = filter;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1433  	list_add_tail(&item->list, &head->list);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1434  
f306cc82a93d6b Tom Zanussi              2013-10-24  1435  	list_for_each_entry(file, &tr->events, list) {
bb9ef1cb7d8668 Oleg Nesterov            2014-07-15  1436  		if (file->system != dir)
8e254c1d183f02 Li Zefan                 2009-08-31  1437  			continue;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1438  		item = kmalloc(sizeof(*item), GFP_KERNEL);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1439  		if (!item)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1440  			goto free_now;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1441  		item->filter = file->filter;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1442  		list_add_tail(&item->list, &head->list);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1443  		file->filter = NULL;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1444  	}
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1445  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1446  	delay_free_filter(head);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1447  	return;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1448   free_now:
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1449  	tracepoint_synchronize_unregister();
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1450  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1451  	if (head)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05 @1452  		free_filter_list(&head->rcu);
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1453  
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1454  	list_for_each_entry(file, &tr->events, list) {
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1455  		if (file->system != dir || !file->filter)
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1456  			continue;
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1457  		__free_filter(file->filter);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1458  	}
b9c3a0aeabb4e5 Steven Rostedt           2025-06-05  1459  	__free_filter(filter);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1460  }
ac1adc55fc71c7 Tom Zanussi              2009-04-17  1461  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
