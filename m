Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F4C284B36
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 12:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435284; cv=none; b=PQP5q8TL5f0jxa+UsiS3RuOGBvauzJGo4B2TJWev2R7Wsb+x22CuEv7o+hhbd/Oboaia9fwxFgAYpOEPHx+vlyDn3NmD+UTjuK8FbunXhUbv7ERyRHSDiyLNAOsQlcfdKL1GW4B3ohxFzdDf9ptsego91k/iclILXE+gKdQLPjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435284; c=relaxed/simple;
	bh=m8efwWdOuYK5Gapn0/nKrA91MNq3xSrTBT0kQ5w5TTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hy1eZ9gdZE+zdBAIx7rc/NoBTYzURBelQV04tbHYNuztGKf5OD+QLUe5BKUTM3xiS+PxdtxnNCKN/hxeX9YwjRdYJS4FvzGuDd7kftg81pMHyqOYWPvGCa88fNRE2HRiYmM8sotyjsLz5Ob7r3ZObQZRpt18gYFDrrt7GzUoijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvEseus9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvEseus9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748435283; x=1779971283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m8efwWdOuYK5Gapn0/nKrA91MNq3xSrTBT0kQ5w5TTQ=;
  b=SvEseus9W1V+B527QDNTzIm/BFR36TbFyJQV26deP6a7W6ARPabmBaLn
   MA6Tz4R48GUAcBT110biLTbzAo/FGSphFTlyRLuCqFCrFjnBz4H6FHM86
   S0xB/vIB4C0HRHTvgrChOgn4n7zi6p/b4E62+zLI4u49vkeDncZdHl19/
   WWXQLANhhHLpKaW4Ynh03drGnnguudW8nMTwIv0eZA5xXjee+TaYkNnP9
   uWucRp09iaEhTJysm0AftbcKYI89Hj+22bvgduEOtX8UtkIgHzT91NcGI
   +b/HPXwWkzy8aNU85ivELd19ru/WBrnRC6KscHZjUvq/3GQya7p1r3Jib
   w==;
X-CSE-ConnectionGUID: waPaBs2wQm+raql5b21i5Q==
X-CSE-MsgGUID: JtqxdrZ5QBeqpBho6lfk2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61858584"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61858584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 05:28:02 -0700
X-CSE-ConnectionGUID: YVbQzormRsGUNhADRPavzw==
X-CSE-MsgGUID: BxdC5gObQWuOop9zzVH5BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143868225"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 May 2025 05:28:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKFt1-000VeW-16;
	Wed, 28 May 2025 12:27:59 +0000
Date: Wed, 28 May 2025 20:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jlayton:rpc-numa 1/2] net/sunrpc/svc.c:761
 svc_pool_wake_idle_thread() error: uninitialized symbol 'rqstp'.
Message-ID: <202505282030.8lexZF9u-lkp@intel.com>
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
TO: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git rpc-numa
head:   4fb548fc918eae3b330e50c56bae2a0b02b9b157
commit: a0d4dce2778e63a6410a5606d50a17426a4251fd [1/2] sunrpc: new tracepoints around thread wakeups
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-r073-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282030.8lexZF9u-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505282030.8lexZF9u-lkp@intel.com/

smatch warnings:
net/sunrpc/svc.c:761 svc_pool_wake_idle_thread() error: uninitialized symbol 'rqstp'.

vim +/rqstp +761 net/sunrpc/svc.c

0113ab34644649 Jeff Layton 2008-01-29  730  
850bac3ae4a636 Chuck Lever 2023-07-10  731  /**
850bac3ae4a636 Chuck Lever 2023-07-10  732   * svc_pool_wake_idle_thread - Awaken an idle thread in @pool
850bac3ae4a636 Chuck Lever 2023-07-10  733   * @pool: service thread pool
850bac3ae4a636 Chuck Lever 2023-07-10  734   *
850bac3ae4a636 Chuck Lever 2023-07-10  735   * Can be called from soft IRQ or process context. Finding an idle
850bac3ae4a636 Chuck Lever 2023-07-10  736   * service thread and marking it BUSY is atomic with respect to
850bac3ae4a636 Chuck Lever 2023-07-10  737   * other calls to svc_pool_wake_idle_thread().
850bac3ae4a636 Chuck Lever 2023-07-10  738   *
850bac3ae4a636 Chuck Lever 2023-07-10  739   */
2a4557452aacf9 NeilBrown   2023-07-31  740  void svc_pool_wake_idle_thread(struct svc_pool *pool)
850bac3ae4a636 Chuck Lever 2023-07-10  741  {
850bac3ae4a636 Chuck Lever 2023-07-10  742  	struct svc_rqst	*rqstp;
9bd4161c591710 NeilBrown   2023-09-11  743  	struct llist_node *ln;
850bac3ae4a636 Chuck Lever 2023-07-10  744  
850bac3ae4a636 Chuck Lever 2023-07-10  745  	rcu_read_lock();
5b80147e0c7018 NeilBrown   2023-09-11  746  	ln = READ_ONCE(pool->sp_idle_threads.first);
9bd4161c591710 NeilBrown   2023-09-11  747  	if (ln) {
9bd4161c591710 NeilBrown   2023-09-11  748  		rqstp = llist_entry(ln, struct svc_rqst, rq_idle);
850bac3ae4a636 Chuck Lever 2023-07-10  749  		WRITE_ONCE(rqstp->rq_qtime, ktime_get());
5b80147e0c7018 NeilBrown   2023-09-11  750  		if (!task_is_running(rqstp->rq_task)) {
850bac3ae4a636 Chuck Lever 2023-07-10  751  			wake_up_process(rqstp->rq_task);
a0d4dce2778e63 Jeff Layton 2025-05-27  752  			trace_svc_pool_thread_wake(pool, rqstp->rq_task->pid);
5b80147e0c7018 NeilBrown   2023-09-11  753  			percpu_counter_inc(&pool->sp_threads_woken);
a0d4dce2778e63 Jeff Layton 2025-05-27  754  		} else {
a0d4dce2778e63 Jeff Layton 2025-05-27  755  			trace_svc_pool_thread_running(pool, rqstp->rq_task->pid);
5b80147e0c7018 NeilBrown   2023-09-11  756  		}
5b80147e0c7018 NeilBrown   2023-09-11  757  		rcu_read_unlock();
2a4557452aacf9 NeilBrown   2023-07-31  758  		return;
850bac3ae4a636 Chuck Lever 2023-07-10  759  	}
850bac3ae4a636 Chuck Lever 2023-07-10  760  	rcu_read_unlock();
a0d4dce2778e63 Jeff Layton 2025-05-27 @761  	trace_svc_pool_thread_noidle(pool, rqstp->rq_task->pid);
850bac3ae4a636 Chuck Lever 2023-07-10  762  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
