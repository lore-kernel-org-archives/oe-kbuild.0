Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7B0A21
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jun 2024 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717414072; cv=none; b=G0zLu2MvIrZaW8twzt/lU1Qy/f+SXorvp5RrXlmSrx/OmXYsRnO7kwfilSpdy93SAuQpeHJkBQr0nPyu5IzgAaEGuGIrDyazJ3kfPkX1BVIA/qwc6u5UNjDUHaohXfTDdHLi80nm3vE+VnTTqtlyyzll9zdA1RWEjLRHqcFZgm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717414072; c=relaxed/simple;
	bh=+9r2+PQrbJBRGi1bEt6AefLLItEzgGxLQzc/7cBMTg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsz7PRUlaHjQ3taChevAkt+1I15WV1cUCZDSK7uZtP2wJhFlMPMy16hjDU5cuXLXOLLvs71k7HjY+7jw7YywIuKmS63k4XkfLKG203slhlQksHQICHLBgB/iMm3/yajCTFPUIhgWCG/KcjhUBYKvuJoyeFLvaVhMh+BVWiLz8cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN8Prcfj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN8Prcfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717414070; x=1748950070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+9r2+PQrbJBRGi1bEt6AefLLItEzgGxLQzc/7cBMTg8=;
  b=FN8PrcfjbFjpyif8ORqOOc0mz05W9087aiRMM9YNaJgDaAa7LZxjZPy+
   25dWToL91Piirx7oYJEn1gsW0qcF93465kgXEI+3gezlDXzJlLFSzvsbS
   edLU+WOSkt4Uy864l1UpSswNlhCnLovQvTj5vBbP08uzFdn04Skx7MUG2
   +MBDc4yxCKjiT7g3zcJOy3oTLJvQ6BYjOnfi/t2F2jXsKjqPJGPGe+NsR
   lyrlo/xgrFe8aDQnaG0BiGu1iHvdJnqXHEKwKdgB4zLt0KUZieNQ40dFo
   RmE9hJ/DyMDMGimZi5Jn+m81RLTZsg6dhvZdbMqHyBWhHKG3jUSDuZB/O
   g==;
X-CSE-ConnectionGUID: vXfV31/lTFOnzzK8DQB74w==
X-CSE-MsgGUID: aPwT0p70RSWgO6ExegVzgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="11872255"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="11872255"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 04:27:49 -0700
X-CSE-ConnectionGUID: hNEM5wcZSLyTA8VUsSLGmw==
X-CSE-MsgGUID: vNRMJZvXQlWkURrCpomFRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="60017400"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2024 04:27:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE5qs-000LTc-0p;
	Mon, 03 Jun 2024 11:27:46 +0000
Date: Mon, 3 Jun 2024 19:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] rcu-tasks: Fix access non-existent percpu rtpcp variable
 in rcu_tasks_need_gpcb()
Message-ID: <202406031955.KTGAW4fl-lkp@intel.com>
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
In-Reply-To: <20240603055229.23601-1-qiang.zhang1211@gmail.com>
References: <20240603055229.23601-1-qiang.zhang1211@gmail.com>
TO: Zqiang <qiang.zhang1211@gmail.com>
TO: paulmck@kernel.org
TO: frederic@kernel.org
TO: neeraj.upadhyay@kernel.org
TO: joel@joelfernandes.org
TO: urezki@gmail.com
CC: qiang.zhang1211@gmail.com
CC: rcu@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Zqiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on paulmck-rcu/dev]
[also build test WARNING on linus/master v6.10-rc2 next-20240603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zqiang/rcu-tasks-Fix-access-non-existent-percpu-rtpcp-variable-in-rcu_tasks_need_gpcb/20240603-135610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
patch link:    https://lore.kernel.org/r/20240603055229.23601-1-qiang.zhang1211%40gmail.com
patch subject: [PATCH] rcu-tasks: Fix access non-existent percpu rtpcp variable in rcu_tasks_need_gpcb()
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-141-20240603 (https://download.01.org/0day-ci/archive/20240603/202406031955.KTGAW4fl-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406031955.KTGAW4fl-lkp@intel.com/

smatch warnings:
kernel/rcu/tasks.h:278 cblist_init_generic() error: uninitialized symbol 'maxcpu'.

vim +/maxcpu +278 kernel/rcu/tasks.h

af051ca4e4231f Paul E. McKenney 2020-03-16  242  
cafafd67765b21 Paul E. McKenney 2021-11-05  243  // Initialize per-CPU callback lists for the specified flavor of
cb88f7f51bc6f3 Paul E. McKenney 2023-07-28  244  // Tasks RCU.  Do not enqueue callbacks before this function is invoked.
cafafd67765b21 Paul E. McKenney 2021-11-05  245  static void cblist_init_generic(struct rcu_tasks *rtp)
cafafd67765b21 Paul E. McKenney 2021-11-05  246  {
cafafd67765b21 Paul E. McKenney 2021-11-05  247  	int cpu;
8610b65680390a Paul E. McKenney 2021-11-12  248  	int lim;
da123016ca8cb5 Paul E. McKenney 2022-01-26  249  	int shift;
db390456e3abf6 Zqiang           2024-06-03  250  	int maxcpu;
cafafd67765b21 Paul E. McKenney 2021-11-05  251  
ab97152f88a4d5 Paul E. McKenney 2021-11-24  252  	if (rcu_task_enqueue_lim < 0) {
ab97152f88a4d5 Paul E. McKenney 2021-11-24  253  		rcu_task_enqueue_lim = 1;
ab97152f88a4d5 Paul E. McKenney 2021-11-24  254  		rcu_task_cb_adjust = true;
ab97152f88a4d5 Paul E. McKenney 2021-11-24  255  	} else if (rcu_task_enqueue_lim == 0) {
8610b65680390a Paul E. McKenney 2021-11-12  256  		rcu_task_enqueue_lim = 1;
ab97152f88a4d5 Paul E. McKenney 2021-11-24  257  	}
8610b65680390a Paul E. McKenney 2021-11-12  258  	lim = rcu_task_enqueue_lim;
8610b65680390a Paul E. McKenney 2021-11-12  259  
cafafd67765b21 Paul E. McKenney 2021-11-05  260  	for_each_possible_cpu(cpu) {
cafafd67765b21 Paul E. McKenney 2021-11-05  261  		struct rcu_tasks_percpu *rtpcp = per_cpu_ptr(rtp->rtpcpu, cpu);
cafafd67765b21 Paul E. McKenney 2021-11-05  262  
cafafd67765b21 Paul E. McKenney 2021-11-05  263  		WARN_ON_ONCE(!rtpcp);
cafafd67765b21 Paul E. McKenney 2021-11-05  264  		if (cpu)
381a4f3b38603a Paul E. McKenney 2021-11-08  265  			raw_spin_lock_init(&ACCESS_PRIVATE(rtpcp, lock));
9b073de1c7a354 Paul E. McKenney 2021-11-08  266  		if (rcu_segcblist_empty(&rtpcp->cblist))
9b073de1c7a354 Paul E. McKenney 2021-11-08  267  			rcu_segcblist_init(&rtpcp->cblist);
d363f833c6d883 Paul E. McKenney 2021-11-10  268  		INIT_WORK(&rtpcp->rtp_work, rcu_tasks_invoke_cbs_wq);
d363f833c6d883 Paul E. McKenney 2021-11-10  269  		rtpcp->cpu = cpu;
d363f833c6d883 Paul E. McKenney 2021-11-10  270  		rtpcp->rtpp = rtp;
434c9eefb959c3 Paul E. McKenney 2022-05-16  271  		if (!rtpcp->rtp_blkd_tasks.next)
434c9eefb959c3 Paul E. McKenney 2022-05-16  272  			INIT_LIST_HEAD(&rtpcp->rtp_blkd_tasks);
46faf9d8e1d52e Paul E. McKenney 2024-02-05  273  		if (!rtpcp->rtp_exit_list.next)
46faf9d8e1d52e Paul E. McKenney 2024-02-05  274  			INIT_LIST_HEAD(&rtpcp->rtp_exit_list);
db390456e3abf6 Zqiang           2024-06-03  275  		maxcpu = cpu;
cafafd67765b21 Paul E. McKenney 2021-11-05  276  	}
5fc8cbe4cf0fd3 Shigeru Yoshida  2022-08-03  277  
db390456e3abf6 Zqiang           2024-06-03 @278  	rcu_task_cpu_ids = maxcpu + 1;
db390456e3abf6 Zqiang           2024-06-03  279  	if (lim > rcu_task_cpu_ids)
db390456e3abf6 Zqiang           2024-06-03  280  		lim = rcu_task_cpu_ids;
db390456e3abf6 Zqiang           2024-06-03  281  	shift = ilog2(rcu_task_cpu_ids / lim);
db390456e3abf6 Zqiang           2024-06-03  282  	if (((rcu_task_cpu_ids - 1) >> shift) >= lim)
db390456e3abf6 Zqiang           2024-06-03  283  		shift++;
db390456e3abf6 Zqiang           2024-06-03  284  	WRITE_ONCE(rtp->percpu_enqueue_shift, shift);
db390456e3abf6 Zqiang           2024-06-03  285  	WRITE_ONCE(rtp->percpu_dequeue_lim, lim);
db390456e3abf6 Zqiang           2024-06-03  286  	smp_store_release(&rtp->percpu_enqueue_lim, lim);
db390456e3abf6 Zqiang           2024-06-03  287  	pr_info("%s: Setting shift to %d and lim to %d rcu_task_cb_adjust=%d rcu_task_cpu_ids=%d.\n",
db390456e3abf6 Zqiang           2024-06-03  288  			rtp->name, data_race(rtp->percpu_enqueue_shift), data_race(rtp->percpu_enqueue_lim),
db390456e3abf6 Zqiang           2024-06-03  289  			rcu_task_cb_adjust, rcu_task_cpu_ids);
cafafd67765b21 Paul E. McKenney 2021-11-05  290  }
cafafd67765b21 Paul E. McKenney 2021-11-05  291  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
