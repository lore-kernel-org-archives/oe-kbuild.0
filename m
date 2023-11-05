Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00128C0C
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/t3Bxdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699176007; x=1730712007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cWZQEF1vzMb7QjWZ+f41P1MhDMkpLCLP72WtjPFhSf8=;
  b=g/t3BxdwPeYn5XzDhQySTlDl9IBcb34fVty5AwjKRQJQow/FZaTFDqJi
   2VQbhgwxqJBgEmVoNjuPnlkq/Sw0WudlOnc2Yg/7emFGAliN6oAIMX6Aa
   zUu1/R+KouI2pWKkQ/Q4Tmjyad7nyVzbYgIIpFcasw7fwLMrw0iNo6qiH
   U92sEdysXo1xuqa/tLcpZNKMca5Ip+JpeS+oOwZog3uxWGVJTKJsZSaS1
   JnPekbNsX0TonD0aQ8UOuBxmmenVuVcqrYUtEkP/nYYqKOMBY8P9O6oar
   LPC4ETKi+xRKYYr1sfBbrIBYgKC6xW4lqZWHIsfAY8NpP0ehLq+eOsCXl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="374166600"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="374166600"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="852695621"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="852695621"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2023 01:20:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzZIZ-0005Fz-0k;
	Sun, 05 Nov 2023 09:20:03 +0000
Date: Sun, 5 Nov 2023 17:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.11.01a 18/37]
 kernel/locking/qspinlock.c:691:6: sparse: sparse: symbol
 '__pv_spinlock_dump' was not declared. Should it be static?
Message-ID: <202311051722.Z5u3VXS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 851f9c70733ed644c8a03d8f93f9876942181bee was found in branch paulmck-rcu/dev.2023.11.01a, not in new branch paulmck-rcu/dev.2023.11.02a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.11.01a
head:   20f4197bb35ccf39ddfb8563865092eb09450556
commit: 851f9c70733ed644c8a03d8f93f9876942181bee [18/37] EXP qspinlock: Add spinlock_dump() to dump lock state
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-122-20231031 (https://download.01.org/0day-ci/archive/20231105/202311051722.Z5u3VXS0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051722.Z5u3VXS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311051722.Z5u3VXS0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/qspinlock.c: note: in included file:
>> kernel/locking/qspinlock.c:691:6: sparse: sparse: symbol '__pv_spinlock_dump' was not declared. Should it be static?

vim +/__pv_spinlock_dump +691 kernel/locking/qspinlock.c

851f9c70733ed6 Paul E. McKenney 2023-08-23  690  
851f9c70733ed6 Paul E. McKenney 2023-08-23 @691  void spinlock_dump(spinlock_t *sp, bool full)
851f9c70733ed6 Paul E. McKenney 2023-08-23  692  {
851f9c70733ed6 Paul E. McKenney 2023-08-23  693  	int cpu;
851f9c70733ed6 Paul E. McKenney 2023-08-23  694  	int i = 0;
851f9c70733ed6 Paul E. McKenney 2023-08-23  695  	int idx;
851f9c70733ed6 Paul E. McKenney 2023-08-23  696  	struct mcs_spinlock *msp;
851f9c70733ed6 Paul E. McKenney 2023-08-23  697  	struct qspinlock qval = sp->rlock.raw_lock;
851f9c70733ed6 Paul E. McKenney 2023-08-23  698  
851f9c70733ed6 Paul E. McKenney 2023-08-23  699  	cpu = tail_to_cpu(qval.tail);
851f9c70733ed6 Paul E. McKenney 2023-08-23  700  	idx = tail_to_idx(qval.tail);
851f9c70733ed6 Paul E. McKenney 2023-08-23  701  	pr_alert("%s: %ps %#x (%c%c%c%c %#x: %d[%d]\n",
851f9c70733ed6 Paul E. McKenney 2023-08-23  702  		 __func__, sp, (unsigned int)atomic_read(&qval.val),
851f9c70733ed6 Paul E. McKenney 2023-08-23  703  		 ".L"[!!qval.locked],
851f9c70733ed6 Paul E. McKenney 2023-08-23  704  		 ".P"[!!qval.pending],
851f9c70733ed6 Paul E. McKenney 2023-08-23  705  		 ".Q"[cpu >= 0 && idx >= 0],
851f9c70733ed6 Paul E. McKenney 2023-08-23  706  		 ".F"[!!full],
851f9c70733ed6 Paul E. McKenney 2023-08-23  707  		 (unsigned int)qval.tail, cpu, idx);
851f9c70733ed6 Paul E. McKenney 2023-08-23  708  	pr_alert("%s: _Q_TAIL_CPU_OFFSET=%d _Q_TAIL_IDX_MASK=%d _Q_TAIL_IDX_OFFSET=%d _Q_LOCKED_VAL=%d _Q_TAIL_OFFSET=%d sizeof(->tail)=%lu\n",
851f9c70733ed6 Paul E. McKenney 2023-08-23  709  		__func__, _Q_TAIL_CPU_OFFSET, _Q_TAIL_IDX_MASK, _Q_TAIL_IDX_OFFSET, _Q_LOCKED_VAL, _Q_TAIL_OFFSET, (unsigned long)sizeof(qval.tail));
851f9c70733ed6 Paul E. McKenney 2023-08-23  710  	if (!full || cpu < 0 || idx < 0)
851f9c70733ed6 Paul E. McKenney 2023-08-23  711  		return;
851f9c70733ed6 Paul E. McKenney 2023-08-23  712  	msp = per_cpu_ptr(&qnodes[idx].mcs, cpu);
851f9c70733ed6 Paul E. McKenney 2023-08-23  713  	while (i++ < nr_cpu_ids && (msp = next_to_prev(msp, &cpu, &idx))) {
851f9c70733ed6 Paul E. McKenney 2023-08-23  714  		pr_alert("%s: Q%d CPU %d[%d] %c%d\n", __func__, i, cpu, idx,
851f9c70733ed6 Paul E. McKenney 2023-08-23  715  			 ".L"[!!msp->locked], msp->count);
851f9c70733ed6 Paul E. McKenney 2023-08-23  716  	}
851f9c70733ed6 Paul E. McKenney 2023-08-23  717  	if (i >= nr_cpu_ids && cpu >= 0 && idx >= 0)
851f9c70733ed6 Paul E. McKenney 2023-08-23  718  		pr_alert("%s: Queue output truncated.\n", __func__);
851f9c70733ed6 Paul E. McKenney 2023-08-23  719  	else
851f9c70733ed6 Paul E. McKenney 2023-08-23  720  		pr_alert("%s: End of queue.\n", __func__);
851f9c70733ed6 Paul E. McKenney 2023-08-23  721  }
851f9c70733ed6 Paul E. McKenney 2023-08-23  722  EXPORT_SYMBOL(spinlock_dump);
851f9c70733ed6 Paul E. McKenney 2023-08-23  723  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
