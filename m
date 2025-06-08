Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C36EACD
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749407377; cv=none; b=GJiTg9JO+jrWPT/LqKZ8BCXvefwHzLe7JPAOu+G4AALRrOIIzsk6XplcULmWa4prbT9Nw2oH3ZxxtDrRUM3RkQj6nmLE8i348yzzTyrPrsXO7Ewd1UNUy/9arAUFKg0MCIRJIbbyMCJUpW+4Bs7WuAhPOQ+EMgp0CmXRV835z30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749407377; c=relaxed/simple;
	bh=i0Wfg5V78UgG/zId5yQ7gaDBNAOV4OX1mIDiV0V9Ivw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqtFV5g9rOFLGuFlRjxiINPtSZ/CFiwOjHd8GAo8Eub5wS+qYrIsOEu8lF7Q+/O7xO6mRHwMzq1Gfq6sBbzlY9Tf3zjWXerRTF/MxEK4LA0Txk1oCdf4JSNVQB6+s5qMCxVHmuYYFtjEYI3+/yASz1j09UJ9BdBtjkV/+IpHvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAG4qS4U; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAG4qS4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749407376; x=1780943376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0Wfg5V78UgG/zId5yQ7gaDBNAOV4OX1mIDiV0V9Ivw=;
  b=KAG4qS4U6tVKPAfUEdt8Y7ohDDUtbSBp7kVosc4tWXaYcwBxjDpOzekY
   IfTeA2y9R0pJmFJxWr5nAVidRbkKHuhkZGzQCS8bjga6JasI4o5Mha3fT
   a7hzS/MBEm411JKW+2ev8tkHIgTtWhIpbddmPCF6LSmMwx5o/j2JWphID
   FT2SNxKEhyMVkFN2rx7+I3q3Zit2p2eBgW9vSrdS5EuEdvUEqPka6hu8G
   OFhaEts1fiuz0cYs799aXuIQDE8y/+nRd3y4sb+OrKmesh/Vwnsu1+OOc
   1K8j20gXV92Q12AIWN52b1pwB4C8zvRwXlTQ1WgpOj09HhR/hQDJt5sFG
   g==;
X-CSE-ConnectionGUID: lA2t5cORT+2zT0SAKnuSTQ==
X-CSE-MsgGUID: 0+hrjQNnTJi1WDudww4dIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51196780"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="51196780"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 11:29:35 -0700
X-CSE-ConnectionGUID: SK8qPc68Q7yVgQBIwXvOQw==
X-CSE-MsgGUID: OS5/OCcyRt2FhQNs0GFDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="146304444"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jun 2025 11:29:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOKlv-0006Vd-07;
	Sun, 08 Jun 2025 18:29:31 +0000
Date: Mon, 9 Jun 2025 02:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [trace:trace/fixes 1/4]
 kernel/trace/trace_events_filter.c:1463:20-24: ERROR: reference preceded by
 free on line 1439
Message-ID: <202506090227.6qQJFPsL-lkp@intel.com>
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
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/fixes
head:   549e914c96ae67760f36b9714b424dc992a0a69b
commit: a9d0aab5eb33a44792a66b7af13ff50d7b3e7022 [1/4] tracing: Fix regression of filter waiting a long time on RCU synchronization
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-053-20250608 (https://download.01.org/0day-ci/archive/20250609/202506090227.6qQJFPsL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506090227.6qQJFPsL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/trace/trace_events_filter.c:1463:20-24: ERROR: reference preceded by free on line 1439

vim +1463 kernel/trace/trace_events_filter.c

a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1422  
7967b3e0c40ff7 Steven Rostedt (Red Hat  2015-05-13  1423) static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1424  					  struct trace_array *tr,
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1425  					  struct event_filter *filter)
f306cc82a93d6b Tom Zanussi              2013-10-24  1426  {
7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05  1427) 	struct trace_event_file *file;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1428  	struct filter_head *head;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1429  	struct filter_list *item;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1430  
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1431  	head = kmalloc(sizeof(*head), GFP_KERNEL);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1432  	if (!head)
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1433  		goto free_now;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1434  
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1435  	INIT_LIST_HEAD(&head->list);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1436  
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1437  	item = kmalloc(sizeof(*item), GFP_KERNEL);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1438  	if (!item) {
a9d0aab5eb33a4 Steven Rostedt           2025-06-06 @1439  		kfree(head);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1440  		goto free_now;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1441  	}
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1442  
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1443  	item->filter = filter;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1444  	list_add_tail(&item->list, &head->list);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1445  
f306cc82a93d6b Tom Zanussi              2013-10-24  1446  	list_for_each_entry(file, &tr->events, list) {
bb9ef1cb7d8668 Oleg Nesterov            2014-07-15  1447  		if (file->system != dir)
8e254c1d183f02 Li Zefan                 2009-08-31  1448  			continue;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1449  		item = kmalloc(sizeof(*item), GFP_KERNEL);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1450  		if (!item)
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1451  			goto free_now;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1452  		item->filter = event_filter(file);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1453  		list_add_tail(&item->list, &head->list);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1454  		event_clear_filter(file);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1455  	}
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1456  
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1457  	delay_free_filter(head);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1458  	return;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1459   free_now:
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1460  	tracepoint_synchronize_unregister();
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1461  
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1462  	if (head)
a9d0aab5eb33a4 Steven Rostedt           2025-06-06 @1463  		free_filter_list(&head->rcu);
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1464  
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1465  	list_for_each_entry(file, &tr->events, list) {
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1466  		if (file->system != dir || !file->filter)
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1467  			continue;
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1468  		__free_filter(file->filter);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1469  	}
a9d0aab5eb33a4 Steven Rostedt           2025-06-06  1470  	__free_filter(filter);
cfb180f3e71b2a Tom Zanussi              2009-03-22  1471  }
ac1adc55fc71c7 Tom Zanussi              2009-04-17  1472  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
