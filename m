Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0831355D
	for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 03:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778988557; cv=none; b=BwEju6V3h8/whcAsR2Sa2cPPgKun/X7haHP4R2SI+qcBEmCWGq4IMfzCSGDX8TcPTAC86MOy2vRqmk9MWOU/XEjF9OcfEZXpeESxuP6ywptHD8kk6p3F+11cyW4ICfgJ6+lPuR2vpvtNOb4mSjLV1BC7CZT26dLEw2fuk86p7g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778988557; c=relaxed/simple;
	bh=UpeRO9E1bPdgA5AKoDSF+HxK63pQ9zhF9+nzeyX0QIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AgKkGp02cEAVcvg4dok45MznMfc6GF6wTshaRusHCXsSeZbLk88soLoyjVPyAXQwbf3OMTW94lxrvGfCrW/WYlOzjb0FyfvFSedop4XHnysdbs7aie5efHxvH0UseHm0KAP3uhqsC32jUjYLgjmic11cQKjhDhqUe31i22/k52I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maeJYT09; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maeJYT09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778988554; x=1810524554;
  h=date:from:to:cc:subject:message-id;
  bh=UpeRO9E1bPdgA5AKoDSF+HxK63pQ9zhF9+nzeyX0QIc=;
  b=maeJYT09Ty1ZxOpM7KHBIqDcKJS4m49Ec7jekzsel077pEYgcmYts7KA
   YHmsQ2NtX2c0ChKA6i0HcJ6keX7Goj1UVf4rDm11V6LHHOzMR8BeUakfz
   +86DFInhQ+7v+d/4epfldaEw5CVsltKYWbqS/DF9GWSWwTtrcwrHUy9lJ
   /LKYJUqX4NKE/5iMJBaF5DmUghulAIlBKxaYVEJNDhCkGc0HyVGu3KNA8
   p4nARm+x8c/Qh0jOx65JA/Ade9Ps6/4DE/qMKeHKP+N2vDdM9JC5SeaOX
   s4PbuZdnsJaTLhNSOhqusW8r92D6CwhpZF5RbnZbn5fjDsPG5Kb7Zha3X
   A==;
X-CSE-ConnectionGUID: OlYsOahZQ9OMS0AutM0jgQ==
X-CSE-MsgGUID: MbZGt2S6S1uCo8Rj9U5mtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90583155"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="90583155"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 20:29:14 -0700
X-CSE-ConnectionGUID: 5oAwKJ2oRKCIpdJWWry9aQ==
X-CSE-MsgGUID: +hb/Ue/RSpKMXZs7PgxkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="243075117"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2026 20:29:13 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOSBh-000000001KW-4A9n;
	Sun, 17 May 2026 03:29:09 +0000
Date: Sun, 17 May 2026 11:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paulmckrcu:dev.2026.05.08a 39/43] kernel/rcu/tree_exp.h:822
 rcu_print_task_exp_stall() error: we previously assumed 'rnp->exp_tasks'
 could be null (see line 818)
Message-ID: <202605171129.6vsB2TG2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev.2026.05.08a
head:   86ed69edce527e32495da86900fe50b9ca3266d9
commit: b32c53e658b25c6ed973a78b40bddc95e1948eac [39/43] rcu: Make rcu_print_task_exp_stall() dump ->dqs_blkd_tasks
:::::: branch date: 6 hours ago
:::::: commit date: 10 hours ago
config: parisc-randconfig-r071-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171129.6vsB2TG2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605171129.6vsB2TG2-lkp@intel.com/

smatch warnings:
kernel/rcu/tree_exp.h:822 rcu_print_task_exp_stall() error: we previously assumed 'rnp->exp_tasks' could be null (see line 818)

vim +822 kernel/rcu/tree_exp.h

40e0a6cfd53e37 Paul E. McKenney 2016-04-15  805  
d87cda5094585b Paul E. McKenney 2019-01-11  806  /*
d87cda5094585b Paul E. McKenney 2019-01-11  807   * Scan the current list of tasks blocked within RCU read-side critical
d87cda5094585b Paul E. McKenney 2019-01-11  808   * sections, printing out the tid of each that is blocking the current
d87cda5094585b Paul E. McKenney 2019-01-11  809   * expedited grace period.
d87cda5094585b Paul E. McKenney 2019-01-11  810   */
d87cda5094585b Paul E. McKenney 2019-01-11  811  static int rcu_print_task_exp_stall(struct rcu_node *rnp)
d87cda5094585b Paul E. McKenney 2019-01-11  812  {
314eeb43e5f228 Paul E. McKenney 2020-01-03  813  	unsigned long flags;
d87cda5094585b Paul E. McKenney 2019-01-11  814  	int ndetected = 0;
314eeb43e5f228 Paul E. McKenney 2020-01-03  815  	struct task_struct *t;
d87cda5094585b Paul E. McKenney 2019-01-11  816  
314eeb43e5f228 Paul E. McKenney 2020-01-03  817  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
b32c53e658b25c Paul E. McKenney 2026-05-16 @818  	if (!rnp->exp_tasks && list_empty(&rnp->dqs_blkd_tasks)) {
3c1566bca3f834 Zqiang           2022-12-24  819  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
3c1566bca3f834 Zqiang           2022-12-24  820  		return 0;
3c1566bca3f834 Zqiang           2022-12-24  821  	}
d87cda5094585b Paul E. McKenney 2019-01-11 @822  	t = list_entry(rnp->exp_tasks->prev,
d87cda5094585b Paul E. McKenney 2019-01-11  823  		       struct task_struct, rcu_node_entry);
d87cda5094585b Paul E. McKenney 2019-01-11  824  	list_for_each_entry_continue(t, &rnp->blkd_tasks, rcu_node_entry) {
d87cda5094585b Paul E. McKenney 2019-01-11  825  		pr_cont(" P%d", t->pid);
d87cda5094585b Paul E. McKenney 2019-01-11  826  		ndetected++;
d87cda5094585b Paul E. McKenney 2019-01-11  827  	}
b32c53e658b25c Paul E. McKenney 2026-05-16  828  	list_for_each_entry(t, &rnp->dqs_blkd_tasks, rcu_node_entry) {
b32c53e658b25c Paul E. McKenney 2026-05-16  829  		pr_cont(" Q%d", t->pid);
b32c53e658b25c Paul E. McKenney 2026-05-16  830  		ndetected++;
b32c53e658b25c Paul E. McKenney 2026-05-16  831  	}
314eeb43e5f228 Paul E. McKenney 2020-01-03  832  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
d87cda5094585b Paul E. McKenney 2019-01-11  833  	return ndetected;
d87cda5094585b Paul E. McKenney 2019-01-11  834  }
d87cda5094585b Paul E. McKenney 2019-01-11  835  

:::::: The code at line 822 was first introduced by commit
:::::: d87cda5094585b7a0f62075de68266cb9c1b35ca rcu: Move rcu_print_task_exp_stall() to tree_exp.h

:::::: TO: Paul E. McKenney <paulmck@linux.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
