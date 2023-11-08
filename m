Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E7CD268
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BS0HRaPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699433476; x=1730969476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgN/bJrKft0/Tv1B6x2gnio4nwFhtB/9xWPvp5GzEcU=;
  b=BS0HRaPHCdCuESVdDGNR8bgInrtyT3M0q6gzQASa6Fxn6gsmUHzL8nil
   YBOZISWcS7Lk4aaCTBA+6eE+zPSx5CQThlvDFxhYeoa0FndvunAJXFvLx
   AtVV/DCLO6Wmp4H7Jd1kdejWdOFFa4GcYNDj2HgEwycKHG/2UGR88Jzbb
   2Ud35REs/BZxanr6LopLbZkVFXpiGKRdSwfIUc95CKIKjUAnObiYOZ/Yj
   qb1q+G1/IMAgSE8wF593HCJurxjrzNmh2n/rLsQcyv4bSdcQOGk1G4da8
   Zwy9Z0/3vHHRsBaIiYquFG3hv1ek+0LhToG9ppPlfAOMGCAT+05jq93Em
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="393637863"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="393637863"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 00:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="739428819"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="739428819"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Nov 2023 00:51:15 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0eHJ-0007pj-0r;
	Wed, 08 Nov 2023 08:51:13 +0000
Date: Wed, 8 Nov 2023 16:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/rcu/tasks.h:1254:15: sparse: sparse: cast to non-scalar
Message-ID: <202311081615.nXQAsAIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/rcu/tasks.h:1254:15: sparse: sparse: cast to non-scalar"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   305230142ae0637213bf6e04f6d9f10bbcb74af8
commit: 0bcb386857376224b5fd3f38b6e3173ec74d8d36 rcu-tasks: Untrack blocked RCU Tasks Trace at reader end
date:   1 year, 5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 5 months ago
config: x86_64-randconfig-121-20231101 (https://download.01.org/0day-ci/archive/20231108/202311081615.nXQAsAIS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081615.nXQAsAIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311081615.nXQAsAIS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/update.c: note: in included file:
>> kernel/rcu/tasks.h:1254:15: sparse: sparse: cast to non-scalar
>> kernel/rcu/tasks.h:1254:15: sparse: sparse: cast from non-scalar

vim +1254 kernel/rcu/tasks.h

3847b64570b1753 Paul E. McKenney 2022-05-23  1244  
d5f177d35c24429 Paul E. McKenney 2020-03-09  1245  /* If we are the last reader, wake up the grace-period kthread. */
a5c071ccfa17285 Paul E. McKenney 2021-07-28  1246  void rcu_read_unlock_trace_special(struct task_struct *t)
d5f177d35c24429 Paul E. McKenney 2020-03-09  1247  {
0bcb38685737622 Paul E. McKenney 2022-05-17  1248  	unsigned long flags;
0bcb38685737622 Paul E. McKenney 2022-05-17  1249  	struct rcu_tasks_percpu *rtpcp;
0bcb38685737622 Paul E. McKenney 2022-05-17  1250  	union rcu_special trs;
0bcb38685737622 Paul E. McKenney 2022-05-17  1251  
0bcb38685737622 Paul E. McKenney 2022-05-17  1252  	// Open-coded full-word version of rcu_ld_need_qs().
0bcb38685737622 Paul E. McKenney 2022-05-17  1253  	smp_mb(); // Enforce full grace-period ordering.
0bcb38685737622 Paul E. McKenney 2022-05-17 @1254  	trs = smp_load_acquire(&t->trc_reader_special);
276c410448dbca3 Paul E. McKenney 2020-03-17  1255  
3847b64570b1753 Paul E. McKenney 2022-05-23  1256  	if (IS_ENABLED(CONFIG_TASKS_TRACE_RCU_READ_MB) && t->trc_reader_special.b.need_mb)
276c410448dbca3 Paul E. McKenney 2020-03-17  1257  		smp_mb(); // Pairs with update-side barriers.
276c410448dbca3 Paul E. McKenney 2020-03-17  1258  	// Update .need_qs before ->trc_reader_nesting for irq/NMI handlers.
0bcb38685737622 Paul E. McKenney 2022-05-17  1259  	if (trs.b.need_qs == (TRC_NEED_QS_CHECKED | TRC_NEED_QS)) {
3847b64570b1753 Paul E. McKenney 2022-05-23  1260  		u8 result = rcu_trc_cmpxchg_need_qs(t, TRC_NEED_QS_CHECKED | TRC_NEED_QS,
3847b64570b1753 Paul E. McKenney 2022-05-23  1261  						       TRC_NEED_QS_CHECKED);
3847b64570b1753 Paul E. McKenney 2022-05-23  1262  
0bcb38685737622 Paul E. McKenney 2022-05-17  1263  		WARN_ONCE(result != trs.b.need_qs, "%s: result = %d", __func__, result);
0bcb38685737622 Paul E. McKenney 2022-05-17  1264  	}
0bcb38685737622 Paul E. McKenney 2022-05-17  1265  	if (trs.b.blocked) {
0bcb38685737622 Paul E. McKenney 2022-05-17  1266  		rtpcp = per_cpu_ptr(rcu_tasks_trace.rtpcpu, t->trc_blkd_cpu);
0bcb38685737622 Paul E. McKenney 2022-05-17  1267  		raw_spin_lock_irqsave_rcu_node(rtpcp, flags);
0bcb38685737622 Paul E. McKenney 2022-05-17  1268  		list_del_init(&t->trc_blkd_node);
0bcb38685737622 Paul E. McKenney 2022-05-17  1269  		WRITE_ONCE(t->trc_reader_special.b.blocked, false);
0bcb38685737622 Paul E. McKenney 2022-05-17  1270  		raw_spin_unlock_irqrestore_rcu_node(rtpcp, flags);
3847b64570b1753 Paul E. McKenney 2022-05-23  1271  	}
a5c071ccfa17285 Paul E. McKenney 2021-07-28  1272  	WRITE_ONCE(t->trc_reader_nesting, 0);
d5f177d35c24429 Paul E. McKenney 2020-03-09  1273  }
d5f177d35c24429 Paul E. McKenney 2020-03-09  1274  EXPORT_SYMBOL_GPL(rcu_read_unlock_trace_special);
d5f177d35c24429 Paul E. McKenney 2020-03-09  1275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
