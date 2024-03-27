Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D995717545
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Mar 2024 03:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711509556; cv=none; b=JP/hflJs6o5sEQnQwXwByIGYpVIZB7H5tdx6TiC7OTqAci1SUnZdCV14SgncrcQNB8UGffT4IemaF0UgcEMRVVHcvrzlUqBjvrUXLp2ferrVy62nVCPzylfBtdpJ6/XIHJz/DO5zss/MMtfZicysWp7XxmVfmMuutCMiaRsEGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711509556; c=relaxed/simple;
	bh=rw6qavmh8WhpjrcDu3bxjvVPESRVFID1MnnmhwLLgSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LuhohXXzKFclmRlmL+7PkjnGaZf4s9NwnxfB4SHfTPu+AKGbVxZdoBUPpM2/+SGEdR38fDMrhojtqqNKWy++FGhTjjAkyTbI61+rbBpNIdweKwST8ExlCLZhSjxcfEqxV7jVmufhQF1wRGrlWgbQAGPkTfbsnbew8+C4COOKjo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACQanPTB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACQanPTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711509555; x=1743045555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rw6qavmh8WhpjrcDu3bxjvVPESRVFID1MnnmhwLLgSA=;
  b=ACQanPTBdCZ2OXGog7fz9R+St/aGd821ViFf1xpsdmdAMoqC5zl+xVWm
   YxU2mysjUitx96RAxouX0DbypjIwdKv2Ymq8LVL2r6tyuz4/CamucRsPs
   M2YmTn9O8kipfo5PJ0F2u6DuxzV0V3upxcw77ti8sJX8CdHWiPI2RtYzq
   CipcJVQy+cwaVlfpiA6c/a5PMw3GdMZkA7uKhXxFG01w6Aq7DHUUBo8f9
   1S2LHJVND0ZMZlc7OLt/WoocyZkGllohoF/Mo3oS+pZtOE66fMrttOy8V
   aN0x82c8Wp+hJJj/YxfhD79ELhgm/9t3Z9a+mkP2RWKLZWpD/kF0UV/8y
   w==;
X-CSE-ConnectionGUID: M8CRd74cTFeo4nz9eT4IDA==
X-CSE-MsgGUID: oZK6vd2wSRCPu+UUWJN1ZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6722567"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6722567"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 20:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16012211"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2024 20:19:10 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpJoj-0000h4-1P;
	Wed, 27 Mar 2024 03:19:09 +0000
Date: Wed, 27 Mar 2024 11:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paulmck-rcu:50ways.2024.03.26a 59/59] kernel/rcu/tree.c:2242
 rcu_gp_kthread() warn: sleeping in atomic context
Message-ID: <202403271124.K0Oicb6g-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git 50ways.2024.03.26a
head:   097f5787a886cf5dbe7a2c374e5937fd4d5744ab
commit: 097f5787a886cf5dbe7a2c374e5937fd4d5744ab [59/59] rcu: Test code for "50 ways to hang your kernel"
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20240327 (https://download.01.org/0day-ci/archive/20240327/202403271124.K0Oicb6g-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403271124.K0Oicb6g-lkp@intel.com/

smatch warnings:
kernel/rcu/tree.c:2242 rcu_gp_kthread() warn: sleeping in atomic context

vim +2242 kernel/rcu/tree.c

097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2221  
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2222  /*
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2223   * Body of kthread that handles grace periods.
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2224   */
0854a05c9fa554 kernel/rcu/tree.c Paul E. McKenney 2018-07-03  2225  static int __noreturn rcu_gp_kthread(void *unused)
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2226  {
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2227  	static DECLARE_WORK(deadlock_work, deadlock_work_fn);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2228  
5871968d531f39 kernel/rcu/tree.c Paul E. McKenney 2015-02-24  2229  	rcu_bind_gp_kthread();
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2230  	if (whichverse == 2 || whichverse == 3 || whichverse == 4) {
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2231  		spin_lock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2232  		spin_unlock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2233  	}
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2234  	if (whichverse == 1 || whichverse == 1001) {
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2235  		spin_lock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2236  		spin_lock(&spinlock_b);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2237  		spin_unlock(&spinlock_b);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2238  		spin_unlock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2239  	}
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2240  	if (whichverse == 2) {
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2241  		spin_lock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26 @2242  		schedule();
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2243  		spin_unlock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2244  	}
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2245  	if (whichverse == 1001) {
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2246  		spin_lock(&spinlock_b);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2247  		spin_lock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2248  		spin_unlock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2249  		spin_unlock(&spinlock_b);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2250  	}
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2251  	if (whichverse == 1002) {
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2252  		raw_spin_lock(&raw_spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2253  		spin_lock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2254  		spin_unlock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2255  		raw_spin_unlock(&raw_spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2256  	}
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2257  	if (whichverse == 1003) {
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2258  		preempt_disable();
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2259  		spin_lock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2260  		spin_unlock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2261  		preempt_enable();
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2262  		spin_lock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2263  		spin_unlock(&spinlock_a);
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2264  	}
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2265  	if (whichverse == 2001)
097f5787a886cf kernel/rcu/tree.c Paul E. McKenney 2024-03-26  2266  		queue_work(system_unbound_wq, &deadlock_work);
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2267  	for (;;) {
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2268  
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2269  		/* Handle grace-period start. */
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2270  		for (;;) {
0f11ad323dd3d3 kernel/rcu/tree.c Paul E. McKenney 2020-02-10  2271  			trace_rcu_grace_period(rcu_state.name, rcu_state.gp_seq,
63c4db78e80407 kernel/rcutree.c  Paul E. McKenney 2013-08-09  2272  					       TPS("reqwait"));
683954e55c9814 kernel/rcu/tree.c Neeraj Upadhyay  2020-11-16  2273  			WRITE_ONCE(rcu_state.gp_state, RCU_GP_WAIT_GPS);
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney 2018-07-05  2274  			swait_event_idle_exclusive(rcu_state.gp_wq,
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney 2018-07-05  2275  					 READ_ONCE(rcu_state.gp_flags) &
4cdfc175c25c89 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2276  					 RCU_GP_FLAG_INIT);
55b2dcf5870004 kernel/rcu/tree.c Paul E. McKenney 2020-04-01  2277  			rcu_gp_torture_wait();
683954e55c9814 kernel/rcu/tree.c Neeraj Upadhyay  2020-11-16  2278  			WRITE_ONCE(rcu_state.gp_state, RCU_GP_DONE_GPS);
78e4bc34e5d966 kernel/rcu/tree.c Paul E. McKenney 2013-09-24  2279  			/* Locking provides needed memory barrier. */
0854a05c9fa554 kernel/rcu/tree.c Paul E. McKenney 2018-07-03  2280  			if (rcu_gp_init())
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2281  				break;
cee43939893337 kernel/rcu/tree.c Paul E. McKenney 2018-03-02  2282  			cond_resched_tasks_rcu_qs();
9cbc5b97029bff kernel/rcu/tree.c Paul E. McKenney 2018-07-05  2283  			WRITE_ONCE(rcu_state.gp_activity, jiffies);
73a860cd58a1eb kernel/rcu/tree.c Paul E. McKenney 2014-08-14  2284  			WARN_ON(signal_pending(current));
0f11ad323dd3d3 kernel/rcu/tree.c Paul E. McKenney 2020-02-10  2285  			trace_rcu_grace_period(rcu_state.name, rcu_state.gp_seq,
63c4db78e80407 kernel/rcutree.c  Paul E. McKenney 2013-08-09  2286  					       TPS("reqwaitsig"));
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2287  		}
7fdefc10e1d730 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2288  
4cdfc175c25c89 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2289  		/* Handle quiescent-state forcing. */
c3854a055bc834 kernel/rcu/tree.c Paul E. McKenney 2018-07-05  2290  		rcu_gp_fqs_loop();
4cdfc175c25c89 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2291  
4cdfc175c25c89 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2292  		/* Handle grace-period end. */
683954e55c9814 kernel/rcu/tree.c Neeraj Upadhyay  2020-11-16  2293  		WRITE_ONCE(rcu_state.gp_state, RCU_GP_CLEANUP);
0854a05c9fa554 kernel/rcu/tree.c Paul E. McKenney 2018-07-03  2294  		rcu_gp_cleanup();
683954e55c9814 kernel/rcu/tree.c Neeraj Upadhyay  2020-11-16  2295  		WRITE_ONCE(rcu_state.gp_state, RCU_GP_CLEANED);
4cdfc175c25c89 kernel/rcutree.c  Paul E. McKenney 2012-06-22  2296  	}
b3dbec76e5334f kernel/rcutree.c  Paul E. McKenney 2012-06-18  2297  }
b3dbec76e5334f kernel/rcutree.c  Paul E. McKenney 2012-06-18  2298  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
