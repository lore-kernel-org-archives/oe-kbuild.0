Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A345192D7B
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Sep 2024 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727710822; cv=none; b=AbVSqqwut+u/VhmR1MEVqjvgkZeCSKDywU37FOdlibFpg6zxRYy/uHnMxqS11NJaStw7k6+UFg/n/ejSr34wrHQSilH699LLzN6lcbc5tV8Y9ON1xBZsc5G7M+KuBCZxwIBa9hAQMvcKs52yDU25sezuRhxSNmV5Pr78FSdRaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727710822; c=relaxed/simple;
	bh=kc22s9pmu1kfHScWiTVkiueQvLFRLU4zXEP0T7bhT/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FIhCiR5YIxww8N7iLTQ4e/DwEJG7YDJc9ltr6BHHurOCvvf9iNNqlu4L7X5dDmqdEw7VrNoNeds6VSpaMue2N0WIbb8GDZ4fXiwWuvhU9p9vfO2LWbH+crtzwJ9aO3BbPqErtnmDb3mNGq6je0bHWUnFZHQpKtQU3/UnKV5ZSJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnMKM+3J; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnMKM+3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727710820; x=1759246820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kc22s9pmu1kfHScWiTVkiueQvLFRLU4zXEP0T7bhT/U=;
  b=lnMKM+3J7kFUZbCDdaQJRvpDQV6r2j9HvfclLngfdNHwqsAbidzAnkzX
   YIaBW7V9q9hmDdcd1IYUDX/D8AkLubWwJSNVKKv+yf6ou/jsDU9M2LCWc
   5n1KfrAmBAF2d5RcPdq+OoVgOrSu9EXGTGcGa7MQ894euyoxTonh7V4eM
   FX+qbCvxJMlXRZbRpfZILuo3Vyc7EE3G64AWKG1EEJlnFOCXmLQDiM0um
   hbtcGJ3m3vS/cReomIxvHlvoWtKC+SZD2Wyg/xiUxFQ/srC/f9p0Ujw/m
   9qm4iqvLVpadybj0auHbiU13pMiQurGS5b2fkErxWFI4aNzeydLd6tNit
   w==;
X-CSE-ConnectionGUID: YLN9W/MdSb6aY4lCTHCZKg==
X-CSE-MsgGUID: 0y4HBEVOQTSJbnOEJiHtzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26934298"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="26934298"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 08:40:20 -0700
X-CSE-ConnectionGUID: BentRvAjThym9BehCdWGBA==
X-CSE-MsgGUID: U4L+DmDnSw+eC2AmGNnY/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="78304888"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Sep 2024 08:40:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svIVU-000PbF-1M;
	Mon, 30 Sep 2024 15:40:16 +0000
Date: Mon, 30 Sep 2024 23:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/panthor/panthor_sched.c:2024:15-20: ERROR: invalid
 reference to the index variable of the iterator on line 1997
Message-ID: <202409302306.UDikqa03-lkp@intel.com>
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
TO: Boris Brezillon <bbrezillon@kernel.org>
CC: Steven Price <steven.price@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: d72f049087d4f973f6332b599c92177e718107de drm/panthor: Allow driver compilation
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r064-20240930 (https://download.01.org/0day-ci/archive/20240930/202409302306.UDikqa03-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409302306.UDikqa03-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panthor/panthor_sched.c:2024:15-20: ERROR: invalid reference to the index variable of the iterator on line 1997
   drivers/gpu/drm/panthor/panthor_sched.c:2024:15-20: ERROR: invalid reference to the index variable of the iterator on line 2027

vim +2024 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d Boris Brezillon 2024-02-29  1988  
de85488138247d Boris Brezillon 2024-02-29  1989  static void
de85488138247d Boris Brezillon 2024-02-29  1990  tick_ctx_cleanup(struct panthor_scheduler *sched,
de85488138247d Boris Brezillon 2024-02-29  1991  		 struct panthor_sched_tick_ctx *ctx)
de85488138247d Boris Brezillon 2024-02-29  1992  {
de85488138247d Boris Brezillon 2024-02-29  1993  	struct panthor_group *group, *tmp;
de85488138247d Boris Brezillon 2024-02-29  1994  	u32 i;
de85488138247d Boris Brezillon 2024-02-29  1995  
de85488138247d Boris Brezillon 2024-02-29  1996  	for (i = 0; i < ARRAY_SIZE(ctx->old_groups); i++) {
de85488138247d Boris Brezillon 2024-02-29 @1997  		list_for_each_entry_safe(group, tmp, &ctx->old_groups[i], run_node) {
de85488138247d Boris Brezillon 2024-02-29  1998  			/* If everything went fine, we should only have groups
de85488138247d Boris Brezillon 2024-02-29  1999  			 * to be terminated in the old_groups lists.
de85488138247d Boris Brezillon 2024-02-29  2000  			 */
de85488138247d Boris Brezillon 2024-02-29  2001  			drm_WARN_ON(&group->ptdev->base, !ctx->csg_upd_failed_mask &&
de85488138247d Boris Brezillon 2024-02-29  2002  				    group_can_run(group));
de85488138247d Boris Brezillon 2024-02-29  2003  
de85488138247d Boris Brezillon 2024-02-29  2004  			if (!group_can_run(group)) {
de85488138247d Boris Brezillon 2024-02-29  2005  				list_del_init(&group->run_node);
de85488138247d Boris Brezillon 2024-02-29  2006  				list_del_init(&group->wait_node);
de85488138247d Boris Brezillon 2024-02-29  2007  				group_queue_work(group, term);
de85488138247d Boris Brezillon 2024-02-29  2008  			} else if (group->csg_id >= 0) {
de85488138247d Boris Brezillon 2024-02-29  2009  				list_del_init(&group->run_node);
de85488138247d Boris Brezillon 2024-02-29  2010  			} else {
de85488138247d Boris Brezillon 2024-02-29  2011  				list_move(&group->run_node,
de85488138247d Boris Brezillon 2024-02-29  2012  					  group_is_idle(group) ?
de85488138247d Boris Brezillon 2024-02-29  2013  					  &sched->groups.idle[group->priority] :
de85488138247d Boris Brezillon 2024-02-29  2014  					  &sched->groups.runnable[group->priority]);
de85488138247d Boris Brezillon 2024-02-29  2015  			}
de85488138247d Boris Brezillon 2024-02-29  2016  			group_put(group);
de85488138247d Boris Brezillon 2024-02-29  2017  		}
de85488138247d Boris Brezillon 2024-02-29  2018  	}
de85488138247d Boris Brezillon 2024-02-29  2019  
de85488138247d Boris Brezillon 2024-02-29  2020  	for (i = 0; i < ARRAY_SIZE(ctx->groups); i++) {
de85488138247d Boris Brezillon 2024-02-29  2021  		/* If everything went fine, the groups to schedule lists should
de85488138247d Boris Brezillon 2024-02-29  2022  		 * be empty.
de85488138247d Boris Brezillon 2024-02-29  2023  		 */
de85488138247d Boris Brezillon 2024-02-29 @2024  		drm_WARN_ON(&group->ptdev->base,
de85488138247d Boris Brezillon 2024-02-29  2025  			    !ctx->csg_upd_failed_mask && !list_empty(&ctx->groups[i]));
de85488138247d Boris Brezillon 2024-02-29  2026  
de85488138247d Boris Brezillon 2024-02-29  2027  		list_for_each_entry_safe(group, tmp, &ctx->groups[i], run_node) {
de85488138247d Boris Brezillon 2024-02-29  2028  			if (group->csg_id >= 0) {
de85488138247d Boris Brezillon 2024-02-29  2029  				list_del_init(&group->run_node);
de85488138247d Boris Brezillon 2024-02-29  2030  			} else {
de85488138247d Boris Brezillon 2024-02-29  2031  				list_move(&group->run_node,
de85488138247d Boris Brezillon 2024-02-29  2032  					  group_is_idle(group) ?
de85488138247d Boris Brezillon 2024-02-29  2033  					  &sched->groups.idle[group->priority] :
de85488138247d Boris Brezillon 2024-02-29  2034  					  &sched->groups.runnable[group->priority]);
de85488138247d Boris Brezillon 2024-02-29  2035  			}
de85488138247d Boris Brezillon 2024-02-29  2036  			group_put(group);
de85488138247d Boris Brezillon 2024-02-29  2037  		}
de85488138247d Boris Brezillon 2024-02-29  2038  	}
de85488138247d Boris Brezillon 2024-02-29  2039  }
de85488138247d Boris Brezillon 2024-02-29  2040  

:::::: The code at line 2024 was first introduced by commit
:::::: de85488138247d034eb3241840424a54d660926b drm/panthor: Add the scheduler logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
