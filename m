Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE6C3BB38
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 23:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxIjnMd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700089262; x=1731625262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HuezP9vcmOdVrfeblg53muFuc1TgB20YCalnqTalWi4=;
  b=dxIjnMd/CReagjaO3t3ZbEeqQVjGmnvwYcMXgeg7r7olYlLGyU4lf6Up
   5VlYJGKPnMbj4279t3a0sd4wj1Lr36zF31jsj3BHV4Ebw5eUGI/am5XX9
   9mNcN8QZT6vVeIlfRAWrYt1jdG0FgO+UCOnT/eJp9Q7IiKygU15A+a7X5
   IF3ER8Jsvkpd1LgZv3ycCeJddsE+ndJagQKZib9CWIMjinOdXznN3Aj4o
   SInoo+6Zr5TxMMsWOtwlZYMkXfm9unYpEgnkha5hAraSBiI8sqAP+UB+e
   IPnVY0gR5inNCHIGiNyzDnFkSsetg+a/XHYM6EYDUErMh4BB5X/qBiUQ0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457468724"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="457468724"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 15:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908916150"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="908916150"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 15:00:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3OsR-0000w6-0L;
	Wed, 15 Nov 2023 23:00:55 +0000
Date: Thu, 16 Nov 2023 07:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/netlink/af_netlink.c:817:52: sparse: sparse: self-comparison
 always evaluates to false
Message-ID: <202311160602.lrAPNfdx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/netlink/af_netlink.c:817:52: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
CC: Kuniyuki Iwashima <kuniyu@amazon.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 0cafd77dcd032d1687efaba5598cf07bce85997f net: add a refcount tracker for kernel sockets
date:   1 year, 1 month ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 1 month ago
config: sparc-randconfig-r021-20230427 (https://download.01.org/0day-ci/archive/20231116/202311160602.lrAPNfdx-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160602.lrAPNfdx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160602.lrAPNfdx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/netlink/af_netlink.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false
>> net/netlink/af_netlink.c:817:52: sparse: sparse: self-comparison always evaluates to false
   net/netlink/af_netlink.c:2618:13: sparse: sparse: context imbalance in 'netlink_walk_start' - wrong count at exit
   net/netlink/af_netlink.c:2624:13: sparse: sparse: context imbalance in 'netlink_walk_stop' - unexpected unlock
   net/netlink/af_netlink.c:2674:9: sparse: sparse: context imbalance in 'netlink_seq_start' - wrong count at exit

vim +817 net/netlink/af_netlink.c

21e4902aea80ef Thomas Graf        2015-01-02  747  
^1da177e4c3f41 Linus Torvalds     2005-04-16  748  static int netlink_release(struct socket *sock)
^1da177e4c3f41 Linus Torvalds     2005-04-16  749  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  750  	struct sock *sk = sock->sk;
^1da177e4c3f41 Linus Torvalds     2005-04-16  751  	struct netlink_sock *nlk;
^1da177e4c3f41 Linus Torvalds     2005-04-16  752  
^1da177e4c3f41 Linus Torvalds     2005-04-16  753  	if (!sk)
^1da177e4c3f41 Linus Torvalds     2005-04-16  754  		return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  755  
^1da177e4c3f41 Linus Torvalds     2005-04-16  756  	netlink_remove(sk);
ac57b3a9ce2807 Denis Lunev        2007-04-18  757  	sock_orphan(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  758  	nlk = nlk_sk(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  759  
3f660d66dfbc13 Herbert Xu         2007-05-03  760  	/*
3f660d66dfbc13 Herbert Xu         2007-05-03  761  	 * OK. Socket is unlinked, any packets that arrive now
3f660d66dfbc13 Herbert Xu         2007-05-03  762  	 * will be purged.
3f660d66dfbc13 Herbert Xu         2007-05-03  763  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  764  
ee1c244219fd65 Johannes Berg      2015-01-16  765  	/* must not acquire netlink_table_lock in any way again before unbind
ee1c244219fd65 Johannes Berg      2015-01-16  766  	 * and notifying genetlink is done as otherwise it might deadlock
ee1c244219fd65 Johannes Berg      2015-01-16  767  	 */
ee1c244219fd65 Johannes Berg      2015-01-16  768  	if (nlk->netlink_unbind) {
ee1c244219fd65 Johannes Berg      2015-01-16  769  		int i;
ee1c244219fd65 Johannes Berg      2015-01-16  770  
ee1c244219fd65 Johannes Berg      2015-01-16  771  		for (i = 0; i < nlk->ngroups; i++)
ee1c244219fd65 Johannes Berg      2015-01-16  772  			if (test_bit(i, nlk->groups))
ee1c244219fd65 Johannes Berg      2015-01-16  773  				nlk->netlink_unbind(sock_net(sk), i + 1);
ee1c244219fd65 Johannes Berg      2015-01-16  774  	}
ee1c244219fd65 Johannes Berg      2015-01-16  775  	if (sk->sk_protocol == NETLINK_GENERIC &&
ee1c244219fd65 Johannes Berg      2015-01-16  776  	    atomic_dec_return(&genl_sk_destructing_cnt) == 0)
ee1c244219fd65 Johannes Berg      2015-01-16  777  		wake_up(&genl_sk_destructing_waitq);
ee1c244219fd65 Johannes Berg      2015-01-16  778  
^1da177e4c3f41 Linus Torvalds     2005-04-16  779  	sock->sk = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  780  	wake_up_interruptible_all(&nlk->wait);
^1da177e4c3f41 Linus Torvalds     2005-04-16  781  
^1da177e4c3f41 Linus Torvalds     2005-04-16  782  	skb_queue_purge(&sk->sk_write_queue);
^1da177e4c3f41 Linus Torvalds     2005-04-16  783  
e27260203912b4 Dmitry Ivanov      2016-04-07  784  	if (nlk->portid && nlk->bound) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  785  		struct netlink_notify n = {
3b1e0a655f8eba YOSHIFUJI Hideaki  2008-03-26  786  						.net = sock_net(sk),
^1da177e4c3f41 Linus Torvalds     2005-04-16  787  						.protocol = sk->sk_protocol,
15e473046cb6e5 Eric W. Biederman  2012-09-07  788  						.portid = nlk->portid,
^1da177e4c3f41 Linus Torvalds     2005-04-16  789  					  };
efa172f4283647 WANG Cong          2016-12-09  790  		blocking_notifier_call_chain(&netlink_chain,
e041c683412d5b Alan Stern         2006-03-27  791  				NETLINK_URELEASE, &n);
^1da177e4c3f41 Linus Torvalds     2005-04-16  792  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  793  
77247bbb309424 Patrick McHardy    2005-08-14  794  	module_put(nlk->module);
4fdb3bb723db46 Harald Welte       2005-08-09  795  
aed815601f3f95 Denis V. Lunev     2007-10-10  796  	if (netlink_is_kernel(sk)) {
b10dcb3b94010e Johannes Berg      2014-12-22  797  		netlink_table_grab();
869e58f87094b1 Denis V. Lunev     2008-01-18  798  		BUG_ON(nl_table[sk->sk_protocol].registered == 0);
869e58f87094b1 Denis V. Lunev     2008-01-18  799  		if (--nl_table[sk->sk_protocol].registered == 0) {
6d772ac5578f71 Eric Dumazet       2012-10-18  800  			struct listeners *old;
6d772ac5578f71 Eric Dumazet       2012-10-18  801  
6d772ac5578f71 Eric Dumazet       2012-10-18  802  			old = nl_deref_protected(nl_table[sk->sk_protocol].listeners);
6d772ac5578f71 Eric Dumazet       2012-10-18  803  			RCU_INIT_POINTER(nl_table[sk->sk_protocol].listeners, NULL);
6d772ac5578f71 Eric Dumazet       2012-10-18  804  			kfree_rcu(old, rcu);
77247bbb309424 Patrick McHardy    2005-08-14  805  			nl_table[sk->sk_protocol].module = NULL;
9785e10aedfa0f Pablo Neira Ayuso  2012-09-08  806  			nl_table[sk->sk_protocol].bind = NULL;
4f520900522fd5 Richard Guy Briggs 2014-04-22  807  			nl_table[sk->sk_protocol].unbind = NULL;
9785e10aedfa0f Pablo Neira Ayuso  2012-09-08  808  			nl_table[sk->sk_protocol].flags = 0;
ab33a1711cf60b Patrick McHardy    2005-08-14  809  			nl_table[sk->sk_protocol].registered = 0;
869e58f87094b1 Denis V. Lunev     2008-01-18  810  		}
4fdb3bb723db46 Harald Welte       2005-08-09  811  		netlink_table_ungrab();
b10dcb3b94010e Johannes Berg      2014-12-22  812  	}
4fdb3bb723db46 Harald Welte       2005-08-09  813  
c1fd3b9455a977 Eric Dumazet       2008-11-23  814  	sock_prot_inuse_add(sock_net(sk), &netlink_proto, -1);
0cafd77dcd032d Eric Dumazet       2022-10-20  815  
0cafd77dcd032d Eric Dumazet       2022-10-20  816  	/* Because struct net might disappear soon, do not keep a pointer. */
0cafd77dcd032d Eric Dumazet       2022-10-20 @817  	if (!sk->sk_net_refcnt && sock_net(sk) != &init_net) {
0cafd77dcd032d Eric Dumazet       2022-10-20  818  		__netns_tracker_free(sock_net(sk), &sk->ns_tracker, false);
0cafd77dcd032d Eric Dumazet       2022-10-20  819  		/* Because of deferred_put_nlk_sk and use of work queue,
0cafd77dcd032d Eric Dumazet       2022-10-20  820  		 * it is possible  netns will be freed before this socket.
0cafd77dcd032d Eric Dumazet       2022-10-20  821  		 */
0cafd77dcd032d Eric Dumazet       2022-10-20  822  		sock_net_set(sk, &init_net);
0cafd77dcd032d Eric Dumazet       2022-10-20  823  		__netns_tracker_alloc(&init_net, &sk->ns_tracker,
0cafd77dcd032d Eric Dumazet       2022-10-20  824  				      false, GFP_KERNEL);
0cafd77dcd032d Eric Dumazet       2022-10-20  825  	}
21e4902aea80ef Thomas Graf        2015-01-02  826  	call_rcu(&nlk->rcu, deferred_put_nlk_sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  827  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  828  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  829  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
