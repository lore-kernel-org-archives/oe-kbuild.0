Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B581A1EEA3C
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 03:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778815383; cv=none; b=Hn3KOiYy/w+8d7aUea2s+f17mWTZzmHXgtH4aYZZJvS9iSfhosWLrXc7M970ptDP9dODL1maSiIBxklYwQ7bCwDy0U+mQjKzV/nKFu1LGpBYuH3Z3Z3RA1LHCr7uT7GHyOAqUX5Vrs/Kc0MIncBeN6IqkrxRyt9tT8HyiF8Gbcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778815383; c=relaxed/simple;
	bh=zbYZ29bz7FjlFDkTpIFLF3DL1u8EPGPm8muPUxUNhO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YcIs/t1fy3hjqiPe518JX/P/YUnCBzjsM7ku1lXP5aJGxHccFRhhA0xDDwDeJKPeV5Jh6AKE2A8YRW7a9G0qDKAniCnjmkoaZdQj/rXtjUwjOkpe/vh0fV+5YHzvwZ+u7uDZvWDnwSfRMkEVh73/7BcuVHCjWuIx+Ggkbv/CUHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+PL2Csr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+PL2Csr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778815381; x=1810351381;
  h=date:from:to:cc:subject:message-id;
  bh=zbYZ29bz7FjlFDkTpIFLF3DL1u8EPGPm8muPUxUNhO0=;
  b=L+PL2Csr9d6x5kRRuidkCWypak5RCxSTbChGrE7+hv1I7fP26K0gL1TH
   YxmevA8A9bklIBbLGJYJIhBhUTfKi0JNMzD5PIex+YuGoBCvNedsWiuXH
   ENQeFCoFwEqOBAEojS16iWBZlbRvJzbprzm8dsA5Ifk+HMxf4XS7C0Xoq
   znbmKSzGOp1kE4b4tk1z+IzybAiF//iCLIW4jGAtzPfKIQVVaOYuKtvkA
   bQH3llbMHb4DXcuxmKVPfzgtdlu3P2qQJVYn99fAj/H92Ch3Im5r6vTK2
   imKeZYrrv7M5HtjyQ2Xq/Rd8cqcvj5gM0xndOSU3rF1Uik0B3Aq/6iP+K
   A==;
X-CSE-ConnectionGUID: H+SKlIVARzuglOJtFsE7Bg==
X-CSE-MsgGUID: oI0LyY83SAmf75Ybs1EREQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79625809"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79625809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 20:23:01 -0700
X-CSE-ConnectionGUID: OUkQTIeQSWuT6aBzeB22Sw==
X-CSE-MsgGUID: ZkQDDM90Scidqnqk7puFag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242569989"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 20:22:56 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNj7o-000000000jL-2FXR;
	Fri, 15 May 2026 03:22:19 +0000
Date: Fri, 15 May 2026 11:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8182/13385] net/rds/tcp_listen.c:136
 rds_tcp_accept_one() error: we previously assumed 'new_sock' could be null
 (see line 131)
Message-ID: <202605151138.fvPdeQXF-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 4 months ago
config: sparc-randconfig-r073-20260508 (https://download.01.org/0day-ci/archive/20260515/202605151138.fvPdeQXF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605151138.fvPdeQXF-lkp@intel.com/

smatch warnings:
net/rds/tcp_listen.c:136 rds_tcp_accept_one() error: we previously assumed 'new_sock' could be null (see line 131)

vim +/new_sock +136 net/rds/tcp_listen.c

db69e9b838c39f4 Gerd Rausch       2026-01-21  107  
db69e9b838c39f4 Gerd Rausch       2026-01-21  108  int rds_tcp_accept_one(struct rds_tcp_net *rtn)
70041088e3b9766 Andy Grover       2009-08-21  109  {
db69e9b838c39f4 Gerd Rausch       2026-01-21  110  	struct socket *listen_sock = rtn->rds_tcp_listen_sock;
70041088e3b9766 Andy Grover       2009-08-21  111  	struct socket *new_sock = NULL;
70041088e3b9766 Andy Grover       2009-08-21  112  	struct rds_connection *conn;
70041088e3b9766 Andy Grover       2009-08-21  113  	int ret;
70041088e3b9766 Andy Grover       2009-08-21  114  	struct inet_sock *inet;
bd7c5f983f3185b Sowmini Varadhan  2016-05-02  115  	struct rds_tcp_connection *rs_tcp = NULL;
bd7c5f983f3185b Sowmini Varadhan  2016-05-02  116  	int conn_state;
ea3b1ea53930879 Sowmini Varadhan  2016-06-30  117  	struct rds_conn_path *cp;
1e2b44e78eead7b Ka-Cheong Poon    2018-07-23  118  	struct in6_addr *my_addr, *peer_addr;
e65d4d96334e3ff Ka-Cheong Poon    2018-07-30  119  #if !IS_ENABLED(CONFIG_IPV6)
e65d4d96334e3ff Ka-Cheong Poon    2018-07-30  120  	struct in6_addr saddr, daddr;
e65d4d96334e3ff Ka-Cheong Poon    2018-07-30  121  #endif
e65d4d96334e3ff Ka-Cheong Poon    2018-07-30  122  	int dev_if = 0;
70041088e3b9766 Andy Grover       2009-08-21  123  
db69e9b838c39f4 Gerd Rausch       2026-01-21  124  	if (!listen_sock) /* module unload or netns delete in progress */
37e14f4fe2991f6 Sowmini Varadhan  2016-05-18  125  		return -ENETUNREACH;
37e14f4fe2991f6 Sowmini Varadhan  2016-05-18  126  
db69e9b838c39f4 Gerd Rausch       2026-01-21  127  	mutex_lock(&rtn->rds_tcp_accept_lock);
db69e9b838c39f4 Gerd Rausch       2026-01-21  128  	new_sock = rtn->rds_tcp_accepted_sock;
db69e9b838c39f4 Gerd Rausch       2026-01-21  129  	rtn->rds_tcp_accepted_sock = NULL;
db69e9b838c39f4 Gerd Rausch       2026-01-21  130  
db69e9b838c39f4 Gerd Rausch       2026-01-21 @131  	if (!new_sock) {
db69e9b838c39f4 Gerd Rausch       2026-01-21  132  		ret = kernel_accept(listen_sock, &new_sock, O_NONBLOCK);
70041088e3b9766 Andy Grover       2009-08-21  133  		if (ret)
db69e9b838c39f4 Gerd Rausch       2026-01-21  134  			goto out;
84eef2b2187ed73 Ka-Cheong Poon    2018-03-01  135  
480aeb9639d6a07 Christoph Hellwig 2020-05-28 @136  		rds_tcp_keepalive(new_sock);
6997fbd7a3dafa7 Tetsuo Handa      2022-05-05  137  		if (!rds_tcp_tune(new_sock)) {
6997fbd7a3dafa7 Tetsuo Handa      2022-05-05  138  			ret = -EINVAL;
6997fbd7a3dafa7 Tetsuo Handa      2022-05-05  139  			goto out;
6997fbd7a3dafa7 Tetsuo Handa      2022-05-05  140  		}
db69e9b838c39f4 Gerd Rausch       2026-01-21  141  	}
70041088e3b9766 Andy Grover       2009-08-21  142  
70041088e3b9766 Andy Grover       2009-08-21  143  	inet = inet_sk(new_sock->sk);
70041088e3b9766 Andy Grover       2009-08-21  144  

:::::: The code at line 136 was first introduced by commit
:::::: 480aeb9639d6a077c611b303a22f9b1e5937d081 tcp: add tcp_sock_set_keepcnt

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
