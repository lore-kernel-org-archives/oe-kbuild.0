Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAAA219A7A
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 04:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766119312; cv=none; b=DD8swPbH6IfZLgd6JzwiuY9qGM1Ax23EbidBPuIdjxa2WLqMMjMWkdwKzueX5QhCBYlvCHVFit8AxVF2WcyXCbiQZQOrg2hmc+RrvgW2jUCjJw7CgYqYeUX8p3jFg2RIeJfocEZIOSsIjumJTu3B6N/q5yZEnQWZ7HvV4oZ8Bus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766119312; c=relaxed/simple;
	bh=1Z23E9HGYQHBOO0l1ZOIImKhn1CKGLN+njR9kDnr6so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=slk/gqN0agJ7vfxrXI0MC3c1pjE78u5xGsN5nowF9B6eMRD0FvE3O/Ejppc1YdOIThK3VciVs1s8Hy3MzXQpFsxAIxaDA6DjJvUP8Pegwssr9emMPzfRcdVcGQ29AbxPNj6k/jSz3ltuRTlPdOk8IqSFPe/75Gxj5pDnjLLNzqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPGkVU2A; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPGkVU2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766119311; x=1797655311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Z23E9HGYQHBOO0l1ZOIImKhn1CKGLN+njR9kDnr6so=;
  b=CPGkVU2A8uSarFbLov1R4KPpsF5WEIdpqgI9d3IqCjbfdfKweWeWhoBD
   pbilWd0FIA/CrRplkj9lUyb7tzqZ300u1JtdN43bsVHjzJIr9RNxpiW46
   uUxHiJ6pqTroc0Ff72wj7adz/B3XAkS3DPlvDhBgWv9t4bH+dbD1osLqV
   PHvQuyv0jvK8Eip1Kix+shhW5vTHMH18bxfqohupsw21UujkDxBU0eE1F
   lH6pJlDPAdEhuyIHFibVRxAay/1Brten3jchs4YwQJHIvCaO3XJIYYqD1
   DnYD671ZTMzvy10oYQnHR+8yjBRIDqRtlp9uPyYqroQH4xH7RH3ggYLSt
   g==;
X-CSE-ConnectionGUID: EerKhyhtRgGZDq3lxAdOyg==
X-CSE-MsgGUID: R0YDMZL3SwK6Eybu+slq+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79202202"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="79202202"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 20:41:50 -0800
X-CSE-ConnectionGUID: TEfeEjpFQ3W6u3M+HSv77g==
X-CSE-MsgGUID: xEGSMNUfTNW+IYtYBHKM6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="199033851"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Dec 2025 20:41:48 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWSJG-00000000319-2R4L;
	Fri, 19 Dec 2025 04:41:46 +0000
Date: Fri, 19 Dec 2025 12:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 24/36] kernel/rcu/srcutree.c:1072
 srcu_funnel_exp_start() error: uninitialized symbol 'flags'.
Message-ID: <202512191240.zQpoISOH-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   3b4ba9b3b7c8365712656e62d0ca5a09504b5074
commit: 752b5e42738a61eaad41dd5c0b9352f7a123b43b [24/36] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r072-20251218 (https://download.01.org/0day-ci/archive/20251219/202512191240.zQpoISOH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512191240.zQpoISOH-lkp@intel.com/

New smatch warnings:
kernel/rcu/srcutree.c:1072 srcu_funnel_exp_start() error: uninitialized symbol 'flags'.
kernel/rcu/srcutree.c:1161 srcu_funnel_gp_start() error: uninitialized symbol 'flags'.
kernel/rcu/srcutree.c:1411 srcu_gp_start_if_needed() error: uninitialized symbol 'flags'.
kernel/rcu/srcutree.c:1772 srcu_expedite_current_cb() error: uninitialized symbol 'flags'.
kernel/rcu/srcutree.c:1805 srcu_expedite_current() error: uninitialized symbol 'flags'.
drivers/clk/clk.c:264 clk_enable_lock() error: uninitialized symbol 'flags'.
drivers/tty/serial/bcm63xx_uart.c:724 bcm_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/esp32_uart.c:549 esp32_uart_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/esp32_acm.c:305 esp32s3_acm_console_write() error: uninitialized symbol 'flags'.
drivers/usb/dwc2/hcd_queue.c:1249 dwc2_unreserve_timer_fn() error: uninitialized symbol 'flags'.
drivers/tty/serial/sprd_serial.c:1011 sprd_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/xilinx_uartps.c:1406 cdns_uart_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/stm32-usart.c:1954 stm32_usart_console_write() error: uninitialized symbol 'flags'.
drivers/tty/serial/sh-sci.c:3026 sci_request_port() warn: 'port->mapbase' from __request_region() not released on lines: 3023.
drivers/tty/serial/sh-sci.c:3428 serial_console_write() error: uninitialized symbol 'flags'.
fs/aio.c:1824 aio_poll_wake() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/clk/clk.c:272 clk_enable_lock() error: uninitialized symbol 'flags'.
drivers/clk/clk.c:4169 clk_hw_create_clk() warn: passing zero to 'ERR_CAST'

vim +/flags +1072 kernel/rcu/srcutree.c

da915ad5cf25b5 Paul E. McKenney 2017-04-05  1040  
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1041  /*
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1042   * Funnel-locking scheme to scalably mediate many concurrent expedited
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1043   * grace-period requests.  This function is invoked for the first known
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1044   * expedited request for a grace period that has already been requested,
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1045   * but without expediting.  To start a completely new grace period,
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1046   * whether expedited or not, use srcu_funnel_gp_start() instead.
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1047   */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1048  static void srcu_funnel_exp_start(struct srcu_struct *ssp, struct srcu_node *snp,
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1049  				  unsigned long s)
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1050  {
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1051  	unsigned long flags;
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1052  	unsigned long sgsne;
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1053  
994f706872e6ce Paul E. McKenney 2022-01-24  1054  	if (snp)
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1055  		for (; snp != NULL; snp = snp->srcu_parent) {
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1056  			sgsne = READ_ONCE(snp->srcu_gp_seq_needed_exp);
03200b5ca3b4d4 Paul E. McKenney 2023-03-17  1057  			if (WARN_ON_ONCE(rcu_seq_done(&ssp->srcu_sup->srcu_gp_seq, s)) ||
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1058  			    (!srcu_invl_snp_seq(sgsne) && ULONG_CMP_GE(sgsne, s)))
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1059  				return;
d633198088bd9e Paul E. McKenney 2017-10-10  1060  			spin_lock_irqsave_rcu_node(snp, flags);
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1061  			sgsne = snp->srcu_gp_seq_needed_exp;
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1062  			if (!srcu_invl_snp_seq(sgsne) && ULONG_CMP_GE(sgsne, s)) {
d633198088bd9e Paul E. McKenney 2017-10-10  1063  				spin_unlock_irqrestore_rcu_node(snp, flags);
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1064  				return;
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1065  			}
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1066  			WRITE_ONCE(snp->srcu_gp_seq_needed_exp, s);
d633198088bd9e Paul E. McKenney 2017-10-10  1067  			spin_unlock_irqrestore_rcu_node(snp, flags);
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1068  		}
9f2e91d94c9155 Paul E. McKenney 2022-01-27  1069  	spin_lock_irqsave_ssp_contention(ssp, &flags);
03200b5ca3b4d4 Paul E. McKenney 2023-03-17  1070  	if (ULONG_CMP_LT(ssp->srcu_sup->srcu_gp_seq_needed_exp, s))
03200b5ca3b4d4 Paul E. McKenney 2023-03-17  1071  		WRITE_ONCE(ssp->srcu_sup->srcu_gp_seq_needed_exp, s);
b3fb11f7e9c3c6 Paul E. McKenney 2023-03-17 @1072  	spin_unlock_irqrestore_rcu_node(ssp->srcu_sup, flags);
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1073  }
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1074  
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1075  /*
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1076   * Funnel-locking scheme to scalably mediate many concurrent grace-period
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1077   * requests.  The winner has to do the work of actually starting grace
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1078   * period s.  Losers must either ensure that their desired grace-period
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1079   * number is recorded on at least their leaf srcu_node structure, or they
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1080   * must take steps to invoke their own callbacks.
17294ce6a41d3f Paul E. McKenney 2018-04-25  1081   *
17294ce6a41d3f Paul E. McKenney 2018-04-25  1082   * Note that this function also does the work of srcu_funnel_exp_start(),
17294ce6a41d3f Paul E. McKenney 2018-04-25  1083   * in some cases by directly invoking it.
1bafbfb3e1a18a Pingfan Liu      2022-11-23  1084   *
1bafbfb3e1a18a Pingfan Liu      2022-11-23  1085   * The srcu read lock should be hold around this function. And s is a seq snap
1bafbfb3e1a18a Pingfan Liu      2022-11-23  1086   * after holding that lock.
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1087   */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1088  static void srcu_funnel_gp_start(struct srcu_struct *ssp, struct srcu_data *sdp,
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1089  				 unsigned long s, bool do_norm)
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1090  {
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1091  	unsigned long flags;
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1092  	int idx = rcu_seq_ctr(s) % ARRAY_SIZE(sdp->mynode->srcu_have_cbs);
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1093  	unsigned long sgsne;
7b9e9b5856e188 Paul E. McKenney 2022-01-20  1094  	struct srcu_node *snp;
0b56f953908a75 Neeraj Upadhyay  2022-02-22  1095  	struct srcu_node *snp_leaf;
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1096  	unsigned long snp_seq;
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1097  	struct srcu_usage *sup = ssp->srcu_sup;
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1098  
0b56f953908a75 Neeraj Upadhyay  2022-02-22  1099  	/* Ensure that snp node tree is fully initialized before traversing it */
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1100  	if (smp_load_acquire(&sup->srcu_size_state) < SRCU_SIZE_WAIT_BARRIER)
0b56f953908a75 Neeraj Upadhyay  2022-02-22  1101  		snp_leaf = NULL;
0b56f953908a75 Neeraj Upadhyay  2022-02-22  1102  	else
0b56f953908a75 Neeraj Upadhyay  2022-02-22  1103  		snp_leaf = sdp->mynode;
0b56f953908a75 Neeraj Upadhyay  2022-02-22  1104  
994f706872e6ce Paul E. McKenney 2022-01-24  1105  	if (snp_leaf)
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1106  		/* Each pass through the loop does one level of the srcu_node tree. */
7b9e9b5856e188 Paul E. McKenney 2022-01-20  1107  		for (snp = snp_leaf; snp != NULL; snp = snp->srcu_parent) {
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1108  			if (WARN_ON_ONCE(rcu_seq_done(&sup->srcu_gp_seq, s)) && snp != snp_leaf)
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1109  				return; /* GP already done and CBs recorded. */
d633198088bd9e Paul E. McKenney 2017-10-10  1110  			spin_lock_irqsave_rcu_node(snp, flags);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1111  			snp_seq = snp->srcu_have_cbs[idx];
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1112  			if (!srcu_invl_snp_seq(snp_seq) && ULONG_CMP_GE(snp_seq, s)) {
7b9e9b5856e188 Paul E. McKenney 2022-01-20  1113  				if (snp == snp_leaf && snp_seq == s)
c7e88067c1ae89 Paul E. McKenney 2017-04-18  1114  					snp->srcu_data_have_cbs[idx] |= sdp->grpmask;
d633198088bd9e Paul E. McKenney 2017-10-10  1115  				spin_unlock_irqrestore_rcu_node(snp, flags);
7b9e9b5856e188 Paul E. McKenney 2022-01-20  1116  				if (snp == snp_leaf && snp_seq != s) {
aeb9b39b8f4aac Paul E. McKenney 2022-01-26  1117  					srcu_schedule_cbs_sdp(sdp, do_norm ? SRCU_INTERVAL : 0);
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1118  					return;
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1119  				}
1e9a038b7fe9a8 Paul E. McKenney 2017-04-24  1120  				if (!do_norm)
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1121  					srcu_funnel_exp_start(ssp, snp, s);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1122  				return;
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1123  			}
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1124  			snp->srcu_have_cbs[idx] = s;
7b9e9b5856e188 Paul E. McKenney 2022-01-20  1125  			if (snp == snp_leaf)
c7e88067c1ae89 Paul E. McKenney 2017-04-18  1126  				snp->srcu_data_have_cbs[idx] |= sdp->grpmask;
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1127  			sgsne = snp->srcu_gp_seq_needed_exp;
cbdc98e93efa7b Paul E. McKenney 2022-01-26  1128  			if (!do_norm && (srcu_invl_snp_seq(sgsne) || ULONG_CMP_LT(sgsne, s)))
7ff8b4502bc0f5 Paul E. McKenney 2019-12-22  1129  				WRITE_ONCE(snp->srcu_gp_seq_needed_exp, s);
d633198088bd9e Paul E. McKenney 2017-10-10  1130  			spin_unlock_irqrestore_rcu_node(snp, flags);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1131  		}
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1132  
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1133  	/* Top of tree, must ensure the grace period will be started. */
9f2e91d94c9155 Paul E. McKenney 2022-01-27  1134  	spin_lock_irqsave_ssp_contention(ssp, &flags);
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1135  	if (ULONG_CMP_LT(sup->srcu_gp_seq_needed, s)) {
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1136  		/*
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1137  		 * Record need for grace period s.  Pair with load
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1138  		 * acquire setting up for initialization.
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1139  		 */
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1140  		smp_store_release(&sup->srcu_gp_seq_needed, s); /*^^^*/
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1141  	}
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1142  	if (!do_norm && ULONG_CMP_LT(sup->srcu_gp_seq_needed_exp, s))
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1143  		WRITE_ONCE(sup->srcu_gp_seq_needed_exp, s);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1144  
1bafbfb3e1a18a Pingfan Liu      2022-11-23  1145  	/* If grace period not already in progress, start it. */
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1146  	if (!WARN_ON_ONCE(rcu_seq_done(&sup->srcu_gp_seq, s)) &&
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1147  	    rcu_seq_state(sup->srcu_gp_seq) == SRCU_STATE_IDLE) {
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  1148  		srcu_gp_start(ssp);
ee5e2448bceb94 Paul E. McKenney 2022-01-27  1149  
ee5e2448bceb94 Paul E. McKenney 2022-01-27  1150  		// And how can that list_add() in the "else" clause
ee5e2448bceb94 Paul E. McKenney 2022-01-27  1151  		// possibly be safe for concurrent execution?  Well,
ee5e2448bceb94 Paul E. McKenney 2022-01-27  1152  		// it isn't.  And it does not have to be.  After all, it
ee5e2448bceb94 Paul E. McKenney 2022-01-27  1153  		// can only be executed during early boot when there is only
ee5e2448bceb94 Paul E. McKenney 2022-01-27  1154  		// the one boot CPU running with interrupts still disabled.
e0fcba9ac02af5 Paul E. McKenney 2018-08-14  1155  		if (likely(srcu_init_done))
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1156  			queue_delayed_work(rcu_gp_wq, &sup->work,
282d8998e9979c Paul E. McKenney 2022-03-08  1157  					   !!srcu_get_delay(ssp));
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1158  		else if (list_empty(&sup->work.work.entry))
cefc0a599b19d8 Paul E. McKenney 2023-03-18  1159  			list_add(&sup->work.work.entry, &srcu_boot_list);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1160  	}
cefc0a599b19d8 Paul E. McKenney 2023-03-18 @1161  	spin_unlock_irqrestore_rcu_node(sup, flags);
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1162  }
da915ad5cf25b5 Paul E. McKenney 2017-04-05  1163  

:::::: The code at line 1072 was first introduced by commit
:::::: b3fb11f7e9c3c64dd86403409a070c996d8ac081 srcu: Move ->lock from srcu_struct to srcu_usage

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
