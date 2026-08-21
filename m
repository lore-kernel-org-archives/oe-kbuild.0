Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FDC328B4B
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319470; cv=none; b=iwad6nw0KJGtc8RR2mpty9S9dr8M9t8wXj2xO9NAPcmoET7cYoYW4nTG6kiUe4sVS4XltQtHD/hXw7zhDcaQb09Eoy0JOtk5aaWGHsyAVWRplEWm0jn+vHSo3/7EIe4ZKqx5ThtFlf38Ks3LAjtlCHc2xnYG/B4ENqrbdjNAovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319470; c=relaxed/simple;
	bh=ueycP1P87f1ZIMMOteO0oMHaUYldX/wsFpDqmWoSdHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NY58elcr4heLR/oQeX5l/4s6cBJU5OlfX2R172lv61VXmqZhwedOdEKiO9v7lZf2izbTRY6x6WdYZK2vrtPlBxa84bZaOnVoBuUH6A3Vy+ymK3NLslfsn2y3gjvK29pHiuavBbUKuEGSu4PXVVGoL2FveQBqyTEK5hifD+LACNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0uV6Onx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0uV6Onx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787319468; x=1818855468;
  h=date:from:to:cc:subject:message-id;
  bh=ueycP1P87f1ZIMMOteO0oMHaUYldX/wsFpDqmWoSdHQ=;
  b=Q0uV6OnxuVuHEVCWp7UMgk5IstpQcsYgBM8+3QaD9vtc6t1t2ftETJ8p
   ANu+eGQFoXIf3hGHxbvhMvk/6ICA980Hvx6zgBs22wPpgw3MqCSUEJvkv
   oSU0HbHTPqjkRpQNMPMKf8bKIzh3rr2rBSgnkj+hFjeJEXU2qWUOfaBsd
   /f9C591H2ex1a4GZ4yCRLoGSgHngDByN9NvUb1SCGCFqqM6M8K78T4x3P
   4epUlH/r5PFH/rNQWuSZx6IQ3hznUKz0VuH0u9ybgI8xIVNfPvMY1+jt8
   Bas4a6UWlP38QFL/5d6vOSi8Nqw6w94UnIiyyoznoiMi+thOYTgPHRzJA
   A==;
X-CSE-ConnectionGUID: qRDxyOYTTXqgofPxYM2qyA==
X-CSE-MsgGUID: 3i4aDLazS7CC3IHel1hkyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="110653751"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="110653751"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 06:37:44 -0700
X-CSE-ConnectionGUID: gWNokQ1NRlCLbKYu8C5P0A==
X-CSE-MsgGUID: 0k6XKiceTcuQBoTGA16gHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="270578044"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2026 06:37:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxPRE-00000000pyR-2e3q;
	Fri, 21 Aug 2026 13:37:40 +0000
Date: Fri, 21 Aug 2026 21:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/rds/tcp_listen.c:136 rds_tcp_accept_one() error: we
 previously assumed 'new_sock' could be null (see line 131)
Message-ID: <202608212155.wtgrI7Uu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gerd Rausch <gerd.rausch@oracle.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jack Vogel <jack.vogel@oracle.com>
CC: Allison Henderson <allison.henderson@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   818bebeb63dd6bf5f4e07e145f6cdbace520a34c
commit: db69e9b838c39f4fb17d0547aeb71d55a7f28061 net/rds: rds_tcp_accept_one ought to not discard messages
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: powerpc64-randconfig-r071-20260821 (https://download.01.org/0day-ci/archive/20260821/202608212155.wtgrI7Uu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: db69e9b838c3 ("net/rds: rds_tcp_accept_one ought to not discard messages")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608212155.wtgrI7Uu-lkp@intel.com/

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
