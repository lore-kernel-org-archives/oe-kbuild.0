Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91A517E
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 00:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675642662; x=1707178662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wby/Erwqr9LsmmURl8qONX0Es9CTqNAXBh7ufmEOEzA=;
  b=ItOV22+DErX1EoC5PmOKzTPrhdEvwfkcr26SZVhVnhp3oy/Y16Hp0dDO
   yFqCETfgbG/IGBvLPAWTP5DJzlw0AK4Lb3aRkZAP0Ih17FK5KHx17dXWs
   0EtsKAzAcSralT4AQM5OBMMID68Zto8LcnjcZcAeHD855dwITNqAk7T2H
   67BmzyCfnLsYbI5r3AuoGITSzZw/nERT7vTUPopexQNUMgii5V1nhB78Z
   Jmb4XzR/gTzSrGbm3cOIrevoxMfPDtUwZw/B2xBh4+VBK5/usVZfO/B9Y
   Dn1Z6iR3jTuS3GE6UCrOlTacWekKCFhG88np8gunJ5QCbTqSIHPwey8Nz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393703913"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="393703913"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 16:17:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="698683141"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="698683141"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 16:17:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOpCW-0002IS-1g;
	Mon, 06 Feb 2023 00:17:40 +0000
Date: Mon, 6 Feb 2023 08:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-5.10 21/35] kernel/rcu/tree.c:3010
 __call_rcu_common() warn: inconsistent returns 'flags'.
Message-ID: <202302060843.xF6SQrdW-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   917140b0e65de28b093b48a9c536ae742716658c
commit: 7f98c02e61b733963371013a5b60199f0d97304b [21/35] BACKPORT: FROMGIT: rcu: Make call_rcu() lazy to save power
:::::: branch date: 15 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230206/202302060843.xF6SQrdW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/rcu/tree.c:3010 __call_rcu_common() warn: inconsistent returns 'flags'.

vim +/flags +3010 kernel/rcu/tree.c

b2b00ddf193bf8 kernel/rcu/tree.c Paul E. McKenney        2019-10-30  2952  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2953  static void
7f98c02e61b733 kernel/rcu/tree.c Joel Fernandes (Google  2022-10-16  2954) __call_rcu_common(struct rcu_head *head, rcu_callback_t func, bool lazy)
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2955  {
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2956  	unsigned long flags;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2957  	struct rcu_data *rdp;
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2958  	bool was_alldone;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2959  
b8f2ed538477d9 kernel/rcu/tree.c Paul E. McKenney        2016-08-23  2960  	/* Misaligned rcu_head! */
b8f2ed538477d9 kernel/rcu/tree.c Paul E. McKenney        2016-08-23  2961  	WARN_ON_ONCE((unsigned long)head & (sizeof(void *) - 1));
b8f2ed538477d9 kernel/rcu/tree.c Paul E. McKenney        2016-08-23  2962  
ae15018456c44b kernel/rcutree.c  Paul E. McKenney        2013-04-23  2963  	if (debug_rcu_head_queue(head)) {
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2964  		/*
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2965  		 * Probable double call_rcu(), so leak the callback.
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2966  		 * Use rcu:rcu_callback trace event to find the previous
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2967  		 * time callback was passed to __call_rcu().
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2968  		 */
d75f773c86a2b8 kernel/rcu/tree.c Sakari Ailus            2019-03-25  2969  		WARN_ONCE(1, "__call_rcu(): Double-freed CB %p->%pS()!!!\n",
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2970  			  head, head->func);
7d0ae8086b8283 kernel/rcu/tree.c Paul E. McKenney        2015-03-03  2971  		WRITE_ONCE(head->func, rcu_leak_callback);
ae15018456c44b kernel/rcutree.c  Paul E. McKenney        2013-04-23  2972  		return;
ae15018456c44b kernel/rcutree.c  Paul E. McKenney        2013-04-23  2973  	}
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2974  	head->func = func;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2975  	head->next = NULL;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2976  	local_irq_save(flags);
26e760c9a7c8ec kernel/rcu/tree.c Walter Wu               2020-08-06  2977  	kasan_record_aux_stack(head);
da1df50d16171f kernel/rcu/tree.c Paul E. McKenney        2018-07-03  2978  	rdp = this_cpu_ptr(&rcu_data);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2979  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2980  	/* Add the callback to our list. */
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2981  	if (unlikely(!rcu_segcblist_is_enabled(&rdp->cblist))) {
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2982  		// This can trigger due to call_rcu() from offline CPU:
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2983  		WARN_ON_ONCE(rcu_scheduler_active != RCU_SCHEDULER_INACTIVE);
34404ca8fb252c kernel/rcu/tree.c Paul E. McKenney        2015-01-19  2984  		WARN_ON_ONCE(!rcu_is_watching());
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2985  		// Very early boot, before rcu_init().  Initialize if needed
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2986  		// and then drop through to queue the callback.
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2987  		if (rcu_segcblist_empty(&rdp->cblist))
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2988  			rcu_segcblist_init(&rdp->cblist);
143da9c2fc030a kernel/rcu/tree.c Paul E. McKenney        2015-01-19  2989  	}
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2990) 
b2b00ddf193bf8 kernel/rcu/tree.c Paul E. McKenney        2019-10-30  2991  	check_cb_ovld(rdp);
7f98c02e61b733 kernel/rcu/tree.c Joel Fernandes (Google  2022-10-16  2992) 	if (rcu_nocb_try_bypass(rdp, head, &was_alldone, flags, lazy))
d1b222c6be1f8b kernel/rcu/tree.c Paul E. McKenney        2019-07-02  2993  		return; // Enqueued onto ->nocb_bypass, so just leave.
b692dc4adfcff5 kernel/rcu/tree.c Paul E. McKenney        2020-02-11  2994  	// If no-CBs CPU gets here, rcu_nocb_try_bypass() acquired ->nocb_lock.
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2995) 	rcu_segcblist_enqueue(&rdp->cblist, head);
c408b215f58f71 kernel/rcu/tree.c Uladzislau Rezki (Sony  2020-05-25  2996) 	if (__is_kvfree_rcu_offset((unsigned long)func))
c408b215f58f71 kernel/rcu/tree.c Uladzislau Rezki (Sony  2020-05-25  2997) 		trace_rcu_kvfree_callback(rcu_state.name, head,
3c779dfef2c452 kernel/rcu/tree.c Paul E. McKenney        2018-07-05  2998  					 (unsigned long)func,
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2999  					 rcu_segcblist_n_cbs(&rdp->cblist));
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney        2011-06-25  3000  	else
3c779dfef2c452 kernel/rcu/tree.c Paul E. McKenney        2018-07-05  3001  		trace_rcu_callback(rcu_state.name, head,
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  3002  				   rcu_segcblist_n_cbs(&rdp->cblist));
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney        2011-06-25  3003  
29154c57e35a19 kernel/rcutree.c  Paul E. McKenney        2012-05-30  3004  	/* Go handle any RCU core processing required. */
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  3005  	if (IS_ENABLED(CONFIG_RCU_NOCB_CPU) &&
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  3006  	    unlikely(rcu_segcblist_is_offloaded(&rdp->cblist))) {
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  3007  		__call_rcu_nocb_wake(rdp, was_alldone, flags); /* unlocks */
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  3008  	} else {
5c7d89676bc519 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  3009  		__call_rcu_core(rdp, head, flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18 @3010  		local_irq_restore(flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  3011  	}
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  3012  }
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  3013  

:::::: The code at line 3010 was first introduced by commit
:::::: 64db4cfff99c04cd5f550357edcc8780f96b54a2 "Tree RCU": scalable classic RCU implementation

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
