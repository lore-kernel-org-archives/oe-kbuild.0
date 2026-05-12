Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6117385516
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582978; cv=none; b=DaDvNcbaVFw03chdDI1ky00te3UNcdhAjmSEXMTivOMbL9JOT31Y9reZqsx/2NDdCtNArrU47HJAg/v6ZOj3K34fcqmHZycmGLg3jTEC4RfrNfTDrxYhBzi+mg31vpXwU2j48ck/bQ6BqpbiPHjII8K42XgwsVBc50VJD+5+WHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582978; c=relaxed/simple;
	bh=Fyvg9rlcsBQeQfbWcxxWQ/U+zHjunBm8HmotJ9+QrdA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TourYGpbUYx1huGf5UJOblnnzDwYYrTDl+PtGZ1WedWuZ3UrJxItNYSrrIl8qz2J4fbZYIFU34aahCqvrfSpomKGqclecf/qeYCAB3rsnALjw9n/mLONZp3BxOj7mtpofsBcdPu18UVvgp3kF5718l3lPbhZIPEXOEQLiKBRtT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkN1Ymhk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkN1Ymhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778582977; x=1810118977;
  h=date:from:to:cc:subject:message-id;
  bh=Fyvg9rlcsBQeQfbWcxxWQ/U+zHjunBm8HmotJ9+QrdA=;
  b=PkN1Ymhk33LozsO1Mx+YWf+bBHRY/PukXcRRNa1ySnAkYHfC76B6nYLw
   0IJ4UKVifFbr+12itVn/LKhUIZ0SXIS483XtPJ6FuZqHNcQSKCzOl7oKx
   Y+fWVtFw04Y/n4jZa1ck5unnVIFOq0Fk0Ix7hhL/Vne7/5OvU7HiuBOcD
   oi26H0ojP06PCYD2l/zYpxkQLgDKJJZxCh8fBoEx7D4eJFGT6xJ0Oa5a4
   q+ljLl0bfP/FYRGEOqOov215CVv56uGOb2wE2tA9vKsLeqLDLG42nk/6U
   j943+plTCKuhWTgYfg1M3730U6YUpDS0ZExaAi2cjjDa4zPS89q1Ek7bC
   Q==;
X-CSE-ConnectionGUID: fHMEoXUwQI6BEBVIExrCYQ==
X-CSE-MsgGUID: FpkBh/4ZTvOAX4DW57hFng==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83360540"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="83360540"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 03:49:35 -0700
X-CSE-ConnectionGUID: 9tv15xrsQvalYkqXt8P8jA==
X-CSE-MsgGUID: LQ0zB6XRSxW7fq4M0BKpig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242702651"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 03:49:33 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMkg6-0000000020M-2Znf;
	Tue, 12 May 2026 10:49:30 +0000
Date: Tue, 12 May 2026 18:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8182/13385] net/rds/tcp_listen.c:136
 rds_tcp_accept_one() error: we previously assumed 'new_sock' could be null
 (see line 131)
Message-ID: <202605121815.5u1tbtZK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gerd Rausch <gerd.rausch@oracle.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jack Vogel <jack.vogel@oracle.com>
CC: Allison Henderson <allison.henderson@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: db69e9b838c39f4fb17d0547aeb71d55a7f28061 [8182/13385] net/rds: rds_tcp_accept_one ought to not discard messages
:::::: branch date: 4 days ago
:::::: commit date: 4 months ago
config: sparc-randconfig-r073-20260508 (https://download.01.org/0day-ci/archive/20260512/202605121815.5u1tbtZK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605121815.5u1tbtZK-lkp@intel.com/

smatch warnings:
net/rds/tcp_listen.c:136 rds_tcp_accept_one() error: we previously assumed 'new_sock' could be null (see line 131)

vim +/new_sock +136 net/rds/tcp_listen.c

db69e9b838c39f Gerd Rausch       2026-01-21  107  
db69e9b838c39f Gerd Rausch       2026-01-21  108  int rds_tcp_accept_one(struct rds_tcp_net *rtn)
70041088e3b976 Andy Grover       2009-08-21  109  {
db69e9b838c39f Gerd Rausch       2026-01-21  110  	struct socket *listen_sock = rtn->rds_tcp_listen_sock;
70041088e3b976 Andy Grover       2009-08-21  111  	struct socket *new_sock = NULL;
70041088e3b976 Andy Grover       2009-08-21  112  	struct rds_connection *conn;
70041088e3b976 Andy Grover       2009-08-21  113  	int ret;
70041088e3b976 Andy Grover       2009-08-21  114  	struct inet_sock *inet;
bd7c5f983f3185 Sowmini Varadhan  2016-05-02  115  	struct rds_tcp_connection *rs_tcp = NULL;
bd7c5f983f3185 Sowmini Varadhan  2016-05-02  116  	int conn_state;
ea3b1ea5393087 Sowmini Varadhan  2016-06-30  117  	struct rds_conn_path *cp;
1e2b44e78eead7 Ka-Cheong Poon    2018-07-23  118  	struct in6_addr *my_addr, *peer_addr;
e65d4d96334e3f Ka-Cheong Poon    2018-07-30  119  #if !IS_ENABLED(CONFIG_IPV6)
e65d4d96334e3f Ka-Cheong Poon    2018-07-30  120  	struct in6_addr saddr, daddr;
e65d4d96334e3f Ka-Cheong Poon    2018-07-30  121  #endif
e65d4d96334e3f Ka-Cheong Poon    2018-07-30  122  	int dev_if = 0;
70041088e3b976 Andy Grover       2009-08-21  123  
db69e9b838c39f Gerd Rausch       2026-01-21  124  	if (!listen_sock) /* module unload or netns delete in progress */
37e14f4fe2991f Sowmini Varadhan  2016-05-18  125  		return -ENETUNREACH;
37e14f4fe2991f Sowmini Varadhan  2016-05-18  126  
db69e9b838c39f Gerd Rausch       2026-01-21  127  	mutex_lock(&rtn->rds_tcp_accept_lock);
db69e9b838c39f Gerd Rausch       2026-01-21  128  	new_sock = rtn->rds_tcp_accepted_sock;
db69e9b838c39f Gerd Rausch       2026-01-21  129  	rtn->rds_tcp_accepted_sock = NULL;
db69e9b838c39f Gerd Rausch       2026-01-21  130  
db69e9b838c39f Gerd Rausch       2026-01-21 @131  	if (!new_sock) {
db69e9b838c39f Gerd Rausch       2026-01-21  132  		ret = kernel_accept(listen_sock, &new_sock, O_NONBLOCK);
70041088e3b976 Andy Grover       2009-08-21  133  		if (ret)
db69e9b838c39f Gerd Rausch       2026-01-21  134  			goto out;
84eef2b2187ed7 Ka-Cheong Poon    2018-03-01  135  
480aeb9639d6a0 Christoph Hellwig 2020-05-28 @136  		rds_tcp_keepalive(new_sock);
6997fbd7a3dafa Tetsuo Handa      2022-05-05  137  		if (!rds_tcp_tune(new_sock)) {
6997fbd7a3dafa Tetsuo Handa      2022-05-05  138  			ret = -EINVAL;
6997fbd7a3dafa Tetsuo Handa      2022-05-05  139  			goto out;
6997fbd7a3dafa Tetsuo Handa      2022-05-05  140  		}
db69e9b838c39f Gerd Rausch       2026-01-21  141  	}
70041088e3b976 Andy Grover       2009-08-21  142  
70041088e3b976 Andy Grover       2009-08-21  143  	inet = inet_sk(new_sock->sk);
70041088e3b976 Andy Grover       2009-08-21  144  

:::::: The code at line 136 was first introduced by commit
:::::: 480aeb9639d6a077c611b303a22f9b1e5937d081 tcp: add tcp_sock_set_keepcnt

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
