Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBEF3D67
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Oct 2023 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkibW45R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696852448; x=1728388448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgHzS0J7S/Jj6wJK58bbwgoGf5LGbvH68yiUxTjqHmk=;
  b=kkibW45Rw5mahi+OWf2IUwzkNt/zX7z3YI955/8J2d4VXxHwE4ogLN5B
   Oo99TR7mQLN4XWfWZWBpFkSnhL2rvxUsQH14TRgC2vlTAHC37xLMzop4i
   kVyQRK4GW7S/9NIYCIzfZW/7YKLs+W/++NKITZP+FTWFXk+T+cH5UL+WF
   ytxCXJJl64wxBMHsCSbCL5z+t6vCtlrpcT8NSHXhKyKcgACyAM4OFANFA
   tIPVjy0enMqrcm6a/YBuzZ25RQ1y1uAI2puj4bU6ioH/p7w+6bQUroW3R
   g3bN7b4KVjYu4fFkT357oy26fjDMePUfTNMZe42KZYde+gTbH+xvBnNeP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="448313526"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="448313526"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="926735215"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="926735215"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Oct 2023 04:54:05 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpopn-00009s-0W;
	Mon, 09 Oct 2023 11:54:03 +0000
Date: Mon, 9 Oct 2023 19:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [rt-devel:linux-6.6.y-rt 5/9] kernel/printk/nbcon.c:1058:2-8:
 preceding lock on line 1077
Message-ID: <202310091931.Av3oDqEt-lkp@intel.com>
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
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.6.y-rt
head:   fb5f8b0de45537865e3eaec52e24ad991eef1701
commit: da042bbb7a3ffcb2d18fc69e01f8a2f1ff0f0aab [5/9] printk: Update the printk series.
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-102-20231009 (https://download.01.org/0day-ci/archive/20231009/202310091931.Av3oDqEt-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231009/202310091931.Av3oDqEt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310091931.Av3oDqEt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/printk/nbcon.c:1058:2-8: preceding lock on line 1077

vim +1058 kernel/printk/nbcon.c

da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1019  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1020  /**
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1021   * nbcon_kthread_func - The printk thread function
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1022   * @__console:	Console to operate on
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1023   */
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1024  static int nbcon_kthread_func(void *__console)
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1025  {
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1026  	struct console *con = __console;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1027  	struct nbcon_write_context wctxt = {
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1028  		.ctxt.console	= con,
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1029  		.ctxt.prio	= NBCON_PRIO_NORMAL,
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1030  	};
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1031  	struct nbcon_context *ctxt = &ACCESS_PRIVATE(&wctxt, ctxt);
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1032  	struct uart_port *port = NULL;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1033  	unsigned long flags;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1034  	short con_flags;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1035  	bool backlog;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1036  	int cookie;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1037  	int ret;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1038  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1039  	if (con->uart_port)
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1040  		port = con->uart_port(con);
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1041  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1042  wait_for_event:
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1043  	/*
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1044  	 * Guarantee this task is visible on the rcuwait before
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1045  	 * checking the wake condition.
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1046  	 *
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1047  	 * The full memory barrier within set_current_state() of
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1048  	 * ___rcuwait_wait_event() pairs with the full memory
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1049  	 * barrier within rcuwait_has_sleeper().
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1050  	 *
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1051  	 * This pairs with rcuwait_has_sleeper:A and nbcon_kthread_wake:A.
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1052  	 */
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1053  	ret = rcuwait_wait_event(&con->rcuwait,
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1054  				 nbcon_kthread_should_wakeup(con, ctxt),
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1055  				 TASK_INTERRUPTIBLE); /* LMM(nbcon_kthread_func:A) */
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1056  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1057  	if (kthread_should_stop())
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04 @1058  		return 0;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1059  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1060  	/* Wait was interrupted by a spurious signal, go back to sleep. */
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1061  	if (ret)
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1062  		goto wait_for_event;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1063  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1064  	do {
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1065  		backlog = false;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1066  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1067  		cookie = console_srcu_read_lock();
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1068  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1069  		con_flags = console_srcu_read_flags(con);
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1070  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1071  		if (console_is_usable(con, con_flags, false)) {
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1072  			/*
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1073  			 * Ensure this stays on the CPU to make handover and
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1074  			 * takeover possible.
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1075  			 */
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1076  			if (port)
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04 @1077  				spin_lock_irqsave(&port->lock, flags);
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1078  			else
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1079  				migrate_disable();
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1080  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1081  			if (nbcon_context_try_acquire(ctxt)) {
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1082  				/*
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1083  				 * If the emit fails, this context is no
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1084  				 * longer the owner.
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1085  				 */
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1086  				if (nbcon_emit_next_record(&wctxt, true)) {
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1087  					nbcon_context_release(ctxt);
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1088  					backlog = ctxt->backlog;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1089  				}
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1090  			}
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1091  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1092  			if (port)
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1093  				spin_unlock_irqrestore(&port->lock, flags);
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1094  			else
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1095  				migrate_enable();
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1096  		}
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1097  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1098  		console_srcu_read_unlock(cookie);
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1099  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1100  		cond_resched();
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1101  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1102  	} while (backlog);
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1103  
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1104  	goto wait_for_event;
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1105  }
da042bbb7a3ffc Sebastian Andrzej Siewior 2023-10-04  1106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
