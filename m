Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A91108
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Aug 2023 02:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693450069; x=1724986069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JukMVBoeGm7bggmEFNxpk2XVcnLSfmHdrdKVy66pDck=;
  b=I2y70TPWI71uR8HEmueRXlIzxdk/CXmZMKUUGI1B4fVUHRHI4TvjWttP
   EyyIdIDzj9dHO/Dqhigp3ca9AKXDh2aNzt37U84xQt+CVhyLhzEL7vd2v
   6nr0dA4tktwDElDImLbMLqQZ9TOwY1j/d60lOsLCQth4Kit/p6EGiUTys
   ho5rx1D+tYkqmoBjxRVeeGOzs3zWPjcRS8eJVToR/G/Ec9JeDt5qP5vUH
   nZ65clpzwsCU1OYr3T5ar3dDpkFY6FpeQ1Uya/u/EUQVqLIcii6H8q1AG
   xauKEZH+TgLci40XdQKZEC7bTHluMpMP/COQ+ZBFfmfLlw6pkyDPNNAZ4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355294875"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="355294875"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 19:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="732875965"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="732875965"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Aug 2023 19:47:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbXij-000AVP-2H;
	Thu, 31 Aug 2023 02:47:45 +0000
Date: Thu, 31 Aug 2023 10:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [paulmck-rcu:dev.2023.08.22a 63/69]
 kernel/locking/locktorture.c:294:20-23: ERROR: t is NULL but dereferenced.
Message-ID: <202308311022.j7jKnIdL-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.22a
head:   354957ec11dc80eac68c4b1e10c237d69adc1833
commit: 758918804e0d5216981df3cef99ffd7ba0842192 [63/69] locktorture: Add indication of task write-holding lock
:::::: branch date: 6 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-053-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311022.j7jKnIdL-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230831/202308311022.j7jKnIdL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308311022.j7jKnIdL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/locking/locktorture.c:294:20-23: ERROR: t is NULL but dereferenced.
   kernel/locking/locktorture.c:294:43-47: ERROR: t is NULL but dereferenced.

vim +294 kernel/locking/locktorture.c

bdd8d60bd4047a Paul E. McKenney 2023-08-23  284  
94a8fb5e4673d7 Paul E. McKenney 2023-08-22  285  static int torture_spin_lock_dump(struct notifier_block *nb, unsigned long v, void *ptr)
94a8fb5e4673d7 Paul E. McKenney 2023-08-22  286  {
758918804e0d52 Paul E. McKenney 2023-08-23  287  	struct task_struct *t = READ_ONCE(lock_is_write_held);
758918804e0d52 Paul E. McKenney 2023-08-23  288  
94a8fb5e4673d7 Paul E. McKenney 2023-08-22  289  	pr_alert("%s invoked: v=%lu, duration=%lu.\n", __func__, v, (unsigned long)ptr);
758918804e0d52 Paul E. McKenney 2023-08-23  290  	if (t) {
758918804e0d52 Paul E. McKenney 2023-08-23  291  		pr_alert("%s No task holding lock.\n", __func__);
758918804e0d52 Paul E. McKenney 2023-08-23  292  	} else {
758918804e0d52 Paul E. McKenney 2023-08-23  293  		pr_alert("%s Lock held by task %ps %d %*s\n",
758918804e0d52 Paul E. McKenney 2023-08-23 @294  			 __func__, t, t->pid, TASK_COMM_LEN, t->comm);
758918804e0d52 Paul E. McKenney 2023-08-23  295  		sched_show_task(t);
758918804e0d52 Paul E. McKenney 2023-08-23  296  	}
bdd8d60bd4047a Paul E. McKenney 2023-08-23  297  	spinlock_dump(&torture_spinlock, true);
94a8fb5e4673d7 Paul E. McKenney 2023-08-22  298  	return NOTIFY_OK;
94a8fb5e4673d7 Paul E. McKenney 2023-08-22  299  }
94a8fb5e4673d7 Paul E. McKenney 2023-08-22  300  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
