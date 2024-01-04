Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2081620B09
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAw0cwlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704368054; x=1735904054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBdwXnI52j6m3l7tPIvVhFMdV9VCN54wrEORzcSJLWg=;
  b=kAw0cwlunV5yhGrkoDEcTskDKGLB4/IiBA+INA6Nwo7R7elmCtQglxym
   TjjxRZpXv9L/DjS4QJOkErHVSKRbz6VCd4pSZADoyEAEkZcBNIJmkUtim
   /qp39Ud763VTCmuLZrXKQli70Pu520P3BqDrbsiYb1n9k5OBqM+83iRc+
   MTWmtzp9blqYslqN2nioGORFyH9kAZ8/2MmhJGDYxO++EpnBs40N4gQTO
   mfNQHtXmR20mxv6wGL9rnZ9sAdl6oqPohDt5ogVbd/bkpQa2PBaVsXiSU
   1fWH9s+/IQ+YK9dYtA5Io+Su2KzMPicjC/fJtyu9xXcoBycmlDfcshHyw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="461520095"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="461520095"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 03:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="780357278"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="780357278"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 04 Jan 2024 03:34:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLLz6-000NFL-1W;
	Thu, 04 Jan 2024 11:34:00 +0000
Date: Thu, 4 Jan 2024 19:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/workqueue.c:324:40: sparse: sparse: duplicate [noderef]
Message-ID: <202401041908.hJxEdtcR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/workqueue.c:324:40: sparse: sparse: duplicate [noderef]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac865f00af293d081356bec56eea90815094a60e
commit: 636b927eba5bc633753f8eb80f35e1d5be806e51 workqueue: Make unbound workqueues to use per-cpu pool_workqueues
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: csky-randconfig-r013-20230825 (https://download.01.org/0day-ci/archive/20240104/202401041908.hJxEdtcR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240104/202401041908.hJxEdtcR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401041908.hJxEdtcR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/workqueue.c:324:40: sparse: sparse: duplicate [noderef]
   kernel/workqueue.c:324:40: sparse: sparse: multiple address spaces given: __percpu & __rcu

vim +324 kernel/workqueue.c

226223ab3c4118 Tejun Heo       2013-03-12  279  
^1da177e4c3f41 Linus Torvalds  2005-04-16  280  /*
c5aa87bbf4b23f Tejun Heo       2013-03-13  281   * The externally visible workqueue.  It relays the issued work items to
c5aa87bbf4b23f Tejun Heo       2013-03-13  282   * the appropriate worker_pool through its pool_workqueues.
^1da177e4c3f41 Linus Torvalds  2005-04-16  283   */
^1da177e4c3f41 Linus Torvalds  2005-04-16  284  struct workqueue_struct {
3c25a55daadc7e Lai Jiangshan   2013-03-25  285  	struct list_head	pwqs;		/* WR: all pwqs of this wq */
e2dca7adff8f3f Tejun Heo       2015-03-09  286  	struct list_head	list;		/* PR: list of all workqueues */
73f53c4aa732ec Tejun Heo       2010-06-29  287  
3c25a55daadc7e Lai Jiangshan   2013-03-25  288  	struct mutex		mutex;		/* protects this wq */
3c25a55daadc7e Lai Jiangshan   2013-03-25  289  	int			work_color;	/* WQ: current work color */
3c25a55daadc7e Lai Jiangshan   2013-03-25  290  	int			flush_color;	/* WQ: current flush color */
112202d9098aae Tejun Heo       2013-02-13  291  	atomic_t		nr_pwqs_to_flush; /* flush in progress */
3c25a55daadc7e Lai Jiangshan   2013-03-25  292  	struct wq_flusher	*first_flusher;	/* WQ: first flusher */
3c25a55daadc7e Lai Jiangshan   2013-03-25  293  	struct list_head	flusher_queue;	/* WQ: flush waiters */
3c25a55daadc7e Lai Jiangshan   2013-03-25  294  	struct list_head	flusher_overflow; /* WQ: flush overflow list */
73f53c4aa732ec Tejun Heo       2010-06-29  295  
2e109a2855bf6c Tejun Heo       2013-03-13  296  	struct list_head	maydays;	/* MD: pwqs requesting rescue */
30ae2fc0a75eb5 Tejun Heo       2019-09-20  297  	struct worker		*rescuer;	/* MD: rescue worker */
e22bee782b3b00 Tejun Heo       2010-06-29  298  
87fc741e94cf64 Lai Jiangshan   2013-03-25  299  	int			nr_drainers;	/* WQ: drain in progress */
a357fc03262988 Lai Jiangshan   2013-03-25  300  	int			saved_max_active; /* WQ: saved pwq max_active */
226223ab3c4118 Tejun Heo       2013-03-12  301  
5b95e1af8d17d8 Lai Jiangshan   2015-05-12  302  	struct workqueue_attrs	*unbound_attrs;	/* PW: only for unbound wqs */
5b95e1af8d17d8 Lai Jiangshan   2015-05-12  303  	struct pool_workqueue	*dfl_pwq;	/* PW: only for unbound wqs */
6029a91829ad2b Tejun Heo       2013-04-01  304  
226223ab3c4118 Tejun Heo       2013-03-12  305  #ifdef CONFIG_SYSFS
226223ab3c4118 Tejun Heo       2013-03-12  306  	struct wq_device	*wq_dev;	/* I: for sysfs interface */
226223ab3c4118 Tejun Heo       2013-03-12  307  #endif
4e6045f134784f Johannes Berg   2007-10-18  308  #ifdef CONFIG_LOCKDEP
669de8bda87b92 Bart Van Assche 2019-02-14  309  	char			*lock_name;
669de8bda87b92 Bart Van Assche 2019-02-14  310  	struct lock_class_key	key;
4e6045f134784f Johannes Berg   2007-10-18  311  	struct lockdep_map	lockdep_map;
4e6045f134784f Johannes Berg   2007-10-18  312  #endif
ecf6881ff349ad Tejun Heo       2013-04-01  313  	char			name[WQ_NAME_LEN]; /* I: workqueue name */
2728fd2f098c3c Tejun Heo       2013-04-01  314  
e2dca7adff8f3f Tejun Heo       2015-03-09  315  	/*
24acfb71822566 Thomas Gleixner 2019-03-13  316  	 * Destruction of workqueue_struct is RCU protected to allow walking
24acfb71822566 Thomas Gleixner 2019-03-13  317  	 * the workqueues list without grabbing wq_pool_mutex.
e2dca7adff8f3f Tejun Heo       2015-03-09  318  	 * This is used to dump all workqueues from sysrq.
e2dca7adff8f3f Tejun Heo       2015-03-09  319  	 */
e2dca7adff8f3f Tejun Heo       2015-03-09  320  	struct rcu_head		rcu;
e2dca7adff8f3f Tejun Heo       2015-03-09  321  
2728fd2f098c3c Tejun Heo       2013-04-01  322  	/* hot fields used during command issue, aligned to cacheline */
2728fd2f098c3c Tejun Heo       2013-04-01  323  	unsigned int		flags ____cacheline_aligned; /* WQ: WQ_* flags */
636b927eba5bc6 Tejun Heo       2023-08-07 @324  	struct pool_workqueue __percpu __rcu **cpu_pwq; /* I: per-cpu pwqs */
^1da177e4c3f41 Linus Torvalds  2005-04-16  325  };
^1da177e4c3f41 Linus Torvalds  2005-04-16  326  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
