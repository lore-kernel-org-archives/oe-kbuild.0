Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129CA92E
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 00:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769302665; cv=none; b=JtOoPPaVN2A7fj3E1HRMgjSDfteyZP9SDljWajiyNB1P0q7EqTVjZmSQXCCoWbAM4Yuo/sTo3yYbOGXsJUApaM3NspTYLio2p4tKzn2a2vtTcN5531OR7nu9tUShqLpTlx4nmMb7JjbQUHdZ2RZw3B94s9UX/qw8oGUwUwr3L3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769302665; c=relaxed/simple;
	bh=kIXfQe/r46xTrQ6et341bDrJR31rgf4D3gmerXx5Aro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i7Er96fSxNIHCZMqDv7s0mau+3iIKArO+980LGmSVqHPBbn4AyEkiQOxl0mIpnw4tRBSBbP9odO9pFHqJujCv9NWMmSamfBxwA327QYkJ/gm7ah+0TMEsKN3Uf2erT+kJ1RCo29eO7iqw7bz0HTieVk2kliJwQsYBqRGu74pAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiMpyaKN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiMpyaKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769302663; x=1800838663;
  h=date:from:to:cc:subject:message-id;
  bh=kIXfQe/r46xTrQ6et341bDrJR31rgf4D3gmerXx5Aro=;
  b=EiMpyaKNdUdXhTZMxDJBcMpMzAOIdkEtY6dxI1gtXshczxJZIRELV+GG
   D0o3f43/oGSzQ0x0J6nO27ldumBFaQCXATyyQ4PJ2jiF0tZMXZb/t6ruz
   ZbL+rAd/xmHsJqxYAkhKJkGwBGdbSPh4uHAH0D4smvu7E3aGAVU13e1bl
   D9LwqgeWMxfBcJQN3fw98bf9uNN7lOgUAMApNQ2LCvbJopTEJP+76SJwO
   LJ/G/R9YmgAKcFsENlFsYFsOTtt4iaGGygSLLxOaEbAi8vhu8/8COtxNf
   uijtxXfh8Y61l0wPVBypNMJOaylq/iHukrRCD5r7ESjRv3goS/1w7Qhvm
   w==;
X-CSE-ConnectionGUID: 7m+Qp0A6StaR+z8B53fxTQ==
X-CSE-MsgGUID: zLFzse/5SKSruRrL2SZAOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="73099988"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="73099988"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 16:57:42 -0800
X-CSE-ConnectionGUID: KOSWOg2CRpOExUaqzVvxOg==
X-CSE-MsgGUID: Y5UZKI97R2SYlmjsDeqgGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207696649"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2026 16:57:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjoRf-00000000VeE-16hi;
	Sun, 25 Jan 2026 00:57:39 +0000
Date: Sun, 25 Jan 2026 08:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [net-next:main 51/52] net/rds/tcp_listen.c:136
 rds_tcp_accept_one() error: we previously assumed 'new_sock' could be null
 (see line 131)
Message-ID: <202601250843.PYYDz3s5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: netdev@vger.kernel.org
TO: Gerd Rausch <gerd.rausch@oracle.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jack Vogel <jack.vogel@oracle.com>
CC: Allison Henderson <allison.henderson@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   eac026ff97a9447d34113dd7c4adbcd185185142
commit: db69e9b838c39f4fb17d0547aeb71d55a7f28061 [51/52] net/rds: rds_tcp_accept_one ought to not discard messages
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-141-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250843.PYYDz3s5-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601250843.PYYDz3s5-lkp@intel.com/

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
