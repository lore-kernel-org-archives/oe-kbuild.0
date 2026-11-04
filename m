Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825214;
	b=R6iBhiWt+OyTqra6lC5G31bV0YDNlqFSgd8qxWOIqujdb/9P8o6bsZYjwrBD/UCWSvRZ
	 U8KD1/UW6ewktcb5nFJ8G8fXV+AF9LRpqanv81SE+KyJJus2P3AShzON+dsObk8ZEspVL
	 WpPVP7SSAjkd877IusUxBTDtV5XK/+0wh1fSy2y+WOVfHyTj35hArzsh+Czp2x/yKGwEr
	 ErLugnKleuvFK8+5E1oFIGZ0OoQ5G4ZmbwQO3Wf0oV0YN0wNAu7eYB1ouDqW//WF/tuqH
	 UdEjYCD13jFIUckzowsEVOkAhRQwtkW3eWv+58yPcxseeY7EvBzQMr+UhwjYANI3pyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825214;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RNLcbsfCHtMDK7rMG8gM/KBOzX02mEwpdHp3B2voEL4=;
	b=BkQgPNCY/KLajKOUWerIFV271Z8TabUeFhlMfgr70UG3/6wSTZnFD36Yh9nBijym9tkd
	 jIn2LEwdE1fz4qrlTH9rltVdJzUy2mVbLpSa2orJi95dZdEitZEjSbsKmDErS1xtL0HnV
	 nTvqsWpwpE3fCnrsBC3O40aa0GSS9xFuS2VnMBCFr2WRCVPsvLO2fCGddN9IwMqZ9Izoy
	 kcC8RqVqpyRB2YTjJ0F2kFfyLd91Vb1ZrwW96slbGNDOxEUefsc8ctTeK/mDFLRVJ4o+h
	 rpK3iy5K17l5AmMkp00OggRZ18kyrPWPV7/NrSOj40V1LrP9KoQDnxl49byoicMSgZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="l/uxRD48";
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DCE60960B5
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Nov 2026 20:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DCE60960B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l/uxRD48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793825213; x=1825361213;
  h=date:from:to:cc:subject:message-id;
  bh=hNJhSL2jaseImIU7mkRVnGcpvEg4vw0TlXuNdb3pPdY=;
  b=l/uxRD48wJt9uAkJeJqA97XOnpQsm/gAj0D2FTjwtv6H3zzYCAPChQex
   YlckwVAkjTf4eiTeDJ9XTaPUXNqTjeYxSqnC8X5N3U768Nmy2pHtMmrnm
   q2ExnxsFMtQ+GBu3jLM/N8nJBfmR/UczDIpoyJb88eYk+tWJu3aexCSgo
   AS+NzGnB8m1lbijogY4mPUgZWfpmZk8nIa/pamDhhGgacq/vceybtGKBL
   3VonZ7DT9A0rFAnoj4eFF7EobFhOYxMhCiA6uigxstXRiuPn6x7lnVoK5
   JNg+oP2brj3VB12SrUlPNtOP77rFnvzqLF/MFzP79DhWj0SHQcJXWJUCf
   w==;
X-CSE-ConnectionGUID: 2dQTBCQ8SZOYPGGL1BxwOw==
X-CSE-MsgGUID: +6j3GQ2cRaeoX/053WlQZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2614177"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2614177"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:46:52 -0800
X-CSE-ConnectionGUID: B4mCMjqmRBKRCo5145qEuQ==
X-CSE-MsgGUID: c+ixMavcQB6ZAnm6JBAdNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7140207"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2026 12:46:51 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOhse-000000009GR-3iNr;
	Wed, 04 Nov 2026 20:46:48 +0000
Date: Wed, 04 Nov 2026 21:46:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: io_uring/cancel.c:780:0-1: preceding lock on line 715
Message-ID: <202611042132.v9eaOUmV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chris Mason <chris.mason@fusionio.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05441d697f7f9a927264f4058cbbc6a03dfcac9d
commit: cb0306c52ffae083a86fb283de67875ae7a9500e io_uring/cancel: drop sqd->lock while SQPOLL waits
date:   7 days ago
:::::: branch date: 28 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-2102-20261104 (https://download.01.org/0day-ci/archive/20261104/202611042132.v9eaOUmV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cb0306c52ffa ("io_uring/cancel: drop sqd->lock while SQPOLL waits")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611042132.v9eaOUmV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/cancel.c:780:0-1: preceding lock on line 715
   io_uring/cancel.c:780:0-1: preceding lock on line 764
>> io_uring/cancel.c:780:0-1: preceding lock on line 715
   io_uring/cancel.c:780:0-1: preceding lock on line 764

vim +780 io_uring/cancel.c

044e5f30b3e0ef Jens Axboe                                2026-09-08  641  
ffce3243643182 Jens Axboe                                2025-11-03  642  /*
ffce3243643182 Jens Axboe                                2025-11-03  643   * Find any io_uring ctx that this task has registered or done IO on, and cancel
ffce3243643182 Jens Axboe                                2025-11-03  644   * requests. @sqd should be not-null IFF it's an SQPOLL thread cancellation.
ffce3243643182 Jens Axboe                                2025-11-03  645   */
ffce3243643182 Jens Axboe                                2025-11-03  646  __cold void io_uring_cancel_generic(bool cancel_all, struct io_sq_data *sqd)
ffce3243643182 Jens Axboe                                2025-11-03  647  {
ffce3243643182 Jens Axboe                                2025-11-03  648  	struct io_uring_task *tctx = current->io_uring;
ffce3243643182 Jens Axboe                                2025-11-03  649  	struct io_ring_ctx *ctx;
ffce3243643182 Jens Axboe                                2025-11-03  650  	struct io_tctx_node *node;
044e5f30b3e0ef Jens Axboe                                2026-09-08  651  	unsigned int flags = 0;
ffce3243643182 Jens Axboe                                2025-11-03  652  	unsigned long index;
044e5f30b3e0ef Jens Axboe                                2026-09-08  653  	bool group_exit;
ffce3243643182 Jens Axboe                                2025-11-03  654  	s64 inflight;
ffce3243643182 Jens Axboe                                2025-11-03  655  	DEFINE_WAIT(wait);
ffce3243643182 Jens Axboe                                2025-11-03  656  
ffce3243643182 Jens Axboe                                2025-11-03  657  	WARN_ON_ONCE(sqd && sqpoll_task_locked(sqd) != current);
ffce3243643182 Jens Axboe                                2025-11-03  658  
ffce3243643182 Jens Axboe                                2025-11-03  659  	if (!current->io_uring)
ffce3243643182 Jens Axboe                                2025-11-03  660  		return;
ffce3243643182 Jens Axboe                                2025-11-03  661  	if (tctx->io_wq)
ffce3243643182 Jens Axboe                                2025-11-03  662  		io_wq_exit_start(tctx->io_wq);
ffce3243643182 Jens Axboe                                2025-11-03  663  
044e5f30b3e0ef Jens Axboe                                2026-09-08  664  	/*
044e5f30b3e0ef Jens Axboe                                2026-09-08  665  	 * If a whole thread group is exiting, nobody will look at completions.
044e5f30b3e0ef Jens Axboe                                2026-09-08  666  	 * If a single thread is exiting, cancel only those that belong to that
044e5f30b3e0ef Jens Axboe                                2026-09-08  667  	 * thread.
044e5f30b3e0ef Jens Axboe                                2026-09-08  668  	 */
044e5f30b3e0ef Jens Axboe                                2026-09-08  669  	group_exit = !cancel_all && io_task_group_exiting();
044e5f30b3e0ef Jens Axboe                                2026-09-08  670  	if (cancel_all)
044e5f30b3e0ef Jens Axboe                                2026-09-08  671  		flags = IO_CANCEL_ALL;
044e5f30b3e0ef Jens Axboe                                2026-09-08  672  	else if (group_exit)
044e5f30b3e0ef Jens Axboe                                2026-09-08  673  		flags = IO_CANCEL_ALL | IO_CANCEL_KEEP_TIMEOUTS;
044e5f30b3e0ef Jens Axboe                                2026-09-08  674  	if (sqd)
044e5f30b3e0ef Jens Axboe                                2026-09-08  675  		flags |= IO_CANCEL_SQPOLL;
044e5f30b3e0ef Jens Axboe                                2026-09-08  676  
ffce3243643182 Jens Axboe                                2025-11-03  677  	atomic_inc(&tctx->in_cancel);
ffce3243643182 Jens Axboe                                2025-11-03  678  	do {
ffce3243643182 Jens Axboe                                2025-11-03  679  		bool loop = false;
044e5f30b3e0ef Jens Axboe                                2026-09-08  680  		unsigned int state;
ffce3243643182 Jens Axboe                                2025-11-03  681  
ffce3243643182 Jens Axboe                                2025-11-03  682  		io_uring_drop_tctx_refs(current);
044e5f30b3e0ef Jens Axboe                                2026-09-08  683  		if (io_tctx_cancel_done(tctx, cancel_all, group_exit))
ffce3243643182 Jens Axboe                                2025-11-03  684  			break;
ffce3243643182 Jens Axboe                                2025-11-03  685  
ffce3243643182 Jens Axboe                                2025-11-03  686  		/* read completions before cancelations */
ffce3243643182 Jens Axboe                                2025-11-03  687  		inflight = tctx_inflight(tctx, false);
ffce3243643182 Jens Axboe                                2025-11-03  688  
ffce3243643182 Jens Axboe                                2025-11-03  689  		if (!sqd) {
ffce3243643182 Jens Axboe                                2025-11-03  690  			xa_for_each(&tctx->xa, index, node) {
ffce3243643182 Jens Axboe                                2025-11-03  691  				/* sqpoll task will cancel all its requests */
ffce3243643182 Jens Axboe                                2025-11-03  692  				if (node->ctx->sq_data)
ffce3243643182 Jens Axboe                                2025-11-03  693  					continue;
ffce3243643182 Jens Axboe                                2025-11-03  694  				loop |= io_uring_try_cancel_requests(node->ctx,
ffce3243643182 Jens Axboe                                2025-11-03  695  							current->io_uring,
044e5f30b3e0ef Jens Axboe                                2026-09-08  696  							flags);
ffce3243643182 Jens Axboe                                2025-11-03  697  			}
ffce3243643182 Jens Axboe                                2025-11-03  698  		} else {
ffce3243643182 Jens Axboe                                2025-11-03  699  			list_for_each_entry(ctx, &sqd->ctx_list, sqd_list)
ffce3243643182 Jens Axboe                                2025-11-03  700  				loop |= io_uring_try_cancel_requests(ctx,
ffce3243643182 Jens Axboe                                2025-11-03  701  								     current->io_uring,
044e5f30b3e0ef Jens Axboe                                2026-09-08  702  								     flags);
ffce3243643182 Jens Axboe                                2025-11-03  703  		}
ffce3243643182 Jens Axboe                                2025-11-03  704  
ffce3243643182 Jens Axboe                                2025-11-03  705  		if (loop) {
cb0306c52ffae0 Chris Mason                               2026-10-25  706  			/*
cb0306c52ffae0 Chris Mason                               2026-10-25  707  			 * A request that runs in io-wq and doesn't end makes
cb0306c52ffae0 Chris Mason                               2026-10-25  708  			 * each round come here. Don't hold sqd->lock for that
cb0306c52ffae0 Chris Mason                               2026-10-25  709  			 * long either.
cb0306c52ffae0 Chris Mason                               2026-10-25  710  			 */
cb0306c52ffae0 Chris Mason                               2026-10-25  711  			if (sqd)
cb0306c52ffae0 Chris Mason                               2026-10-25  712  				mutex_unlock(&sqd->lock);
ffce3243643182 Jens Axboe                                2025-11-03  713  			cond_resched();
cb0306c52ffae0 Chris Mason                               2026-10-25  714  			if (sqd)
cb0306c52ffae0 Chris Mason                               2026-10-25 @715  				mutex_lock(&sqd->lock);
ffce3243643182 Jens Axboe                                2025-11-03  716  			continue;
ffce3243643182 Jens Axboe                                2025-11-03  717  		}
ffce3243643182 Jens Axboe                                2025-11-03  718  
044e5f30b3e0ef Jens Axboe                                2026-09-08  719  		state = TASK_INTERRUPTIBLE;
044e5f30b3e0ef Jens Axboe                                2026-09-08  720  		if (task_sigpending(current))
044e5f30b3e0ef Jens Axboe                                2026-09-08  721  			state = TASK_UNINTERRUPTIBLE;
044e5f30b3e0ef Jens Axboe                                2026-09-08  722  		if (!cancel_all)
044e5f30b3e0ef Jens Axboe                                2026-09-08  723  			state |= TASK_FREEZABLE;
044e5f30b3e0ef Jens Axboe                                2026-09-08  724  		prepare_to_wait(&tctx->wait, &wait, state);
ffce3243643182 Jens Axboe                                2025-11-03  725  		io_run_task_work();
ffce3243643182 Jens Axboe                                2025-11-03  726  		io_uring_drop_tctx_refs(current);
fddcf4c5321b3e Cen Zhang (Microsoft Security FORGE Labs  2026-10-08  727) 		/* only skip the sleep for local work this task may run */
ffce3243643182 Jens Axboe                                2025-11-03  728  		xa_for_each(&tctx->xa, index, node) {
76a82c666abf15 Josef Bacik                               2026-10-15  729  			if (!(node->ctx->flags & IORING_SETUP_DEFER_TASKRUN) ||
76a82c666abf15 Josef Bacik                               2026-10-15  730  			    !io_allowed_defer_tw_run(node->ctx))
76a82c666abf15 Josef Bacik                               2026-10-15  731  				continue;
76a82c666abf15 Josef Bacik                               2026-10-15  732  			/*
76a82c666abf15 Josef Bacik                               2026-10-15  733  			 * The wake up io_uring_try_cancel_requests() asked for
76a82c666abf15 Josef Bacik                               2026-10-15  734  			 * may have been issued while we were still running. Ask
76a82c666abf15 Josef Bacik                               2026-10-15  735  			 * again now that it can't be missed.
76a82c666abf15 Josef Bacik                               2026-10-15  736  			 */
76a82c666abf15 Josef Bacik                               2026-10-15  737  			atomic_set(&node->ctx->cq_wait_nr, 1);
76a82c666abf15 Josef Bacik                               2026-10-15  738  			/* pairs with the xchg() in mpscq_push() */
76a82c666abf15 Josef Bacik                               2026-10-15  739  			smp_mb();
76a82c666abf15 Josef Bacik                               2026-10-15  740  			if (io_local_work_pending(node->ctx))
ffce3243643182 Jens Axboe                                2025-11-03  741  				goto end_wait;
ffce3243643182 Jens Axboe                                2025-11-03  742  		}
ffce3243643182 Jens Axboe                                2025-11-03  743  		/*
ffce3243643182 Jens Axboe                                2025-11-03  744  		 * If we've seen completions, retry without waiting. This
ffce3243643182 Jens Axboe                                2025-11-03  745  		 * avoids a race where a completion comes in before we did
ffce3243643182 Jens Axboe                                2025-11-03  746  		 * prepare_to_wait().
ffce3243643182 Jens Axboe                                2025-11-03  747  		 */
044e5f30b3e0ef Jens Axboe                                2026-09-08  748  		if (inflight == tctx_inflight(tctx, false)) {
044e5f30b3e0ef Jens Axboe                                2026-09-08  749  			unsigned long timeout = 1;
044e5f30b3e0ef Jens Axboe                                2026-09-08  750  
044e5f30b3e0ef Jens Axboe                                2026-09-08  751  			if (state & TASK_INTERRUPTIBLE)
044e5f30b3e0ef Jens Axboe                                2026-09-08  752  				timeout = MAX_SCHEDULE_TIMEOUT;
cb0306c52ffae0 Chris Mason                               2026-10-25  753  			/*
cb0306c52ffae0 Chris Mason                               2026-10-25  754  			 * A zero-copy notification can't be canceled, and a
cb0306c52ffae0 Chris Mason                               2026-10-25  755  			 * peer that doesn't read keeps it pending. Don't hold
cb0306c52ffae0 Chris Mason                               2026-10-25  756  			 * sqd->lock while waiting for it, or whoever wants the
cb0306c52ffae0 Chris Mason                               2026-10-25  757  			 * lock sleeps as long. No ring is used across this,
cb0306c52ffae0 Chris Mason                               2026-10-25  758  			 * the next round walks ->ctx_list anew.
cb0306c52ffae0 Chris Mason                               2026-10-25  759  			 */
cb0306c52ffae0 Chris Mason                               2026-10-25  760  			if (sqd)
cb0306c52ffae0 Chris Mason                               2026-10-25  761  				mutex_unlock(&sqd->lock);
044e5f30b3e0ef Jens Axboe                                2026-09-08  762  			schedule_timeout(timeout);
cb0306c52ffae0 Chris Mason                               2026-10-25  763  			if (sqd)
cb0306c52ffae0 Chris Mason                               2026-10-25  764  				mutex_lock(&sqd->lock);
044e5f30b3e0ef Jens Axboe                                2026-09-08  765  		}
ffce3243643182 Jens Axboe                                2025-11-03  766  end_wait:
ffce3243643182 Jens Axboe                                2025-11-03  767  		finish_wait(&tctx->wait, &wait);
ffce3243643182 Jens Axboe                                2025-11-03  768  	} while (1);
ffce3243643182 Jens Axboe                                2025-11-03  769  
ffce3243643182 Jens Axboe                                2025-11-03  770  	io_uring_clean_tctx(tctx);
ffce3243643182 Jens Axboe                                2025-11-03  771  	if (cancel_all) {
ffce3243643182 Jens Axboe                                2025-11-03  772  		/*
ffce3243643182 Jens Axboe                                2025-11-03  773  		 * We shouldn't run task_works after cancel, so just leave
ffce3243643182 Jens Axboe                                2025-11-03  774  		 * ->in_cancel set for normal exit.
ffce3243643182 Jens Axboe                                2025-11-03  775  		 */
ffce3243643182 Jens Axboe                                2025-11-03  776  		atomic_dec(&tctx->in_cancel);
ffce3243643182 Jens Axboe                                2025-11-03  777  		/* for exec all current's requests should be gone, kill tctx */
bc0e8faf90e776 Kyumin Lee                                2026-07-31  778  		io_uring_free_tctx(current);
ffce3243643182 Jens Axboe                                2025-11-03  779  	}
ffce3243643182 Jens Axboe                                2025-11-03 @780  }

:::::: The code at line 780 was first introduced by commit
:::::: ffce324364318220acf83e576eac06549cbf9911 io_uring/cancel: move cancelation code from io_uring.c to cancel.c

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
