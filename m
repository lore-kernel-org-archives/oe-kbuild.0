Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B088195
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 05:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677993859; x=1709529859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WuXNfBCNuWJcQy3AHuHVSuUpNd/x9w5heZcNrj8foU=;
  b=HCNYBa8HeoHJ0tNLr4T5FppDZ6/FJ5ZVdMRnFXfzFU7B6WMtoP1+3Lg6
   qgAE0+PI8pQHogx8H9l6zeZl3VON7puyom4BrseKKiPXg0lzessem9pQa
   WGYUlxiZ/bpzHh47Y5q4YHicl/nyOKgIWvXSb55kbOZJZkWB5nOV1sbuo
   fIwV19zpRvV24UKIdL8pXFQp7xIQFYRd+CVeZiyDT+OR+BmhOb7ksQ/dz
   U+d+0v3TsXBKCN6EdBgKNAcgwfMomo1BTEaIrZYb9ETe7PmNlNQnv/tbn
   S+TF6SVyk0llrfFcPgkVnofM+Lr7Y1gJh2FcjLnANGZh9P/YWzawL6Q9D
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="315745813"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="315745813"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 21:24:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="818948076"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="818948076"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2023 21:24:17 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYgr2-0002Z3-23;
	Sun, 05 Mar 2023 05:24:16 +0000
Date: Sun, 5 Mar 2023 13:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH printk v1 06/18] printk: nobkl: Add acquire/release logic
Message-ID: <202303051319.m55kZE3v-lkp@intel.com>
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
In-Reply-To: <20230302195618.156940-7-john.ogness@linutronix.de>
References: <20230302195618.156940-7-john.ogness@linutronix.de>
TO: John Ogness <john.ogness@linutronix.de>
TO: Petr Mladek <pmladek@suse.com>
CC: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: linux-kernel@vger.kernel.org
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi John,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 10d639febe5629687dac17c4a7500a96537ce11a]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ogness/kdb-do-not-assume-write-callback-available/20230303-040039
base:   10d639febe5629687dac17c4a7500a96537ce11a
patch link:    https://lore.kernel.org/r/20230302195618.156940-7-john.ogness%40linutronix.de
patch subject: [PATCH printk v1 06/18] printk: nobkl: Add acquire/release logic
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230305/202303051319.m55kZE3v-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303051319.m55kZE3v-lkp@intel.com/

smatch warnings:
kernel/printk/printk_nobkl.c:391 cons_try_acquire_spin() warn: signedness bug returning '(-16)'

vim +391 kernel/printk/printk_nobkl.c

d444c8549ebdf3 Thomas Gleixner 2023-03-02  283  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  284  /**
d444c8549ebdf3 Thomas Gleixner 2023-03-02  285   * cons_try_acquire_spin - Complete the spinwait attempt
d444c8549ebdf3 Thomas Gleixner 2023-03-02  286   * @ctxt:	Pointer to an acquire context that contains
d444c8549ebdf3 Thomas Gleixner 2023-03-02  287   *		all information about the acquire mode
d444c8549ebdf3 Thomas Gleixner 2023-03-02  288   *
d444c8549ebdf3 Thomas Gleixner 2023-03-02  289   * @ctxt->hov_state contains the handover state that was set in
d444c8549ebdf3 Thomas Gleixner 2023-03-02  290   * state[REQ]
d444c8549ebdf3 Thomas Gleixner 2023-03-02  291   * @ctxt->req_state contains the request state that was set in
d444c8549ebdf3 Thomas Gleixner 2023-03-02  292   * state[CUR]
d444c8549ebdf3 Thomas Gleixner 2023-03-02  293   *
d444c8549ebdf3 Thomas Gleixner 2023-03-02  294   * Returns: 0 if successfully locked. -EBUSY on timeout. -EAGAIN on
d444c8549ebdf3 Thomas Gleixner 2023-03-02  295   * unexpected state values.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  296   *
d444c8549ebdf3 Thomas Gleixner 2023-03-02  297   * On success @ctxt->state contains the new state that was set in
d444c8549ebdf3 Thomas Gleixner 2023-03-02  298   * state[CUR]
d444c8549ebdf3 Thomas Gleixner 2023-03-02  299   *
d444c8549ebdf3 Thomas Gleixner 2023-03-02  300   * On -EBUSY failure this context timed out. This context should either
d444c8549ebdf3 Thomas Gleixner 2023-03-02  301   * give up or attempt a hostile takeover.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  302   *
d444c8549ebdf3 Thomas Gleixner 2023-03-02  303   * On -EAGAIN failure this context encountered unexpected state values.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  304   * This context should retry the full handover request setup process (the
d444c8549ebdf3 Thomas Gleixner 2023-03-02  305   * handover request setup by cons_setup_handover() is now invalidated and
d444c8549ebdf3 Thomas Gleixner 2023-03-02  306   * must be performed again).
d444c8549ebdf3 Thomas Gleixner 2023-03-02  307   */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  308  static bool cons_try_acquire_spin(struct cons_context *ctxt)
d444c8549ebdf3 Thomas Gleixner 2023-03-02  309  {
d444c8549ebdf3 Thomas Gleixner 2023-03-02  310  	struct console *con = ctxt->console;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  311  	struct cons_state cur;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  312  	struct cons_state new;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  313  	int err = -EAGAIN;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  314  	int timeout;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  315  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  316  	/* Now wait for the other side to hand over */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  317  	for (timeout = ctxt->spinwait_max_us; timeout >= 0; timeout--) {
d444c8549ebdf3 Thomas Gleixner 2023-03-02  318  		/* Timeout immediately if a remote panic is detected. */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  319  		if (cons_check_panic())
d444c8549ebdf3 Thomas Gleixner 2023-03-02  320  			break;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  321  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  322  		cons_state_read(con, CON_STATE_CUR, &cur);
d444c8549ebdf3 Thomas Gleixner 2023-03-02  323  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  324  		/*
d444c8549ebdf3 Thomas Gleixner 2023-03-02  325  		 * If the real state of the console matches the handover state
d444c8549ebdf3 Thomas Gleixner 2023-03-02  326  		 * that this context setup, then the handover was a success
d444c8549ebdf3 Thomas Gleixner 2023-03-02  327  		 * and this context is now the owner.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  328  		 *
d444c8549ebdf3 Thomas Gleixner 2023-03-02  329  		 * Note that this might have raced with a new higher priority
d444c8549ebdf3 Thomas Gleixner 2023-03-02  330  		 * requester coming in after the lock was handed over.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  331  		 * However, that requester will see that the owner changes and
d444c8549ebdf3 Thomas Gleixner 2023-03-02  332  		 * setup a new request for the current owner (this context).
d444c8549ebdf3 Thomas Gleixner 2023-03-02  333  		 */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  334  		if (cons_state_bits_match(cur, ctxt->hov_state))
d444c8549ebdf3 Thomas Gleixner 2023-03-02  335  			goto success;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  336  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  337  		/*
d444c8549ebdf3 Thomas Gleixner 2023-03-02  338  		 * If state changed since the request was made, give up as
d444c8549ebdf3 Thomas Gleixner 2023-03-02  339  		 * it is no longer consistent. This must include
d444c8549ebdf3 Thomas Gleixner 2023-03-02  340  		 * state::req_prio since there could be a higher priority
d444c8549ebdf3 Thomas Gleixner 2023-03-02  341  		 * request available.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  342  		 */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  343  		if (cur.bits != ctxt->req_state.bits)
d444c8549ebdf3 Thomas Gleixner 2023-03-02  344  			goto cleanup;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  345  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  346  		/*
d444c8549ebdf3 Thomas Gleixner 2023-03-02  347  		 * Finally check whether the handover state is still
d444c8549ebdf3 Thomas Gleixner 2023-03-02  348  		 * the same.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  349  		 */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  350  		cons_state_read(con, CON_STATE_REQ, &cur);
d444c8549ebdf3 Thomas Gleixner 2023-03-02  351  		if (cur.atom != ctxt->hov_state.atom)
d444c8549ebdf3 Thomas Gleixner 2023-03-02  352  			goto cleanup;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  353  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  354  		/* Account time */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  355  		if (timeout > 0)
d444c8549ebdf3 Thomas Gleixner 2023-03-02  356  			udelay(1);
d444c8549ebdf3 Thomas Gleixner 2023-03-02  357  	}
d444c8549ebdf3 Thomas Gleixner 2023-03-02  358  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  359  	/*
d444c8549ebdf3 Thomas Gleixner 2023-03-02  360  	 * Timeout. Cleanup the handover state and carefully try to reset
d444c8549ebdf3 Thomas Gleixner 2023-03-02  361  	 * req_prio in the real state. The reset is important to ensure
d444c8549ebdf3 Thomas Gleixner 2023-03-02  362  	 * that the owner does not hand over the lock after this context
d444c8549ebdf3 Thomas Gleixner 2023-03-02  363  	 * has given up waiting.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  364  	 */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  365  	cons_cleanup_handover(ctxt);
d444c8549ebdf3 Thomas Gleixner 2023-03-02  366  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  367  	cons_state_read(con, CON_STATE_CUR, &cur);
d444c8549ebdf3 Thomas Gleixner 2023-03-02  368  	do {
d444c8549ebdf3 Thomas Gleixner 2023-03-02  369  		/*
d444c8549ebdf3 Thomas Gleixner 2023-03-02  370  		 * The timeout might have raced with the owner coming late
d444c8549ebdf3 Thomas Gleixner 2023-03-02  371  		 * and handing it over gracefully.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  372  		 */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  373  		if (cons_state_bits_match(cur, ctxt->hov_state))
d444c8549ebdf3 Thomas Gleixner 2023-03-02  374  			goto success;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  375  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  376  		/*
d444c8549ebdf3 Thomas Gleixner 2023-03-02  377  		 * Validate that the state matches with the state at request
d444c8549ebdf3 Thomas Gleixner 2023-03-02  378  		 * time. If this check fails, there is already a higher
d444c8549ebdf3 Thomas Gleixner 2023-03-02  379  		 * priority context waiting or the owner has changed (either
d444c8549ebdf3 Thomas Gleixner 2023-03-02  380  		 * by higher priority or by hostile takeover). In all fail
d444c8549ebdf3 Thomas Gleixner 2023-03-02  381  		 * cases this context is no longer in line for a handover to
d444c8549ebdf3 Thomas Gleixner 2023-03-02  382  		 * take place, so no reset is necessary.
d444c8549ebdf3 Thomas Gleixner 2023-03-02  383  		 */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  384  		if (cur.bits != ctxt->req_state.bits)
d444c8549ebdf3 Thomas Gleixner 2023-03-02  385  			goto cleanup;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  386  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  387  		copy_full_state(new, cur);
d444c8549ebdf3 Thomas Gleixner 2023-03-02  388  		new.req_prio = 0;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  389  	} while (!cons_state_try_cmpxchg(con, CON_STATE_CUR, &cur, &new));
d444c8549ebdf3 Thomas Gleixner 2023-03-02  390  	/* Reset worked. Report timeout. */
d444c8549ebdf3 Thomas Gleixner 2023-03-02 @391  	return -EBUSY;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  392  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  393  success:
d444c8549ebdf3 Thomas Gleixner 2023-03-02  394  	/* Store the real state */
d444c8549ebdf3 Thomas Gleixner 2023-03-02  395  	copy_full_state(ctxt->state, cur);
d444c8549ebdf3 Thomas Gleixner 2023-03-02  396  	ctxt->hostile = false;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  397  	err = 0;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  398  
d444c8549ebdf3 Thomas Gleixner 2023-03-02  399  cleanup:
d444c8549ebdf3 Thomas Gleixner 2023-03-02  400  	cons_cleanup_handover(ctxt);
d444c8549ebdf3 Thomas Gleixner 2023-03-02  401  	return err;
d444c8549ebdf3 Thomas Gleixner 2023-03-02  402  }
d444c8549ebdf3 Thomas Gleixner 2023-03-02  403  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
