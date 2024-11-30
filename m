Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8A62F3B
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 05:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732945050; cv=none; b=h15hUA0dT+7zlf//XqidBBes8iU4iROOL0aD+2dY0+udqG8U3q3l+5HiBSqXGTfydGT/Ut/Ak1JpJMlqmzN/Gdg7lumQEMsp3gK5jJYz+dEKTkQPwHCVz6qTDElBWJzDVdwVNIRSov8ESitM0B8i4DXvajC93vMLX1rlH4VwleI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732945050; c=relaxed/simple;
	bh=P8CwnhuWKB2I9lo4BdF//pgbiS9iXWKmnu7aSouSqgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZdPi6uVPBAP21EY0HzWF4ffh7Yo3o2DPSZzuvQG0GGPBqP6jgocjKh3sOwZmY9pbSd2LfnypYqK3fn3+QMSK4+7kYEAJIJTxX/OUm/LXbFJYo/AmisRBiSk9bRoWkCf1fGGlf/ibgfY68JKR0QnYd1d3+xiIAgPQOQ1XRu0CY84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2yy31vv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2yy31vv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732945048; x=1764481048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P8CwnhuWKB2I9lo4BdF//pgbiS9iXWKmnu7aSouSqgw=;
  b=n2yy31vv2f/G4EfPNy1BoHoWKdx1C+MQdbLtkqOpmNa/iZ15ennysBo1
   OP96drpON7gOzS/mSrIyUtExB6iQGFQj4dKM4siSSgN2kZ56kS/KafETa
   4a1V5qsjUzbbp6vbPrBBnoE7+GQEcuAsg+N0URMZcojaDUAfaICgFHxW1
   TBwlr2X+wZYy8Ohvez1FJd3HlMWEXjjtiL9dlbmMH48GygBhFIYHQ9ied
   4Vrzta88Eo/+EHKbGNrmPD2vFJ57eOYic8Pp1Im7OAvOv+Boy9Duk+Pg0
   W4QhSwQvIt71MOATHLyWo8Hm7aYJrLt91TuV17pNVjbDcwnyECUQqqPuo
   Q==;
X-CSE-ConnectionGUID: T2fRapTZSu6IcPFCqio+7Q==
X-CSE-MsgGUID: zhzwTnX9RHO6olivcQArBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="43835592"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="43835592"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 21:37:26 -0800
X-CSE-ConnectionGUID: hgWE3TQvRFejbqk1p+YO8A==
X-CSE-MsgGUID: aAhg1gpOSb6e0v/rGkK+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92547236"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Nov 2024 21:37:25 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHGAU-000075-1f;
	Sat, 30 Nov 2024 05:37:22 +0000
Date: Sat, 30 Nov 2024 13:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/ipv4/inet_connection_sock.c:379:1-7: preceding lock on line 341
Message-ID: <202411301357.yQlm2z4o-lkp@intel.com>
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
TO: Joanne Koong <joannelkoong@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: 28044fc1d4953b07acec0da4d2fc4784c57ea6fb net: Add a bhash2 table hashed by port and address
date:   2 years, 3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 2 years, 3 months ago
config: x86_64-randconfig-104-20241120 (https://download.01.org/0day-ci/archive/20241130/202411301357.yQlm2z4o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411301357.yQlm2z4o-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/ipv4/inet_connection_sock.c:379:1-7: preceding lock on line 341
   net/ipv4/inet_connection_sock.c:565:1-7: preceding lock on line 527

vim +379 net/ipv4/inet_connection_sock.c

971af18bbfabb7 Arnaldo Carvalho de Melo 2005-12-13  278  
289141b7688b71 Josef Bacik              2017-01-17  279  /*
289141b7688b71 Josef Bacik              2017-01-17  280   * Find an open port number for the socket.  Returns with the
28044fc1d4953b Joanne Koong             2022-08-22  281   * inet_bind_hashbucket locks held if successful.
3f421baa4720b7 Arnaldo Carvalho de Melo 2005-08-09  282   */
289141b7688b71 Josef Bacik              2017-01-17  283  static struct inet_bind_hashbucket *
28044fc1d4953b Joanne Koong             2022-08-22  284  inet_csk_find_open_port(const struct sock *sk, struct inet_bind_bucket **tb_ret,
28044fc1d4953b Joanne Koong             2022-08-22  285  			struct inet_bind2_bucket **tb2_ret,
28044fc1d4953b Joanne Koong             2022-08-22  286  			struct inet_bind_hashbucket **head2_ret, int *port_ret)
3f421baa4720b7 Arnaldo Carvalho de Melo 2005-08-09  287  {
ea8add2b190395 Eric Dumazet             2016-02-11  288  	struct inet_hashinfo *hinfo = sk->sk_prot->h.hashinfo;
593d1ebe00a45a Joanne Koong             2022-06-15  289  	int port = 0;
28044fc1d4953b Joanne Koong             2022-08-22  290  	struct inet_bind_hashbucket *head, *head2;
3b1e0a655f8eba YOSHIFUJI Hideaki        2008-03-26  291  	struct net *net = sock_net(sk);
593d1ebe00a45a Joanne Koong             2022-06-15  292  	bool relax = false;
ea8add2b190395 Eric Dumazet             2016-02-11  293  	int i, low, high, attempt_half;
28044fc1d4953b Joanne Koong             2022-08-22  294  	struct inet_bind2_bucket *tb2;
ea8add2b190395 Eric Dumazet             2016-02-11  295  	struct inet_bind_bucket *tb;
ea8add2b190395 Eric Dumazet             2016-02-11  296  	u32 remaining, offset;
3c82a21f4320c8 Robert Shearman          2018-11-07  297  	int l3mdev;
3f421baa4720b7 Arnaldo Carvalho de Melo 2005-08-09  298  
3c82a21f4320c8 Robert Shearman          2018-11-07  299  	l3mdev = inet_sk_bound_l3mdev(sk);
4b01a9674231a9 Kuniyuki Iwashima        2020-03-10  300  ports_exhausted:
ea8add2b190395 Eric Dumazet             2016-02-11  301  	attempt_half = (sk->sk_reuse == SK_CAN_REUSE) ? 1 : 0;
ea8add2b190395 Eric Dumazet             2016-02-11  302  other_half_scan:
0bbf87d852d243 Eric W. Biederman        2013-09-28  303  	inet_get_local_port_range(net, &low, &high);
ea8add2b190395 Eric Dumazet             2016-02-11  304  	high++; /* [32768, 60999] -> [32768, 61000[ */
ea8add2b190395 Eric Dumazet             2016-02-11  305  	if (high - low < 4)
ea8add2b190395 Eric Dumazet             2016-02-11  306  		attempt_half = 0;
946f9eb226c296 Eric Dumazet             2015-05-20  307  	if (attempt_half) {
ea8add2b190395 Eric Dumazet             2016-02-11  308  		int half = low + (((high - low) >> 2) << 1);
946f9eb226c296 Eric Dumazet             2015-05-20  309  
946f9eb226c296 Eric Dumazet             2015-05-20  310  		if (attempt_half == 1)
946f9eb226c296 Eric Dumazet             2015-05-20  311  			high = half;
946f9eb226c296 Eric Dumazet             2015-05-20  312  		else
946f9eb226c296 Eric Dumazet             2015-05-20  313  			low = half;
946f9eb226c296 Eric Dumazet             2015-05-20  314  	}
ea8add2b190395 Eric Dumazet             2016-02-11  315  	remaining = high - low;
ea8add2b190395 Eric Dumazet             2016-02-11  316  	if (likely(remaining > 1))
ea8add2b190395 Eric Dumazet             2016-02-11  317  		remaining &= ~1U;
3f421baa4720b7 Arnaldo Carvalho de Melo 2005-08-09  318  
ea8add2b190395 Eric Dumazet             2016-02-11  319  	offset = prandom_u32() % remaining;
ea8add2b190395 Eric Dumazet             2016-02-11  320  	/* __inet_hash_connect() favors ports having @low parity
ea8add2b190395 Eric Dumazet             2016-02-11  321  	 * We do the opposite to not pollute connect() users.
ea8add2b190395 Eric Dumazet             2016-02-11  322  	 */
ea8add2b190395 Eric Dumazet             2016-02-11  323  	offset |= 1U;
ea8add2b190395 Eric Dumazet             2016-02-11  324  
ea8add2b190395 Eric Dumazet             2016-02-11  325  other_parity_scan:
ea8add2b190395 Eric Dumazet             2016-02-11  326  	port = low + offset;
ea8add2b190395 Eric Dumazet             2016-02-11  327  	for (i = 0; i < remaining; i += 2, port += 2) {
ea8add2b190395 Eric Dumazet             2016-02-11  328  		if (unlikely(port >= high))
ea8add2b190395 Eric Dumazet             2016-02-11  329  			port -= remaining;
ea8add2b190395 Eric Dumazet             2016-02-11  330  		if (inet_is_local_reserved_port(net, port))
ea8add2b190395 Eric Dumazet             2016-02-11  331  			continue;
ea8add2b190395 Eric Dumazet             2016-02-11  332  		head = &hinfo->bhash[inet_bhashfn(net, port,
ea8add2b190395 Eric Dumazet             2016-02-11  333  						  hinfo->bhash_size)];
ea8add2b190395 Eric Dumazet             2016-02-11  334  		spin_lock_bh(&head->lock);
28044fc1d4953b Joanne Koong             2022-08-22  335  		if (inet_use_bhash2_on_bind(sk)) {
28044fc1d4953b Joanne Koong             2022-08-22  336  			if (inet_bhash2_addr_any_conflict(sk, port, l3mdev, relax, false))
28044fc1d4953b Joanne Koong             2022-08-22  337  				goto next_port;
28044fc1d4953b Joanne Koong             2022-08-22  338  		}
28044fc1d4953b Joanne Koong             2022-08-22  339  
28044fc1d4953b Joanne Koong             2022-08-22  340  		head2 = inet_bhashfn_portaddr(hinfo, sk, net, port);
28044fc1d4953b Joanne Koong             2022-08-22 @341  		spin_lock(&head2->lock);
28044fc1d4953b Joanne Koong             2022-08-22  342  		tb2 = inet_bind2_bucket_find(head2, net, port, l3mdev, sk);
b67bfe0d42cac5 Sasha Levin              2013-02-27  343  		inet_bind_bucket_for_each(tb, &head->chain)
28044fc1d4953b Joanne Koong             2022-08-22  344  			if (inet_bind_bucket_match(tb, net, port, l3mdev)) {
28044fc1d4953b Joanne Koong             2022-08-22  345  				if (!inet_csk_bind_conflict(sk, tb, tb2,
28044fc1d4953b Joanne Koong             2022-08-22  346  							    relax, false))
6cd66616834c89 Josef Bacik              2017-01-17  347  					goto success;
28044fc1d4953b Joanne Koong             2022-08-22  348  				spin_unlock(&head2->lock);
ea8add2b190395 Eric Dumazet             2016-02-11  349  				goto next_port;
2b05ad33e1e624 Flavio Leitner           2012-01-25  350  			}
289141b7688b71 Josef Bacik              2017-01-17  351  		tb = NULL;
289141b7688b71 Josef Bacik              2017-01-17  352  		goto success;
ea8add2b190395 Eric Dumazet             2016-02-11  353  next_port:
ea8add2b190395 Eric Dumazet             2016-02-11  354  		spin_unlock_bh(&head->lock);
ea8add2b190395 Eric Dumazet             2016-02-11  355  		cond_resched();
a9d8f9110d7e95 Evgeniy Polyakov         2009-01-19  356  	}
3f421baa4720b7 Arnaldo Carvalho de Melo 2005-08-09  357  
ea8add2b190395 Eric Dumazet             2016-02-11  358  	offset--;
ea8add2b190395 Eric Dumazet             2016-02-11  359  	if (!(offset & 1))
ea8add2b190395 Eric Dumazet             2016-02-11  360  		goto other_parity_scan;
ea8add2b190395 Eric Dumazet             2016-02-11  361  
946f9eb226c296 Eric Dumazet             2015-05-20  362  	if (attempt_half == 1) {
946f9eb226c296 Eric Dumazet             2015-05-20  363  		/* OK we now try the upper half of the range */
946f9eb226c296 Eric Dumazet             2015-05-20  364  		attempt_half = 2;
ea8add2b190395 Eric Dumazet             2016-02-11  365  		goto other_half_scan;
3f421baa4720b7 Arnaldo Carvalho de Melo 2005-08-09  366  	}
4b01a9674231a9 Kuniyuki Iwashima        2020-03-10  367  
0db232765887d9 Kuniyuki Iwashima        2022-07-13  368  	if (READ_ONCE(net->ipv4.sysctl_ip_autobind_reuse) && !relax) {
4b01a9674231a9 Kuniyuki Iwashima        2020-03-10  369  		/* We still have a chance to connect to different destinations */
4b01a9674231a9 Kuniyuki Iwashima        2020-03-10  370  		relax = true;
4b01a9674231a9 Kuniyuki Iwashima        2020-03-10  371  		goto ports_exhausted;
4b01a9674231a9 Kuniyuki Iwashima        2020-03-10  372  	}
289141b7688b71 Josef Bacik              2017-01-17  373  	return NULL;
289141b7688b71 Josef Bacik              2017-01-17  374  success:
289141b7688b71 Josef Bacik              2017-01-17  375  	*port_ret = port;
289141b7688b71 Josef Bacik              2017-01-17  376  	*tb_ret = tb;
28044fc1d4953b Joanne Koong             2022-08-22  377  	*tb2_ret = tb2;
28044fc1d4953b Joanne Koong             2022-08-22  378  	*head2_ret = head2;
289141b7688b71 Josef Bacik              2017-01-17 @379  	return head;
289141b7688b71 Josef Bacik              2017-01-17  380  }
289141b7688b71 Josef Bacik              2017-01-17  381  

:::::: The code at line 379 was first introduced by commit
:::::: 289141b7688b71dc69b8d7a54bf67a4d7bc79f96 inet: split inet_csk_get_port into two functions

:::::: TO: Josef Bacik <jbacik@fb.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
