Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EF4B640
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 20:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694205992; x=1725741992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JF8IihPPE1isKgxpCe5jTEaMgMbKEJLhmagjTaHPqrQ=;
  b=ZNv5q4D/u1chm4A4LKs/jGzaOMH/JLAuBUuh/LCRytU+oXPZlYzmd1uZ
   KqJnRlPNYkW8d+m4eLa6d7MrvTMpBNHHz7wKgSK7wyOCE927349JeMHH8
   hkOMYHcQY1Qr/ra60zIC2xIoRbBX6jP0XCSJ06BzMuZiJipsHWllkbCVH
   hUcbrbopUxCIREKoMid06rlo5b5iBzzO9wevOvqWMxqbVR+R4t7B+l345
   QTWjF2P5Xi1hrLdHpFeEU1q3brcIUL1uDRuNFFBbA4gpjCdfCLsgPE29W
   K3OAtOf+luJENxKZV9pOxlbnBmoUgqu2V8LtXBpGaZqRSaC4KJ8HAAIkQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464112651"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="464112651"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 13:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989398347"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="989398347"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2023 13:46:29 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeiN1-0002bM-1L;
	Fri, 08 Sep 2023 20:46:27 +0000
Date: Sat, 9 Sep 2023 04:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [oracle-dtrace:v2/6.5 10/13] fs/eventpoll.c:1300
 ep_ptable_queue_proc() warn: maybe use && instead of &
Message-ID: <202309090448.6VlaNPfY-lkp@intel.com>
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

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: 051cfd2102807119e31bdd4947d18388b3df5fd3 [10/13] waitfd: new syscall implementing waitpid() over fds
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230909/202309090448.6VlaNPfY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309090448.6VlaNPfY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309090448.6VlaNPfY-lkp@intel.com/

smatch warnings:
fs/eventpoll.c:1300 ep_ptable_queue_proc() warn: maybe use && instead of &

vim +1300 fs/eventpoll.c

^1da177e4c3f4152 Linus Torvalds 2005-04-16  1285  
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1286  /*
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1287   * This is the callback that is used to add our wait queue to the
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1288   * target file wakeup lists.
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1289   */
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1290  static void ep_ptable_queue_proc(struct file *file, wait_queue_head_t *whead,
051cfd2102807119 Nick Alcock    2018-11-14  1291  				 poll_table *pt, unsigned long fixed_event)
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1292  {
364f374f22ba1b04 Al Viro        2020-09-02  1293  	struct ep_pqueue *epq = container_of(pt, struct ep_pqueue, pt);
364f374f22ba1b04 Al Viro        2020-09-02  1294  	struct epitem *epi = epq->epi;
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1295  	struct eppoll_entry *pwq;
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1296  
364f374f22ba1b04 Al Viro        2020-09-02  1297  	if (unlikely(!epi))	// an earlier allocation has failed
364f374f22ba1b04 Al Viro        2020-09-02  1298  		return;
364f374f22ba1b04 Al Viro        2020-09-02  1299  
051cfd2102807119 Nick Alcock    2018-11-14 @1300  	if (fixed_event & !(epi->event.events & fixed_event))
051cfd2102807119 Nick Alcock    2018-11-14  1301  		return;
051cfd2102807119 Nick Alcock    2018-11-14  1302  
051cfd2102807119 Nick Alcock    2018-11-14  1303  	if (fixed_event)
051cfd2102807119 Nick Alcock    2018-11-14  1304  		epi->fixed_event = fixed_event;
051cfd2102807119 Nick Alcock    2018-11-14  1305  
364f374f22ba1b04 Al Viro        2020-09-02  1306  	pwq = kmem_cache_alloc(pwq_cache, GFP_KERNEL);
364f374f22ba1b04 Al Viro        2020-09-02  1307  	if (unlikely(!pwq)) {
364f374f22ba1b04 Al Viro        2020-09-02  1308  		epq->epi = NULL;
364f374f22ba1b04 Al Viro        2020-09-02  1309  		return;
364f374f22ba1b04 Al Viro        2020-09-02  1310  	}
364f374f22ba1b04 Al Viro        2020-09-02  1311  
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1312  	init_waitqueue_func_entry(&pwq->wait, ep_poll_callback);
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1313  	pwq->whead = whead;
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1314  	pwq->base = epi;
df0108c5da561c66 Jason Baron    2016-01-20  1315  	if (epi->event.events & EPOLLEXCLUSIVE)
df0108c5da561c66 Jason Baron    2016-01-20  1316  		add_wait_queue_exclusive(whead, &pwq->wait);
df0108c5da561c66 Jason Baron    2016-01-20  1317  	else
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1318  		add_wait_queue(whead, &pwq->wait);
80285b75c683484d Al Viro        2020-09-02  1319  	pwq->next = epi->pwqlist;
80285b75c683484d Al Viro        2020-09-02  1320  	epi->pwqlist = pwq;
296e236e96dddef3 Davide Libenzi 2009-03-31  1321  }
^1da177e4c3f4152 Linus Torvalds 2005-04-16  1322  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
