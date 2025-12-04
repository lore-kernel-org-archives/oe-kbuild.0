Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D95227B32B
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764850869; cv=none; b=Hg0Rh9LLcBryXhHK477ogaDbQENuFj1GEYeV7POU/vRssAErxPqj3Mh+y6BcAGRw6ZPXbcUTC2uCaJh4bAETQicw5KD2Qb+oes065aQVCKcEOF+USeKdd/iPDqGxuWiyt0G+oQ/txyIkX8xQkCgqht8OCL7TwE7O7TJ8AEGPg1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764850869; c=relaxed/simple;
	bh=qnedifvX4P92mMRQZUsBpFNzCAdm/J7KgcOmhTN5HUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t9RMHZoi7+gBnnv6mMrQXB6OujRO8RdhSmXQCGLIEUFtYsDrqoRB4yRqTw5FSpyEJZKLuhFc1Q81SBhEhcQXeXiEe18aiw4Giub7sEHtC0p3Ip1QL5Z5mMONs5eSYomlK993DQ1jSaTf1lerou6ltDbqpNMPOUee/r4PZmOQurg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emGmAdQ/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emGmAdQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764850867; x=1796386867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qnedifvX4P92mMRQZUsBpFNzCAdm/J7KgcOmhTN5HUo=;
  b=emGmAdQ/bT4kU//VEFqUauPW0vsHDR4CTX3k+153So3OA1geVdjVVpuf
   HB+0NlvB/KQ6TGUqXZrknUce8L9U3SU6N2ljjhOIld069YiIBp7HEA0nZ
   cqdmVJe+J14WQ9EPFOQLO6ri5XgkFF1PAirKcEmV8RFd9eP+cFjYY8rdE
   X9zrYMbNLXJVPUS0CpgJbAk04Z2Ee1I5jpe0uO3KfrSsnuZa+OZ1lWUTf
   I/shSBVyr1lMD/hxQ/8hbBi6rAmPWgIuVsjSHGVzfZaVhFtNIfvwbKA2+
   X5q8l6/wam4A/Y3v19Ls+zrdB7xFbJA1HJMK1Xi2gfgCjlir5TUuqgPTx
   Q==;
X-CSE-ConnectionGUID: K7/jyt8QRay9sTRp68MIGw==
X-CSE-MsgGUID: ifRYiXflTeWfj72crc50OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65864845"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="65864845"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:21:07 -0800
X-CSE-ConnectionGUID: 389cO0T/SOe1Q9wuvxnNjA==
X-CSE-MsgGUID: V9JsdInoTY+0E3MzherHzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195078808"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2025 04:21:05 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR8KV-00000000DmP-13bx;
	Thu, 04 Dec 2025 12:21:03 +0000
Date: Thu, 4 Dec 2025 20:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mingo-tip:WIP.sched/flat 31/31] kernel/sched/fair.c:13541
 unregister_fair_sched_group() warn: variable dereferenced before check 'se'
 (see line 13538)
Message-ID: <202512042010.Kvt9IxPC-lkp@intel.com>
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
CC: Ingo Molnar <mingo@kernel.org>
TO: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/flat
head:   d8048abc1303ce09d2ed220c03377f633bd106e4
commit: d8048abc1303ce09d2ed220c03377f633bd106e4 [31/31] sched/eevdf: Move to a single runqueue
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: mips-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251204/202512042010.Kvt9IxPC-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512042010.Kvt9IxPC-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:13541 unregister_fair_sched_group() warn: variable dereferenced before check 'se' (see line 13538)

vim +/se +13541 kernel/sched/fair.c

8663e24d56dc1f kernel/sched/fair.c Peter Zijlstra         2016-06-22  13527  
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13528  void unregister_fair_sched_group(struct task_group *tg)
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13529  {
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13530  	int cpu;
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13531  
b027789e5e5049 kernel/sched/fair.c Mathias Krause         2021-11-03  13532  	destroy_cfs_bandwidth(tg_cfs_bandwidth(tg));
b027789e5e5049 kernel/sched/fair.c Mathias Krause         2021-11-03  13533  
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13534  	for_each_possible_cpu(cpu) {
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13535  		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu];
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13536  		struct sched_entity *se = tg->se[cpu];
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13537  		struct rq *rq = cpu_rq(cpu);
f85fd15b0da76f kernel/sched/fair.c Peng Wang              2025-10-24 @13538  		struct cfs_rq *parent_cfs_rq = cfs_rq_of(se);
f85fd15b0da76f kernel/sched/fair.c Peng Wang              2025-10-24  13539  
f85fd15b0da76f kernel/sched/fair.c Peng Wang              2025-10-24  13540  
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03 @13541) 		if (se)
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13542) 			remove_entity_load_avg(se);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13543  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13544  		/*
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13545  		 * Only empty task groups can be destroyed; so we can speculatively
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13546  		 * check on_list without danger of it being re-added.
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13547  		 */
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13548  		if (cfs_rq->on_list) {
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13549  			guard(rq_lock_irqsave)(rq);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13550  			list_del_leaf_cfs_rq(cfs_rq);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13551  		}
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13552) 
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13553) 		/*
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13554) 		 * Clear parent's h_load_next if it points to the
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13555) 		 * sched_entity being freed, to avoid stale pointer.
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13556) 		 */
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13557) 		if (READ_ONCE(parent_cfs_rq->h_load_next) == se)
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13558) 			WRITE_ONCE(parent_cfs_rq->h_load_next, NULL);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13559  	}
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13560  }
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13561  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
