Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB944D599
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jan 2024 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuX8nE2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704913687; x=1736449687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6Vg0+JwikuqQcxsPQ0MVAUu1H5XmMo7KLTVbp7/AmA=;
  b=SuX8nE2BoSkhrsJdej6nRt+YofRDq/1Eb8NY2zTqTkfuJRs6uksFgSdy
   1Lw2fq/oF7TLaSRXscEZNCJmUQjqqm33ejJFi1AF+qoTIwMKFQj5OFxoe
   aVFvx/JvTQgJN+Q15rUafT02Z9DDqS1nMddop6uSg+dPR+NrFvH2Yi2z+
   eX0WN9ayxxMzifmmI5jbb0aAnYAbWl0xlKltP23lZhinx6HT7wL24Ji88
   2y1hlGAjOe8zx94shtVY8LgN03bmDbJXI6L2VAE+oo9fZ9lVueIuG5sVK
   aBYuW+vRLnemLBt74jl0OMjedZ8uDDy+1RKZEcV/78VcnjCB/tj2sGOLk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="429803496"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="429803496"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 11:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="731929808"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="731929808"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 11:08:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNdvG-0007PC-1v;
	Wed, 10 Jan 2024 19:07:38 +0000
Date: Thu, 11 Jan 2024 03:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/unix/af_unix.c:1531 unix_stream_connect() warn: variable
 dereferenced before check 'other' (see line 1414)
Message-ID: <202401110325.q9zK8ak7-lkp@intel.com>
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
TO: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   affc5af36bbb62073b6aaa4f4459b38937ff5331
commit: aed26f557bbc94f0c778f63d7dfe86af99208f68 af_unix: Return an error as a pointer in unix_find_other().
date:   2 years, 1 month ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 years, 1 month ago
config: i386-randconfig-141-20240107 (https://download.01.org/0day-ci/archive/20240111/202401110325.q9zK8ak7-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401110325.q9zK8ak7-lkp@intel.com/

smatch warnings:
net/unix/af_unix.c:1531 unix_stream_connect() warn: variable dereferenced before check 'other' (see line 1414)

vim +/other +1531 net/unix/af_unix.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1345  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1346  static int unix_stream_connect(struct socket *sock, struct sockaddr *uaddr,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1347  			       int addr_len, int flags)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1348  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1349  	struct sockaddr_un *sunaddr = (struct sockaddr_un *)uaddr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1350  	struct sock *sk = sock->sk;
3b1e0a655f8eba YOSHIFUJI Hideaki 2008-03-26  1351  	struct net *net = sock_net(sk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1352  	struct unix_sock *u = unix_sk(sk), *newu, *otheru;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1353  	struct sock *newsk = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1354  	struct sock *other = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1355  	struct sk_buff *skb = NULL;
95c961747284a6 Eric Dumazet      2012-04-15  1356  	unsigned int hash;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1357  	int st;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1358  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1359  	long timeo;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1360  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1361  	err = unix_mkname(sunaddr, addr_len, &hash);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1362  	if (err < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1363  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1364  	addr_len = err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1365  
f7ed31f4615f4e Kuniyuki Iwashima 2021-11-24  1366  	if (test_bit(SOCK_PASSCRED, &sock->flags) && !u->addr) {
f7ed31f4615f4e Kuniyuki Iwashima 2021-11-24  1367  		err = unix_autobind(sk);
f7ed31f4615f4e Kuniyuki Iwashima 2021-11-24  1368  		if (err)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1369  			goto out;
f7ed31f4615f4e Kuniyuki Iwashima 2021-11-24  1370  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1371  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1372  	timeo = sock_sndtimeo(sk, flags & O_NONBLOCK);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1373  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1374  	/* First of all allocate resources.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1375  	   If we will make it after state is locked,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1376  	   we will have to recheck all again in any case.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1377  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1378  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1379  	/* create new sock for complete connection */
94531cfcbe79c3 Jiang Wang        2021-08-16  1380  	newsk = unix_create1(sock_net(sk), NULL, 0, sock->type);
f4bd73b5a95086 Kuniyuki Iwashima 2021-09-28  1381  	if (IS_ERR(newsk)) {
f4bd73b5a95086 Kuniyuki Iwashima 2021-09-28  1382  		err = PTR_ERR(newsk);
f4bd73b5a95086 Kuniyuki Iwashima 2021-09-28  1383  		newsk = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1384  		goto out;
f4bd73b5a95086 Kuniyuki Iwashima 2021-09-28  1385  	}
f4bd73b5a95086 Kuniyuki Iwashima 2021-09-28  1386  
f4bd73b5a95086 Kuniyuki Iwashima 2021-09-28  1387  	err = -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1388  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1389  	/* Allocate skb for sending to listening sock */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1390  	skb = sock_wmalloc(newsk, 1, 0, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1391  	if (skb == NULL)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1392  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1393  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1394  restart:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1395  	/*  Find listening sock. */
aed26f557bbc94 Kuniyuki Iwashima 2021-11-24  1396  	other = unix_find_other(net, sunaddr, addr_len, sk->sk_type, hash);
aed26f557bbc94 Kuniyuki Iwashima 2021-11-24  1397  	if (IS_ERR(other)) {
aed26f557bbc94 Kuniyuki Iwashima 2021-11-24  1398  		err = PTR_ERR(other);
aed26f557bbc94 Kuniyuki Iwashima 2021-11-24  1399  		other = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1400  		goto out;
aed26f557bbc94 Kuniyuki Iwashima 2021-11-24  1401  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1402  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1403  	/* Latch state of peer */
1c92b4e50ef926 David S. Miller   2007-05-31  1404  	unix_state_lock(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1405  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1406  	/* Apparently VFS overslept socket death. Retry. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1407  	if (sock_flag(other, SOCK_DEAD)) {
1c92b4e50ef926 David S. Miller   2007-05-31  1408  		unix_state_unlock(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1409  		sock_put(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1410  		goto restart;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1411  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1412  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1413  	err = -ECONNREFUSED;
^1da177e4c3f41 Linus Torvalds    2005-04-16 @1414  	if (other->sk_state != TCP_LISTEN)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1415  		goto out_unlock;
77238f2b942b38 Tomoki Sekiyama   2009-10-18  1416  	if (other->sk_shutdown & RCV_SHUTDOWN)
77238f2b942b38 Tomoki Sekiyama   2009-10-18  1417  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1418  
3c73419c09a5ef Rainer Weikusat   2008-06-17  1419  	if (unix_recvq_full(other)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1420  		err = -EAGAIN;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1421  		if (!timeo)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1422  			goto out_unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1423  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1424  		timeo = unix_wait_for_peer(other, timeo);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1425  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1426  		err = sock_intr_errno(timeo);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1427  		if (signal_pending(current))
^1da177e4c3f41 Linus Torvalds    2005-04-16  1428  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1429  		sock_put(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1430  		goto restart;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1431  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1432  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1433  	/* Latch our state.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1434  
e5537bfc98f015 Daniel Baluta     2011-03-14  1435  	   It is tricky place. We need to grab our state lock and cannot
^1da177e4c3f41 Linus Torvalds    2005-04-16  1436  	   drop lock on peer. It is dangerous because deadlock is
^1da177e4c3f41 Linus Torvalds    2005-04-16  1437  	   possible. Connect to self case and simultaneous
^1da177e4c3f41 Linus Torvalds    2005-04-16  1438  	   attempt to connect are eliminated by checking socket
^1da177e4c3f41 Linus Torvalds    2005-04-16  1439  	   state. other is TCP_LISTEN, if sk is TCP_LISTEN we
^1da177e4c3f41 Linus Torvalds    2005-04-16  1440  	   check this before attempt to grab lock.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1441  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1442  	   Well, and we have to recheck the state after socket locked.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1443  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1444  	st = sk->sk_state;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1445  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1446  	switch (st) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1447  	case TCP_CLOSE:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1448  		/* This is ok... continue with connect */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1449  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1450  	case TCP_ESTABLISHED:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1451  		/* Socket is already connected */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1452  		err = -EISCONN;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1453  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1454  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1455  		err = -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1456  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1457  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1458  
1c92b4e50ef926 David S. Miller   2007-05-31  1459  	unix_state_lock_nested(sk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1460  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1461  	if (sk->sk_state != st) {
1c92b4e50ef926 David S. Miller   2007-05-31  1462  		unix_state_unlock(sk);
1c92b4e50ef926 David S. Miller   2007-05-31  1463  		unix_state_unlock(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1464  		sock_put(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1465  		goto restart;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1466  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1467  
3610cda53f247e David S. Miller   2011-01-05  1468  	err = security_unix_stream_connect(sk, other, newsk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1469  	if (err) {
1c92b4e50ef926 David S. Miller   2007-05-31  1470  		unix_state_unlock(sk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1471  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1472  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1473  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1474  	/* The way is open! Fastly set all the necessary fields... */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1475  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1476  	sock_hold(sk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1477  	unix_peer(newsk)	= sk;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1478  	newsk->sk_state		= TCP_ESTABLISHED;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1479  	newsk->sk_type		= sk->sk_type;
109f6e39fa07c4 Eric W. Biederman 2010-06-13  1480  	init_peercred(newsk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1481  	newu = unix_sk(newsk);
eaefd1105bc431 Eric Dumazet      2011-02-18  1482  	RCU_INIT_POINTER(newsk->sk_wq, &newu->peer_wq);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1483  	otheru = unix_sk(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1484  
ae3b564179bfd0 Al Viro           2019-02-15  1485  	/* copy address information from listening to new sock
ae3b564179bfd0 Al Viro           2019-02-15  1486  	 *
ae3b564179bfd0 Al Viro           2019-02-15  1487  	 * The contents of *(otheru->addr) and otheru->path
ae3b564179bfd0 Al Viro           2019-02-15  1488  	 * are seen fully set up here, since we have found
ae3b564179bfd0 Al Viro           2019-02-15  1489  	 * otheru in hash under unix_table_lock.  Insertion
ae3b564179bfd0 Al Viro           2019-02-15  1490  	 * into the hash chain we'd found it in had been done
ae3b564179bfd0 Al Viro           2019-02-15  1491  	 * in an earlier critical area protected by unix_table_lock,
ae3b564179bfd0 Al Viro           2019-02-15  1492  	 * the same one where we'd set *(otheru->addr) contents,
ae3b564179bfd0 Al Viro           2019-02-15  1493  	 * as well as otheru->path and otheru->addr itself.
ae3b564179bfd0 Al Viro           2019-02-15  1494  	 *
ae3b564179bfd0 Al Viro           2019-02-15  1495  	 * Using smp_store_release() here to set newu->addr
ae3b564179bfd0 Al Viro           2019-02-15  1496  	 * is enough to make those stores, as well as stores
ae3b564179bfd0 Al Viro           2019-02-15  1497  	 * to newu->path visible to anyone who gets newu->addr
ae3b564179bfd0 Al Viro           2019-02-15  1498  	 * by smp_load_acquire().  IOW, the same warranties
ae3b564179bfd0 Al Viro           2019-02-15  1499  	 * as for unix_sock instances bound in unix_bind() or
ae3b564179bfd0 Al Viro           2019-02-15  1500  	 * in unix_autobind().
ae3b564179bfd0 Al Viro           2019-02-15  1501  	 */
40ffe67d2e89c7 Al Viro           2012-03-14  1502  	if (otheru->path.dentry) {
40ffe67d2e89c7 Al Viro           2012-03-14  1503  		path_get(&otheru->path);
40ffe67d2e89c7 Al Viro           2012-03-14  1504  		newu->path = otheru->path;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1505  	}
ae3b564179bfd0 Al Viro           2019-02-15  1506  	refcount_inc(&otheru->addr->refcnt);
ae3b564179bfd0 Al Viro           2019-02-15  1507  	smp_store_release(&newu->addr, otheru->addr);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1508  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1509  	/* Set credentials */
109f6e39fa07c4 Eric W. Biederman 2010-06-13  1510  	copy_peercred(sk, other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1511  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1512  	sock->state	= SS_CONNECTED;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1513  	sk->sk_state	= TCP_ESTABLISHED;
830a1e5c212fb3 Benjamin LaHaise  2005-12-13  1514  	sock_hold(newsk);
830a1e5c212fb3 Benjamin LaHaise  2005-12-13  1515  
4e857c58efeb99 Peter Zijlstra    2014-03-17  1516  	smp_mb__after_atomic();	/* sock_hold() does an atomic_inc() */
830a1e5c212fb3 Benjamin LaHaise  2005-12-13  1517  	unix_peer(sk)	= newsk;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1518  
1c92b4e50ef926 David S. Miller   2007-05-31  1519  	unix_state_unlock(sk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1520  
4e03d073afc4f6 gushengxian       2021-06-09  1521  	/* take ten and send info to listening sock */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1522  	spin_lock(&other->sk_receive_queue.lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1523  	__skb_queue_tail(&other->sk_receive_queue, skb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1524  	spin_unlock(&other->sk_receive_queue.lock);
1c92b4e50ef926 David S. Miller   2007-05-31  1525  	unix_state_unlock(other);
676d23690fb62b David S. Miller   2014-04-11  1526  	other->sk_data_ready(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1527  	sock_put(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1528  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1529  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1530  out_unlock:
^1da177e4c3f41 Linus Torvalds    2005-04-16 @1531  	if (other)
1c92b4e50ef926 David S. Miller   2007-05-31  1532  		unix_state_unlock(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1533  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1534  out:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1535  	kfree_skb(skb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1536  	if (newsk)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1537  		unix_release_sock(newsk, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1538  	if (other)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1539  		sock_put(other);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1540  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1541  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1542  

:::::: The code at line 1531 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
