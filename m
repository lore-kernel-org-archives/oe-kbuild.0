Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A56D134CB
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 20:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689365685; x=1720901685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDu7BSx2Pit1HfEPviqD1GPRC8HbVxuwIsfn+1WtXKc=;
  b=Z8f51RKZFd5f2WSDpaOqgsqcE0CfCiI5WjQpKTUVyoFxlZWeFS+k54aV
   AutTeAakC2amalhZ1eRlV2uE/HeC2E6c/KH2jEzopsf9bejzhYVI0BdRp
   oPq+E33gltgrUhMCw+oZ0N1yLk0Zsug/RQSGSE3LekGs0RrxqtiMtXNbp
   yKMM82+X7GnGkfjUSaBRSdHSERbV9/Dxgr0OsYLAtnIYQpx0kEvYyEYzR
   6FVyjbAxR8bEcd6isbySk1IQD8fuBW4nXqEmhtknNUK5gyfvrcVhBa1gl
   aOvXC1c1fj1JuBr3GeCmenI/8Gy1+ECm5Uw0XzbS3e0CaTmvG+VDZnr9I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="431744256"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="431744256"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 13:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="896528720"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="896528720"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Jul 2023 13:14:43 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKPBa-0007fp-1j;
	Fri, 14 Jul 2023 20:14:42 +0000
Date: Sat, 15 Jul 2023 04:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [oracle-dtrace:v2/6.4 10/13] fs/eventpoll.c:1300
 ep_ptable_queue_proc() warn: maybe use && instead of &
Message-ID: <202307150418.yMkaVxN8-lkp@intel.com>
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
TO: Nick Alcock <nick.alcock@oracle.com>
CC: Kris Van Hees <kris.van.hees@oracle.com>
CC: Tomas Jedlicka <tomas.jedlicka@oracle.com>
CC: Eugene Loh <eugene.loh@oracle.com>
CC: David Mc Lean <david.mclean@oracle.com>
CC: Vincent Lim <vincent.lim@oracle.com>

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 19ce4a9705869b25a970a68669e8837cf78b1ead [10/13] waitfd: new syscall implementing waitpid() over fds
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: m68k-randconfig-m041-20230713 (https://download.01.org/0day-ci/archive/20230715/202307150418.yMkaVxN8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150418.yMkaVxN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307150418.yMkaVxN8-lkp@intel.com/

smatch warnings:
fs/eventpoll.c:1300 ep_ptable_queue_proc() warn: maybe use && instead of &

vim +1300 fs/eventpoll.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1285  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1286  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  1287   * This is the callback that is used to add our wait queue to the
^1da177e4c3f41 Linus Torvalds 2005-04-16  1288   * target file wakeup lists.
^1da177e4c3f41 Linus Torvalds 2005-04-16  1289   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1290  static void ep_ptable_queue_proc(struct file *file, wait_queue_head_t *whead,
19ce4a9705869b Nick Alcock    2018-11-14  1291  				 poll_table *pt, unsigned long fixed_event)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1292  {
364f374f22ba1b Al Viro        2020-09-02  1293  	struct ep_pqueue *epq = container_of(pt, struct ep_pqueue, pt);
364f374f22ba1b Al Viro        2020-09-02  1294  	struct epitem *epi = epq->epi;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1295  	struct eppoll_entry *pwq;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1296  
364f374f22ba1b Al Viro        2020-09-02  1297  	if (unlikely(!epi))	// an earlier allocation has failed
364f374f22ba1b Al Viro        2020-09-02  1298  		return;
364f374f22ba1b Al Viro        2020-09-02  1299  
19ce4a9705869b Nick Alcock    2018-11-14 @1300  	if (fixed_event & !(epi->event.events & fixed_event))
19ce4a9705869b Nick Alcock    2018-11-14  1301  		return;
19ce4a9705869b Nick Alcock    2018-11-14  1302  
19ce4a9705869b Nick Alcock    2018-11-14  1303  	if (fixed_event)
19ce4a9705869b Nick Alcock    2018-11-14  1304  		epi->fixed_event = fixed_event;
19ce4a9705869b Nick Alcock    2018-11-14  1305  
364f374f22ba1b Al Viro        2020-09-02  1306  	pwq = kmem_cache_alloc(pwq_cache, GFP_KERNEL);
364f374f22ba1b Al Viro        2020-09-02  1307  	if (unlikely(!pwq)) {
364f374f22ba1b Al Viro        2020-09-02  1308  		epq->epi = NULL;
364f374f22ba1b Al Viro        2020-09-02  1309  		return;
364f374f22ba1b Al Viro        2020-09-02  1310  	}
364f374f22ba1b Al Viro        2020-09-02  1311  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1312  	init_waitqueue_func_entry(&pwq->wait, ep_poll_callback);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1313  	pwq->whead = whead;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1314  	pwq->base = epi;
df0108c5da561c Jason Baron    2016-01-20  1315  	if (epi->event.events & EPOLLEXCLUSIVE)
df0108c5da561c Jason Baron    2016-01-20  1316  		add_wait_queue_exclusive(whead, &pwq->wait);
df0108c5da561c Jason Baron    2016-01-20  1317  	else
^1da177e4c3f41 Linus Torvalds 2005-04-16  1318  		add_wait_queue(whead, &pwq->wait);
80285b75c68348 Al Viro        2020-09-02  1319  	pwq->next = epi->pwqlist;
80285b75c68348 Al Viro        2020-09-02  1320  	epi->pwqlist = pwq;
296e236e96ddde Davide Libenzi 2009-03-31  1321  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1322  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
