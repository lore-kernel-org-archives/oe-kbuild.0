Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA8A19D060
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 00:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743122660; cv=none; b=h03KkHGpzS3ADJ7fl1UsPs6eryuLQdKbR5cMi7Apl447MF3O4ZGJbzlpxhqXS+rMZDBnWBS1wUjT0OOWCAeqovvai84Ql1N6FMzpqAhzETbMHSIimsxjTl7wOr9/ma30PhX678MjozujTcsmtCyYNEl+BUh2CpkAWIT3dmzZM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743122660; c=relaxed/simple;
	bh=yPU7ASXeKI7ve9kKf8LQo8IcCWSA1/X1cSpe5YzDcHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJ6n1OyvUnB9MDWLKfxKmyml8KHubN22yK6gj0BeBU8rAHUJQAHg9qlZZvMKMl/1DSi/yn2j9+wIZZU7JuokE2bqMZnqEBZWn7MhtI3OOFpZ7LLAB/iTplmhzvY2R0sa/C5gQ4sVwgM5n/ZmtqwEndLSQ2+dK8ulSBNfEs9deOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2uPpTd1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2uPpTd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743122657; x=1774658657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yPU7ASXeKI7ve9kKf8LQo8IcCWSA1/X1cSpe5YzDcHc=;
  b=C2uPpTd1WegLGreZDeHn28Nr2tsK3OiG/QTnh/BTw1UO3/TXRyFhP3FD
   oNvERUUJ3Fz3EYWxgJgpbVyr1L6DMZFSn0sabiV2puZrGqUWfqPRVZv9n
   bhUFZ9oOH2K/6DCgt+j2dG8oHdB04od6MY9FN7/3Y6L3ZIGdGBP/VgflT
   J7JQHz+jveNhLKirw1nYY9EDUvX430wHmPYbSiy87sCaDISgLK3IEVRZL
   ayTvCFC88r7EWOkokIx2B1wbtXB1PrSQOjEOuzz5druAjYFKUEmF1yDpF
   kHJypXYtulIqFUmDEdT/BCS7kyGdX+lNsdJlMBioGPm/VQuFY2jBDk8LM
   Q==;
X-CSE-ConnectionGUID: iNdYZF58QfSaskkYuNoKLQ==
X-CSE-MsgGUID: rZf7XLufQFaJWjYhRgxQlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44395764"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="44395764"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 17:44:16 -0700
X-CSE-ConnectionGUID: PJfq4r8MSVOiAm5X3XjbRw==
X-CSE-MsgGUID: MhBdTyILRryKPdHYTx9HVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130401119"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2025 17:44:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txxpR-00072g-1b;
	Fri, 28 Mar 2025 00:44:09 +0000
Date: Fri, 28 Mar 2025 08:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/netlink/af_netlink.c:1066 netlink_bind() warn: inconsistent
 returns 'global &nl_table_lock'.
Message-ID: <202503280812.F0pZvQUj-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5c2a430e85994f4873ea5ec42091baa1153bc731
commit: b5f463486b212c56d837c2592d87de7fb4833662 s390: Support PREEMPT_DYNAMIC
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r073-20250327 (https://download.01.org/0day-ci/archive/20250328/202503280812.F0pZvQUj-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503280812.F0pZvQUj-lkp@intel.com/

New smatch warnings:
net/netlink/af_netlink.c:1066 netlink_bind() warn: inconsistent returns 'global &nl_table_lock'.
net/lapb/lapb_iface.c:281 lapb_setparms() warn: inconsistent returns 'bh'.
net/lapb/lapb_iface.c:313 lapb_connect_request() warn: inconsistent returns 'bh'.
net/lapb/lapb_iface.c:363 lapb_disconnect_request() warn: inconsistent returns 'bh'.
net/lapb/lapb_iface.c:388 lapb_data_request() warn: inconsistent returns 'bh'.
net/lapb/lapb_iface.c:529 lapb_device_event() warn: inconsistent returns 'bh'.
net/ipv6/ip6_fib.c:2673 ipv6_route_seq_next() warn: inconsistent returns 'bh'.
net/core/neighbour.c:1257 __neigh_event_send() warn: inconsistent returns '&neigh->lock'.
net/core/neighbour.c:1257 __neigh_event_send() warn: inconsistent returns 'bh'.
fs/dlm/lock.c:1382 _dlm_master_lookup() warn: inconsistent returns '&ls->ls_rsbtbl_lock'.
fs/dlm/lock.c:1382 _dlm_master_lookup() warn: inconsistent returns 'bh'.

Old smatch warnings:
net/netlink/af_netlink.c:1057 netlink_bind() error: we previously assumed 'nlk->groups' could be null (see line 1050)
net/core/neighbour.c:3685 neigh_proc_base_reachable_time() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
net/core/neighbour.c:3687 neigh_proc_base_reachable_time() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
net/core/neighbour.c:3825 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[4]->proc_handler
net/core/neighbour.c:3827 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[5]->proc_handler
net/core/neighbour.c:3829 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[15]->proc_handler
net/core/neighbour.c:3831 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[16]->proc_handler
net/core/neighbour.c:3840 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[5]->proc_handler
net/core/neighbour.c:3843 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[16]->proc_handler
fs/dlm/lock.c:5646 dlm_recover_master_copy() error: we previously assumed 'lkb' could be null (see line 5635)

vim +1066 net/netlink/af_netlink.c

4f520900522fd5 Richard Guy Briggs   2014-04-22   980  
6ac552fdc6e96b Patrick McHardy      2007-12-04   981  static int netlink_bind(struct socket *sock, struct sockaddr *addr,
6ac552fdc6e96b Patrick McHardy      2007-12-04   982  			int addr_len)
^1da177e4c3f41 Linus Torvalds       2005-04-16   983  {
^1da177e4c3f41 Linus Torvalds       2005-04-16   984  	struct sock *sk = sock->sk;
3b1e0a655f8eba YOSHIFUJI Hideaki    2008-03-26   985  	struct net *net = sock_net(sk);
^1da177e4c3f41 Linus Torvalds       2005-04-16   986  	struct netlink_sock *nlk = nlk_sk(sk);
^1da177e4c3f41 Linus Torvalds       2005-04-16   987  	struct sockaddr_nl *nladdr = (struct sockaddr_nl *)addr;
f773608026ee1e Xin Long             2017-09-06   988  	int err = 0;
d852be84770c06 Tetsuo Handa         2019-04-12   989  	unsigned long groups;
da314c9923fed5 Herbert Xu           2015-09-22   990  	bool bound;
^1da177e4c3f41 Linus Torvalds       2005-04-16   991  
4e4b53768f1ddc Hannes Frederic Sowa 2012-12-15   992  	if (addr_len < sizeof(struct sockaddr_nl))
4e4b53768f1ddc Hannes Frederic Sowa 2012-12-15   993  		return -EINVAL;
4e4b53768f1ddc Hannes Frederic Sowa 2012-12-15   994  
^1da177e4c3f41 Linus Torvalds       2005-04-16   995  	if (nladdr->nl_family != AF_NETLINK)
^1da177e4c3f41 Linus Torvalds       2005-04-16   996  		return -EINVAL;
d852be84770c06 Tetsuo Handa         2019-04-12   997  	groups = nladdr->nl_groups;
^1da177e4c3f41 Linus Torvalds       2005-04-16   998  
^1da177e4c3f41 Linus Torvalds       2005-04-16   999  	/* Only superuser is allowed to listen multicasts */
4f520900522fd5 Richard Guy Briggs   2014-04-22  1000  	if (groups) {
5187cd055b6e81 Eric W. Biederman    2014-04-23  1001  		if (!netlink_allowed(sock, NL_CFG_F_NONROOT_RECV))
^1da177e4c3f41 Linus Torvalds       2005-04-16  1002  			return -EPERM;
b4ff4f0419ae5d Johannes Berg        2007-07-18  1003  		err = netlink_realloc_groups(sk);
513c2500000525 Patrick McHardy      2005-09-06  1004  		if (err)
513c2500000525 Patrick McHardy      2005-09-06  1005  			return err;
513c2500000525 Patrick McHardy      2005-09-06  1006  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  1007  
428f944bd58607 Dmitry Safonov       2018-09-03  1008  	if (nlk->ngroups < BITS_PER_LONG)
91874ecf32e41b Dmitry Safonov       2018-08-05  1009  		groups &= (1UL << nlk->ngroups) - 1;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1010  
7707a4d01a648e Eric Dumazet         2021-10-04  1011  	/* Paired with WRITE_ONCE() in netlink_insert() */
7707a4d01a648e Eric Dumazet         2021-10-04  1012  	bound = READ_ONCE(nlk->bound);
da314c9923fed5 Herbert Xu           2015-09-22  1013  	if (bound) {
da314c9923fed5 Herbert Xu           2015-09-22  1014  		/* Ensure nlk->portid is up-to-date. */
da314c9923fed5 Herbert Xu           2015-09-22  1015  		smp_rmb();
da314c9923fed5 Herbert Xu           2015-09-22  1016  
15e473046cb6e5 Eric W. Biederman    2012-09-07  1017  		if (nladdr->nl_pid != nlk->portid)
^1da177e4c3f41 Linus Torvalds       2005-04-16  1018  			return -EINVAL;
da314c9923fed5 Herbert Xu           2015-09-22  1019  	}
4f520900522fd5 Richard Guy Briggs   2014-04-22  1020  
4f520900522fd5 Richard Guy Briggs   2014-04-22  1021  	if (nlk->netlink_bind && groups) {
4f520900522fd5 Richard Guy Briggs   2014-04-22  1022  		int group;
4f520900522fd5 Richard Guy Briggs   2014-04-22  1023  
3a20773beeeead Nikolay Aleksandrov  2020-02-20  1024  		/* nl_groups is a u32, so cap the maximum groups we can bind */
3a20773beeeead Nikolay Aleksandrov  2020-02-20  1025  		for (group = 0; group < BITS_PER_TYPE(u32); group++) {
4f520900522fd5 Richard Guy Briggs   2014-04-22  1026  			if (!test_bit(group, &groups))
4f520900522fd5 Richard Guy Briggs   2014-04-22  1027  				continue;
8b7c36d810c61a Pablo Neira          2015-01-29  1028  			err = nlk->netlink_bind(net, group + 1);
4f520900522fd5 Richard Guy Briggs   2014-04-22  1029  			if (!err)
4f520900522fd5 Richard Guy Briggs   2014-04-22  1030  				continue;
023e2cfa36c31b Johannes Berg        2014-12-23  1031  			netlink_undo_bind(group, groups, sk);
f2764bd4f6a8df Florian Westphal     2021-04-16  1032  			return err;
4f520900522fd5 Richard Guy Briggs   2014-04-22  1033  		}
4f520900522fd5 Richard Guy Briggs   2014-04-22  1034  	}
4f520900522fd5 Richard Guy Briggs   2014-04-22  1035  
da314c9923fed5 Herbert Xu           2015-09-22  1036  	/* No need for barriers here as we return to user-space without
da314c9923fed5 Herbert Xu           2015-09-22  1037  	 * using any of the bound attributes.
da314c9923fed5 Herbert Xu           2015-09-22  1038  	 */
f2764bd4f6a8df Florian Westphal     2021-04-16  1039  	netlink_lock_table();
da314c9923fed5 Herbert Xu           2015-09-22  1040  	if (!bound) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  1041  		err = nladdr->nl_pid ?
8ea65f4a2dfaaf Herbert Xu           2015-01-26  1042  			netlink_insert(sk, nladdr->nl_pid) :
^1da177e4c3f41 Linus Torvalds       2005-04-16  1043  			netlink_autobind(sock);
4f520900522fd5 Richard Guy Briggs   2014-04-22  1044  		if (err) {
3a20773beeeead Nikolay Aleksandrov  2020-02-20  1045  			netlink_undo_bind(BITS_PER_TYPE(u32), groups, sk);
f773608026ee1e Xin Long             2017-09-06  1046  			goto unlock;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1047  		}
4f520900522fd5 Richard Guy Briggs   2014-04-22  1048  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  1049  
4f520900522fd5 Richard Guy Briggs   2014-04-22  1050  	if (!groups && (nlk->groups == NULL || !(u32)nlk->groups[0]))
f773608026ee1e Xin Long             2017-09-06  1051  		goto unlock;
f773608026ee1e Xin Long             2017-09-06  1052  	netlink_unlock_table();
^1da177e4c3f41 Linus Torvalds       2005-04-16  1053  
^1da177e4c3f41 Linus Torvalds       2005-04-16  1054  	netlink_table_grab();
f7fa9b10edbb93 Patrick McHardy      2005-08-15  1055  	netlink_update_subscriptions(sk, nlk->subscriptions +
4f520900522fd5 Richard Guy Briggs   2014-04-22  1056  					 hweight32(groups) -
f7fa9b10edbb93 Patrick McHardy      2005-08-15  1057  					 hweight32(nlk->groups[0]));
4f520900522fd5 Richard Guy Briggs   2014-04-22  1058  	nlk->groups[0] = (nlk->groups[0] & ~0xffffffffUL) | groups;
4277a083ecd2c8 Patrick McHardy      2006-03-20  1059  	netlink_update_listeners(sk);
^1da177e4c3f41 Linus Torvalds       2005-04-16  1060  	netlink_table_ungrab();
^1da177e4c3f41 Linus Torvalds       2005-04-16  1061  
^1da177e4c3f41 Linus Torvalds       2005-04-16  1062  	return 0;
f773608026ee1e Xin Long             2017-09-06  1063  
f773608026ee1e Xin Long             2017-09-06  1064  unlock:
f773608026ee1e Xin Long             2017-09-06  1065  	netlink_unlock_table();
f773608026ee1e Xin Long             2017-09-06 @1066  	return err;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1067  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  1068  

:::::: The code at line 1066 was first introduced by commit
:::::: f773608026ee1e75e2256e3ad625c222ff6f9305 netlink: access nlk groups safely in netlink bind and getname

:::::: TO: Xin Long <lucien.xin@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
