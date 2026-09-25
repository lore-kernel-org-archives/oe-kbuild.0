Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C13DA7DD
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325935; cv=none; b=i1p+Sc1kAkwD8Z3ca0sw6AvYfW8mPYiBIYkTJqfgaJkynLKNd5YblCmv7WJx3KrpezRSbyMMk40FR2a7SxsVmnAKVV/CHZDXiTopT5XiNesXZoXBPCkfeVPSaJZvfNDVvU6GDUknJIwQomBaOQLpHsN2FpVI8Cek9QfWTa2I0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325935; c=relaxed/simple;
	bh=Sr2d7n5Bn8FF4KKlop5ck5hGvxI6O9p1fdBzrfoxXtU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tjcUPtZOrBJgCJe276KML5Q7W5Y547qkDPEX8gsnzL1giYkeei/6VS5yn+aXgY1TR6GU6nS7IUZD6Vf7P3IEWCc5g7PyWFotxUxIX0KiQO0GFXEwj/hsqActH9spxZ7hd9k4o4BWep/P8YIuNmtRZEuyacBKlAnTF3TzeuhCKpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpxbNe1T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpxbNe1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790325931; x=1821861931;
  h=date:from:to:cc:subject:message-id;
  bh=Sr2d7n5Bn8FF4KKlop5ck5hGvxI6O9p1fdBzrfoxXtU=;
  b=CpxbNe1TILRUB/xAoRc6z8vZiTW1SRJZWho18uFqBy+87nVgDFyL0Jpf
   QJzpqIcGXFygmsrSB99ly/SfabCgw50nZkq2NX2v5Ty6yrXV7h/xuxB/9
   tdF65d20rrzcZE0Ax31NnZlNj5V9E6pD19EEkYqZyaSnHCQXl/qW+Oihs
   VCWjLI85Iab4QxmqU5qHeegaZB1H1+U4UaHDu/GJVLYPRV/Xvk713DdwX
   K3pmK6jft5zH1BmmCwXJ+rUJpr/jk5tGY9R7YPQtSau1YKxZ+pED2mx9p
   Ee8E8hHdecAqre0ZGoa64MQeW4bCnQ5P4qt7VqUR4jrOzBM4iyhTaCOtx
   w==;
X-CSE-ConnectionGUID: RzGrKu9GRQSKm209W7nK/w==
X-CSE-MsgGUID: Sd322UKET8yMFZ6IUucokQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90169932"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90169932"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 01:45:29 -0700
X-CSE-ConnectionGUID: DE9QuyXpSCWNNk26Ng+5Mw==
X-CSE-MsgGUID: FUZRNOBNR6qGKJlaQumAsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272854568"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 25 Sep 2026 01:45:28 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA1Yc-000000000fM-1kyX;
	Fri, 25 Sep 2026 08:45:26 +0000
Date: Fri, 25 Sep 2026 10:44:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc6 33/41]
 mm/page_alloc.c:4046 __alloc_pages_may_oom() warn: bitwise AND condition is
 false here
Message-ID: <202609251016.H6GkbFFe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc6
head:   8c5d814c9801de9fbf8962c8798c348e8d92bd7e
commit: a8817116bdcfb1521ea16cc621f74bfa8b70317f [33/41] mm/oom_kill: handle private NUMA policy constraints
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: nios2-randconfig-r2200-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251016.H6GkbFFe-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609251016.H6GkbFFe-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:4046 __alloc_pages_may_oom() warn: bitwise AND condition is false here

vim +4046 mm/page_alloc.c

6c18ba7a18997d Michal Hocko      2017-02-22  4039  
11e33f6a55ed78 Mel Gorman        2009-06-16  4040  static inline struct page *
11e33f6a55ed78 Mel Gorman        2009-06-16  4041  __alloc_pages_may_oom(gfp_t gfp_mask, unsigned int order,
a9263751e11a07 Vlastimil Babka   2015-02-11  4042  	const struct alloc_context *ac, unsigned long *did_some_progress)
^1da177e4c3f41 Linus Torvalds    2005-04-16  4043  {
6e0fc46dc2152d David Rientjes    2015-09-08  4044  	struct oom_control oc = {
6e0fc46dc2152d David Rientjes    2015-09-08  4045  		.zonelist = ac->zonelist,
a8817116bdcfb1 Gregory Price     2026-09-23 @4046  		.constraint_nodes = ac->alloc_flags & ALLOC_ZONELIST_PRIVATE ?
a8817116bdcfb1 Gregory Price     2026-09-23  4047  			&node_states[N_MEMORY] : &node_states[N_MEMORY_COMMON],
6e0fc46dc2152d David Rientjes    2015-09-08  4048  		.nodemask = ac->nodemask,
2a966b77ae3ede Vladimir Davydov  2016-07-26  4049  		.memcg = NULL,
6e0fc46dc2152d David Rientjes    2015-09-08  4050  		.gfp_mask = gfp_mask,
6e0fc46dc2152d David Rientjes    2015-09-08  4051  		.order = order,
6e0fc46dc2152d David Rientjes    2015-09-08  4052  	};
^1da177e4c3f41 Linus Torvalds    2005-04-16  4053  	struct page *page;
11e33f6a55ed78 Mel Gorman        2009-06-16  4054  
9879de7373fcfb Johannes Weiner   2015-01-26  4055  	*did_some_progress = 0;
9879de7373fcfb Johannes Weiner   2015-01-26  4056  
9879de7373fcfb Johannes Weiner   2015-01-26  4057  	/*
dc56401fc9f25e Johannes Weiner   2015-06-24  4058  	 * Acquire the oom lock.  If that fails, somebody else is
dc56401fc9f25e Johannes Weiner   2015-06-24  4059  	 * making progress for us.
9879de7373fcfb Johannes Weiner   2015-01-26  4060  	 */
dc56401fc9f25e Johannes Weiner   2015-06-24  4061  	if (!mutex_trylock(&oom_lock)) {
9879de7373fcfb Johannes Weiner   2015-01-26  4062  		*did_some_progress = 1;
11e33f6a55ed78 Mel Gorman        2009-06-16  4063  		schedule_timeout_uninterruptible(1);
11e33f6a55ed78 Mel Gorman        2009-06-16  4064  		return NULL;
11e33f6a55ed78 Mel Gorman        2009-06-16  4065  	}
11e33f6a55ed78 Mel Gorman        2009-06-16  4066  
11e33f6a55ed78 Mel Gorman        2009-06-16  4067  	/*
11e33f6a55ed78 Mel Gorman        2009-06-16  4068  	 * Go through the zonelist yet one more time, keep very high watermark
11e33f6a55ed78 Mel Gorman        2009-06-16  4069  	 * here, this is only to catch a parallel oom killing, we must fail if
e746bf730a76fe Tetsuo Handa      2017-08-31  4070  	 * we're still under heavy pressure. But make sure that this reclaim
e746bf730a76fe Tetsuo Handa      2017-08-31  4071  	 * attempt shall not depend on __GFP_DIRECT_RECLAIM && !__GFP_NORETRY
e746bf730a76fe Tetsuo Handa      2017-08-31  4072  	 * allocation which will never fail due to oom_lock already held.
11e33f6a55ed78 Mel Gorman        2009-06-16  4073  	 */
e746bf730a76fe Tetsuo Handa      2017-08-31  4074  	page = get_page_from_freelist((gfp_mask | __GFP_HARDWALL) &
e746bf730a76fe Tetsuo Handa      2017-08-31  4075  				      ~__GFP_DIRECT_RECLAIM, order,
6372aac4d41fcd Brendan Jackman   2026-07-03  4076  				      ac->alloc_flags|ALLOC_WMARK_HIGH|ALLOC_CPUSET, ac);
11e33f6a55ed78 Mel Gorman        2009-06-16  4077  	if (page)
11e33f6a55ed78 Mel Gorman        2009-06-16  4078  		goto out;
11e33f6a55ed78 Mel Gorman        2009-06-16  4079  
9879de7373fcfb Johannes Weiner   2015-01-26  4080  	/* Coredumps can quickly deplete all memory reserves */
9879de7373fcfb Johannes Weiner   2015-01-26  4081  	if (current->flags & PF_DUMPCORE)
9879de7373fcfb Johannes Weiner   2015-01-26  4082  		goto out;
11e33f6a55ed78 Mel Gorman        2009-06-16  4083  	/* The OOM killer will not help higher order allocs */
4365a5676fa3aa KAMEZAWA Hiroyuki 2009-12-15  4084  	if (order > PAGE_ALLOC_COSTLY_ORDER)
11e33f6a55ed78 Mel Gorman        2009-06-16  4085  		goto out;
dcda9b04713c3f Michal Hocko      2017-07-12  4086  	/*
dcda9b04713c3f Michal Hocko      2017-07-12  4087  	 * We have already exhausted all our reclaim opportunities without any
dcda9b04713c3f Michal Hocko      2017-07-12  4088  	 * success so it is time to admit defeat. We will skip the OOM killer
dcda9b04713c3f Michal Hocko      2017-07-12  4089  	 * because it is very likely that the caller has a more reasonable
dcda9b04713c3f Michal Hocko      2017-07-12  4090  	 * fallback than shooting a random task.
cfb4a541918498 Mateusz Nosek     2020-10-13  4091  	 *
cfb4a541918498 Mateusz Nosek     2020-10-13  4092  	 * The OOM killer may not free memory on a specific node.
dcda9b04713c3f Michal Hocko      2017-07-12  4093  	 */
cfb4a541918498 Mateusz Nosek     2020-10-13  4094  	if (gfp_mask & (__GFP_RETRY_MAYFAIL | __GFP_THISNODE))
dcda9b04713c3f Michal Hocko      2017-07-12  4095  		goto out;
03668b3ceb0c7a David Rientjes    2010-08-09  4096  	/* The OOM killer does not needlessly kill tasks for lowmem */
97a225e69a1f88 Joonsoo Kim       2020-06-03  4097  	if (ac->highest_zoneidx < ZONE_NORMAL)
03668b3ceb0c7a David Rientjes    2010-08-09  4098  		goto out;
9083905a2a13de Johannes Weiner   2015-06-24  4099  	if (pm_suspended_storage())
9083905a2a13de Johannes Weiner   2015-06-24  4100  		goto out;
3da88fb3bacfaa Michal Hocko      2016-05-19  4101  	/*
3da88fb3bacfaa Michal Hocko      2016-05-19  4102  	 * XXX: GFP_NOFS allocations should rather fail than rely on
3da88fb3bacfaa Michal Hocko      2016-05-19  4103  	 * other request to make a forward progress.
3da88fb3bacfaa Michal Hocko      2016-05-19  4104  	 * We are in an unfortunate situation where out_of_memory cannot
3da88fb3bacfaa Michal Hocko      2016-05-19  4105  	 * do much for this context but let's try it to at least get
3da88fb3bacfaa Michal Hocko      2016-05-19  4106  	 * access to memory reserved if the current task is killed (see
3da88fb3bacfaa Michal Hocko      2016-05-19  4107  	 * out_of_memory). Once filesystems are ready to handle allocation
3da88fb3bacfaa Michal Hocko      2016-05-19  4108  	 * failures more gracefully we should just bail out here.
3da88fb3bacfaa Michal Hocko      2016-05-19  4109  	 */
3da88fb3bacfaa Michal Hocko      2016-05-19  4110  
3c2c6488428433 Shile Zhang       2018-01-31  4111  	/* Exhausted what can be done so it's blame time */
3f913fc5f97456 Qi Zheng          2022-05-19  4112  	if (out_of_memory(&oc) ||
3f913fc5f97456 Qi Zheng          2022-05-19  4113  	    WARN_ON_ONCE_GFP(gfp_mask & __GFP_NOFAIL, gfp_mask)) {
9879de7373fcfb Johannes Weiner   2015-01-26  4114  		*did_some_progress = 1;
5020e285856cb4 Michal Hocko      2016-01-14  4115  
5020e285856cb4 Michal Hocko      2016-01-14  4116  		/*
6c18ba7a18997d Michal Hocko      2017-02-22  4117  		 * Help non-failing allocations by giving them access to memory
6c18ba7a18997d Michal Hocko      2017-02-22  4118  		 * reserves
5020e285856cb4 Michal Hocko      2016-01-14  4119  		 */
6c18ba7a18997d Michal Hocko      2017-02-22  4120  		if (gfp_mask & __GFP_NOFAIL)
6c18ba7a18997d Michal Hocko      2017-02-22  4121  			page = __alloc_pages_cpuset_fallback(gfp_mask, order,
6372aac4d41fcd Brendan Jackman   2026-07-03  4122  					ac->alloc_flags|ALLOC_NO_WATERMARKS, ac);
5020e285856cb4 Michal Hocko      2016-01-14  4123  	}
11e33f6a55ed78 Mel Gorman        2009-06-16  4124  out:
dc56401fc9f25e Johannes Weiner   2015-06-24  4125  	mutex_unlock(&oom_lock);
11e33f6a55ed78 Mel Gorman        2009-06-16  4126  	return page;
11e33f6a55ed78 Mel Gorman        2009-06-16  4127  }
11e33f6a55ed78 Mel Gorman        2009-06-16  4128  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
