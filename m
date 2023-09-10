Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAC3180
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 06:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694327490; x=1725863490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xEjiCvlcnc2yaFSgPe3rOsl61pFfFCyOlUprZ3t3rgE=;
  b=I9Hxfe2TpYQxnIkYJ/c4vyzX2e4ORGQvYV+nlfLtEpA9CANv+jAa00QK
   6Pm3Z7tuKI1C0vm8DTT4zl8iQoBy/0FXUe3u9B+/zZcIg5ZbqmMMfm1ao
   c3vX4SDep7oP/HAAO2C+NUMuA067r+uF7P3Zcipnp/Y9KbJ6sTSnNrUPE
   67SEaPFLbtGBrLSP4v/6W3lNSA5fW5B6XwVqlX/5tnLmMeg3ZGCzu0/rh
   s/EuQM6v8n1+4wHUBeYbGT8vMreCzhsylj12/JoW4DAIPxBdYfuNerC4O
   Yi6PfyNvjtkze4G/tnMntRXNMlpkKeibazC7K3ZTBrZ5i7rNEEoD4DySR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="408850252"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="408850252"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 23:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="916627377"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="916627377"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2023 23:31:28 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfDyg-0004Wi-0D;
	Sun, 10 Sep 2023 06:31:26 +0000
Date: Sun, 10 Sep 2023 14:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/workqueue.c:324:40: sparse: sparse: duplicate [noderef]
Message-ID: <202309101431.8jVt4Xbs-lkp@intel.com>
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
head:   535a265d7f0dd50d8c3a4f8b4f3a452d56bd160f
commit: 636b927eba5bc633753f8eb80f35e1d5be806e51 workqueue: Make unbound workqueues to use per-cpu pool_workqueues
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-061-20230909 (https://download.01.org/0day-ci/archive/20230910/202309101431.8jVt4Xbs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309101431.8jVt4Xbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309101431.8jVt4Xbs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/workqueue.c:324:40: sparse: sparse: duplicate [noderef]
>> kernel/workqueue.c:324:40: sparse: sparse: multiple address spaces given: __percpu & __rcu

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
