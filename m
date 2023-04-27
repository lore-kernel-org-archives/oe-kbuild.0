Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005323BD
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Apr 2023 10:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682589921; x=1714125921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v5XXnMvZ9TlDzijSznis+p/3+Z/AJSVltlu6X4uWPiY=;
  b=RRkk3FP4zRVzyyNx+84mZudc0Jj6aktYi/cniKgqBm7/bJ5DTULP2b0u
   6X5o0aFhI6bUGwVW84VW6vO9eKykoy6SmlMmLN2DEkzNT3iUgdD5WAcAW
   dmn6DW6wQ/IkKD+NPNY6tlIG/WUPnOKKxReSKwqFdJx/KlGSCJIUFrk8w
   0XbX6vmyJZLvfbqfThH4gelZlW1i82I+gcTwwgyBcrY/bzOgz+3NZoowC
   cFYAwKtQnw6OMzNA7fkzcDKPJhyDWCsdy/DKLzC8BE251hE/cj+vI9Udb
   XomTQLZHUIYICuf+PsJ5+0bCuQAH78KWBtNpxK5VMPhJvNLzfUa1UlJ/g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="350238386"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="350238386"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 03:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="805894306"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="805894306"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2023 03:05:19 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pryV4-00009t-16;
	Thu, 27 Apr 2023 10:05:18 +0000
Date: Thu, 27 Apr 2023 18:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paulmck-rcu:dev.2023.04.26a 20/51] kernel/rcu/tree.c:2149
 rcu_do_batch() error: uninitialized symbol 'jlimit'.
Message-ID: <202304271819.uQfAiEjo-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.04.26a
head:   56b38a90a12f76e463a7381d8cff854926fa2b59
commit: 439660e8b8a99058d5967ac64668461ba683576f [20/51] rcu: Employ jiffies-based backstop to callback time limit
:::::: branch date: 10 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230427/202304271819.uQfAiEjo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304271819.uQfAiEjo-lkp@intel.com/

smatch warnings:
kernel/rcu/tree.c:2149 rcu_do_batch() error: uninitialized symbol 'jlimit'.

vim +/jlimit +2149 kernel/rcu/tree.c

b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2060  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2061  /*
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2062   * Invoke any RCU callbacks that have made it to the end of their grace
a616aec9aa140e kernel/rcu/tree.c Ingo Molnar             2021-03-22  2063   * period.  Throttle as specified by rdp->blimit.
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2064   */
5bb5d09cc4f868 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  2065  static void rcu_do_batch(struct rcu_data *rdp)
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2066  {
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2067  	long bl;
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2068  	long count = 0;
b5374b2df0ac1c kernel/rcu/tree.c Paul E. McKenney        2020-06-23  2069  	int div;
b4e6039e8af8c2 kernel/rcu/tree.c Joel Fernandes (Google  2020-11-18  2070) 	bool __maybe_unused empty;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2071  	unsigned long flags;
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2072  	unsigned long jlimit;
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2073  	bool jlimit_check = false;
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2074  	long pending;
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2075  	struct rcu_cblist rcl = RCU_CBLIST_INITIALIZER(rcl);
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2076  	struct rcu_head *rhp;
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2077  	long tlimit = 0;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2078  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2079  	/* If no callbacks are ready, just return. */
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2080  	if (!rcu_segcblist_ready_cbs(&rdp->cblist)) {
3c779dfef2c452 kernel/rcu/tree.c Paul E. McKenney        2018-07-05  2081  		trace_rcu_batch_start(rcu_state.name,
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2082  				      rcu_segcblist_n_cbs(&rdp->cblist), 0);
3c779dfef2c452 kernel/rcu/tree.c Paul E. McKenney        2018-07-05  2083  		trace_rcu_batch_end(rcu_state.name, 0,
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2084  				    !rcu_segcblist_empty(&rdp->cblist),
4968c300e1fa53 kernel/rcutree.c  Paul E. McKenney        2011-12-07  2085  				    need_resched(), is_idle_task(current),
5103850654fdc6 kernel/rcu/tree.c Zqiang                  2022-04-29  2086  				    rcu_is_callbacks_kthread(rdp));
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2087  		return;
29c00b4a1d9e27 kernel/rcutree.c  Paul E. McKenney        2011-06-17  2088  	}
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2089  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2090  	/*
7b65dfa32dca1b kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2091  	 * Extract the list of ready callbacks, disabling IRQs to prevent
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2092  	 * races with call_rcu() from interrupt handlers.  Leave the
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2093  	 * callback counts, as rcu_barrier() needs to be conservative.
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2094  	 */
7b65dfa32dca1b kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2095  	rcu_nocb_lock_irqsave(rdp, flags);
8146c4e2e2c197 kernel/rcutree.c  Paul E. McKenney        2012-01-10  2096  	WARN_ON_ONCE(cpu_is_offline(smp_processor_id()));
253cbbff621407 kernel/rcu/tree.c Paul E. McKenney        2022-11-14  2097  	pending = rcu_segcblist_get_seglen(&rdp->cblist, RCU_DONE_TAIL);
b5374b2df0ac1c kernel/rcu/tree.c Paul E. McKenney        2020-06-23  2098  	div = READ_ONCE(rcu_divisor);
b5374b2df0ac1c kernel/rcu/tree.c Paul E. McKenney        2020-06-23  2099  	div = div < 0 ? 7 : div > sizeof(long) * 8 - 2 ? sizeof(long) * 8 - 2 : div;
b5374b2df0ac1c kernel/rcu/tree.c Paul E. McKenney        2020-06-23  2100  	bl = max(rdp->blimit, pending >> div);
b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2101  	if ((in_serving_softirq() || rdp->rcu_cpu_kthread_status == RCU_KTHREAD_RUNNING) &&
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2102  	    (IS_ENABLED(CONFIG_RCU_DOUBLE_CHECK_CB_TIME) || unlikely(bl > 100))) {
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2103  		const long npj = NSEC_PER_SEC / HZ;
a2b354b9950bb8 kernel/rcu/tree.c Paul E. McKenney        2020-06-23  2104  		long rrn = READ_ONCE(rcu_resched_ns);
a2b354b9950bb8 kernel/rcu/tree.c Paul E. McKenney        2020-06-23  2105  
a2b354b9950bb8 kernel/rcu/tree.c Paul E. McKenney        2020-06-23  2106  		rrn = rrn < NSEC_PER_MSEC ? NSEC_PER_MSEC : rrn > NSEC_PER_SEC ? NSEC_PER_SEC : rrn;
a2b354b9950bb8 kernel/rcu/tree.c Paul E. McKenney        2020-06-23  2107  		tlimit = local_clock() + rrn;
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2108  		jlimit = jiffies + (rrn + npj + 1) / npj;
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2109  		jlimit_check = true;
a2b354b9950bb8 kernel/rcu/tree.c Paul E. McKenney        2020-06-23  2110  	}
3c779dfef2c452 kernel/rcu/tree.c Paul E. McKenney        2018-07-05  2111  	trace_rcu_batch_start(rcu_state.name,
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2112  			      rcu_segcblist_n_cbs(&rdp->cblist), bl);
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2113  	rcu_segcblist_extract_done_cbs(&rdp->cblist, &rcl);
344e219d7d2b28 kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2114  	if (rcu_rdp_is_offloaded(rdp))
7f36ef82e5cf0b kernel/rcu/tree.c Paul E. McKenney        2019-05-28  2115  		rdp->qlen_last_fqs_check = rcu_segcblist_n_cbs(&rdp->cblist);
3afe7fa535491e kernel/rcu/tree.c Joel Fernandes (Google  2020-11-14  2116) 
3afe7fa535491e kernel/rcu/tree.c Joel Fernandes (Google  2020-11-14  2117) 	trace_rcu_segcb_stats(&rdp->cblist, TPS("SegCbDequeued"));
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2118  	rcu_nocb_unlock_irqrestore(rdp, flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2119  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2120  	/* Invoke callbacks. */
6a949b7af82db7 kernel/rcu/tree.c Paul E. McKenney        2019-07-28  2121  	tick_dep_set_task(current, TICK_DEP_BIT_RCU);
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2122  	rhp = rcu_cblist_dequeue(&rcl);
3afe7fa535491e kernel/rcu/tree.c Joel Fernandes (Google  2020-11-14  2123) 
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2124  	for (; rhp; rhp = rcu_cblist_dequeue(&rcl)) {
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2125) 		rcu_callback_t f;
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2126) 
6bc335828056f3 kernel/rcu/tree.c Joel Fernandes (Google  2020-11-03  2127) 		count++;
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2128  		debug_rcu_head_unqueue(rhp);
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2129) 
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2130) 		rcu_lock_acquire(&rcu_callback_map);
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2131) 		trace_rcu_invoke_callback(rcu_state.name, rhp);
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2132) 
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2133) 		f = rhp->func;
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2134) 		WRITE_ONCE(rhp->func, (rcu_callback_t)0L);
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2135) 		f(rhp);
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2136) 
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2137) 		rcu_lock_release(&rcu_callback_map);
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2138) 
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2139  		/*
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2140  		 * Stop only if limit reached and CPU has something to do.
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2141  		 */
3e61e95e2d095e kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2142  		if (in_serving_softirq()) {
3e61e95e2d095e kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2143  			if (count >= bl && (need_resched() || !is_idle_task(current)))
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2144  				break;
3e61e95e2d095e kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2145  			/*
3e61e95e2d095e kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2146  			 * Make sure we don't spend too much time here and deprive other
3e61e95e2d095e kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2147  			 * softirq vectors of CPU cycles.
3e61e95e2d095e kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2148  			 */
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31 @2149  			if (rcu_do_batch_check_time(count, tlimit, jlimit_check, jlimit))
cfcdef5e30469f kernel/rcu/tree.c Eric Dumazet            2019-07-24  2150  				break;
a554ba288845fd kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2151  		} else {
b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2152  			// In rcuc/rcuoc context, so no worries about
b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2153  			// depriving other softirq vectors of CPU cycles.
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2154  			local_bh_enable();
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2155  			lockdep_assert_irqs_enabled();
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2156  			cond_resched_tasks_rcu_qs();
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2157  			lockdep_assert_irqs_enabled();
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2158  			local_bh_disable();
b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2159  			// But rcuc kthreads can delay quiescent-state
b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2160  			// reporting, so check time limits for them.
b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2161  			if (rdp->rcu_cpu_kthread_status == RCU_KTHREAD_RUNNING &&
439660e8b8a990 kernel/rcu/tree.c Paul E. McKenney        2023-03-31  2162  			    rcu_do_batch_check_time(count, tlimit, jlimit_check, jlimit)) {
b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2163  				rdp->rcu_cpu_has_work = 1;
b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2164  				break;
b5ccefd625d494 kernel/rcu/tree.c Paul E. McKenney        2023-03-21  2165  			}
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2166  		}
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2167  	}
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2168  
7b65dfa32dca1b kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  2169  	rcu_nocb_lock_irqsave(rdp, flags);
e816d56fad57ba kernel/rcu/tree.c Paul E. McKenney        2020-05-01  2170  	rdp->n_cbs_invoked += count;
3c779dfef2c452 kernel/rcu/tree.c Paul E. McKenney        2018-07-05  2171  	trace_rcu_batch_end(rcu_state.name, count, !!rcl.head, need_resched(),
5103850654fdc6 kernel/rcu/tree.c Zqiang                  2022-04-29  2172  			    is_idle_task(current), rcu_is_callbacks_kthread(rdp));
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2173  
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2174  	/* Update counts and requeue any remaining callbacks. */
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2175  	rcu_segcblist_insert_done_cbs(&rdp->cblist, &rcl);
6bc335828056f3 kernel/rcu/tree.c Joel Fernandes (Google  2020-11-03  2176) 	rcu_segcblist_add_len(&rdp->cblist, -count);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2177  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2178  	/* Reinstate batch limit if we have worked down the excess. */
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2179  	count = rcu_segcblist_n_cbs(&rdp->cblist);
d5a9a8c3bc8068 kernel/rcu/tree.c Paul E. McKenney        2019-04-10  2180  	if (rdp->blimit >= DEFAULT_MAX_RCU_BLIMIT && count <= qlowmark)
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2181  		rdp->blimit = blimit;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2182  
37c72e56f6b234 kernel/rcutree.c  Paul E. McKenney        2009-10-14  2183  	/* Reset ->qlen_last_fqs_check trigger if enough CBs have drained. */
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2184  	if (count == 0 && rdp->qlen_last_fqs_check != 0) {
37c72e56f6b234 kernel/rcutree.c  Paul E. McKenney        2009-10-14  2185  		rdp->qlen_last_fqs_check = 0;
2431774f04d105 kernel/rcu/tree.c Paul E. McKenney        2021-07-20  2186  		rdp->n_force_qs_snap = READ_ONCE(rcu_state.n_force_qs);
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2187  	} else if (count < rdp->qlen_last_fqs_check - qhimark)
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2188  		rdp->qlen_last_fqs_check = count;
efd88b02bb9e6b kernel/rcu/tree.c Paul E. McKenney        2017-10-19  2189  
efd88b02bb9e6b kernel/rcu/tree.c Paul E. McKenney        2017-10-19  2190  	/*
efd88b02bb9e6b kernel/rcu/tree.c Paul E. McKenney        2017-10-19  2191  	 * The following usually indicates a double call_rcu().  To track
efd88b02bb9e6b kernel/rcu/tree.c Paul E. McKenney        2017-10-19  2192  	 * this down, try building with CONFIG_DEBUG_OBJECTS_RCU_HEAD=y.
efd88b02bb9e6b kernel/rcu/tree.c Paul E. McKenney        2017-10-19  2193  	 */
b4e6039e8af8c2 kernel/rcu/tree.c Joel Fernandes (Google  2020-11-18  2194) 	empty = rcu_segcblist_empty(&rdp->cblist);
b4e6039e8af8c2 kernel/rcu/tree.c Joel Fernandes (Google  2020-11-18  2195) 	WARN_ON_ONCE(count == 0 && !empty);
d1b222c6be1f8b kernel/rcu/tree.c Paul E. McKenney        2019-07-02  2196  	WARN_ON_ONCE(!IS_ENABLED(CONFIG_RCU_NOCB_CPU) &&
b4e6039e8af8c2 kernel/rcu/tree.c Joel Fernandes (Google  2020-11-18  2197) 		     count != 0 && empty);
b4e6039e8af8c2 kernel/rcu/tree.c Joel Fernandes (Google  2020-11-18  2198) 	WARN_ON_ONCE(count == 0 && rcu_segcblist_n_segment_cbs(&rdp->cblist) != 0);
b4e6039e8af8c2 kernel/rcu/tree.c Joel Fernandes (Google  2020-11-18  2199) 	WARN_ON_ONCE(!empty && rcu_segcblist_n_segment_cbs(&rdp->cblist) == 0);
37c72e56f6b234 kernel/rcutree.c  Paul E. McKenney        2009-10-14  2200  
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2201  	rcu_nocb_unlock_irqrestore(rdp, flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2202  
6a949b7af82db7 kernel/rcu/tree.c Paul E. McKenney        2019-07-28  2203  	tick_dep_clear_task(current, TICK_DEP_BIT_RCU);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2204  }
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
