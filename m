Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0B11C2317
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730740833; cv=none; b=hWEYJfwTBb+V0L/7uVBtCkqCdPo/siHD8M1lujmJ1fk1aQO3NVn3iSsvY9cLR4hSl7GZtIOetTEuKEad9oXJKstoZIiCcr8U/qXWPXcqKHceio4Y1WjGjX891H/T71TvUOxa26aeC32ZHcyvkNpSdgnGpc526D7voHzY6eq7o+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730740833; c=relaxed/simple;
	bh=jMYUb/LJeeBzAIFLPMp3+0fKStveQ8aIo29LbKToh8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHaEs1mVae7AQ8dDVkEpQtUNHaQAvxec9KLjgkkSK8OjNEDPdHjYWD5N06Bzua5X34oyQqXA15BrXKBq5XaMK+l34NP76I60jXnWofTALJIOKgQIPLY+XksxJ2B/w9oEFeqnIv7hmi1ktiwDd8w5HkU5h1ILNPZl7pbFUsh5vbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xszc7h7J; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xszc7h7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730740831; x=1762276831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMYUb/LJeeBzAIFLPMp3+0fKStveQ8aIo29LbKToh8E=;
  b=Xszc7h7Jq21XpzisR+jpuJGzV0fR3VFR1pW+EmQe1hYaHw35C6R+c8TN
   Qzl3Eo04kNRtd0QdswX1Txbj4pW2XZije2JNynTeDKsm2sHeRsEflnRVS
   cyDf6X1Tej/y2XRmeYQeLoTM1ZpcGT3/7Io4Fjd71gNYbZSyGDqWjJKr3
   RMR5/ws2WYHWqFQ44bQ1DUOde1ztrrb2cfiHcOxUs2I7ZYMnXniOSXXM7
   loFH4PVMcxnJUG9VPVvnf6LIhJVK+VHXSb+sh5Np5i1kh/Qiaha9nxGWR
   iXYFQUFLfpzFBeEStqQvHfVR+M9sK27aGazTvpHkPpYHYvG7byo/9uoCO
   g==;
X-CSE-ConnectionGUID: yIjGNXrcT82rnyOCwJx+Eg==
X-CSE-MsgGUID: n0LRavRkTZ2NhVnAuRWT0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18070823"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="18070823"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 09:20:29 -0800
X-CSE-ConnectionGUID: P7/XpeYsQDWO3HfrzchxkA==
X-CSE-MsgGUID: gkEEVyvFTQOPrpGfWENgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83841232"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Nov 2024 09:20:28 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t80kb-000l3t-15;
	Mon, 04 Nov 2024 17:20:25 +0000
Date: Tue, 5 Nov 2024 01:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] smb: client: Fix use-after-free of network namespace.
Message-ID: <202411050141.wasHP8Hl-lkp@intel.com>
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
In-Reply-To: <20241102212438.76691-1-kuniyu@amazon.com>
References: <20241102212438.76691-1-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.12-rc6]
[cannot apply to next-20241104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/smb-client-Fix-use-after-free-of-network-namespace/20241103-052634
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20241102212438.76691-1-kuniyu%40amazon.com
patch subject: [PATCH v2] smb: client: Fix use-after-free of network namespace.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-r071-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050141.wasHP8Hl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411050141.wasHP8Hl-lkp@intel.com/

smatch warnings:
fs/smb/client/connect.c:3082 generic_ip_connect() error: we previously assumed 'server->ssocket' could be null (see line 3069)

vim +3082 fs/smb/client/connect.c

^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3039  
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3040  static int
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3041  generic_ip_connect(struct TCP_Server_Info *server)
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3042  {
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3043  	struct sockaddr *saddr;
f0b6a834a8f0d26 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3044  	struct socket *socket;
f0b6a834a8f0d26 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3045  	int slen, sfamily;
f0b6a834a8f0d26 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3046  	__be16 sport;
f0b6a834a8f0d26 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3047  	int rc = 0;
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3048  
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3049  	saddr = (struct sockaddr *) &server->dstaddr;
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3050  
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3051  	if (server->dstaddr.ss_family == AF_INET6) {
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3052  		struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *)&server->dstaddr;
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3053  
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3054  		sport = ipv6->sin6_port;
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3055  		slen = sizeof(struct sockaddr_in6);
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3056  		sfamily = AF_INET6;
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3057  		cifs_dbg(FYI, "%s: connecting to [%pI6]:%d\n", __func__, &ipv6->sin6_addr,
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3058  				ntohs(sport));
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3059  	} else {
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3060  		struct sockaddr_in *ipv4 = (struct sockaddr_in *)&server->dstaddr;
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3061  
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3062  		sport = ipv4->sin_port;
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3063  		slen = sizeof(struct sockaddr_in);
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3064  		sfamily = AF_INET;
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3065  		cifs_dbg(FYI, "%s: connecting to %pI4:%d\n", __func__, &ipv4->sin_addr,
def6e1dc1781682 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3066  				ntohs(sport));
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3067  	}
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3068  
f0b6a834a8f0d26 fs/smb/client/connect.c Paulo Alcantara        2023-06-19 @3069  	if (server->ssocket) {
f0b6a834a8f0d26 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3070  		socket = server->ssocket;
f0b6a834a8f0d26 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3071  	} else {
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3072  		struct net *net = cifs_net_ns(server);
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3073  		struct sock *sk;
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3074  
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3075  		rc = __sock_create(net, sfamily, SOCK_STREAM,
f0b6a834a8f0d26 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3076  				   IPPROTO_TCP, &server->ssocket, 1);
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3077  		if (rc < 0) {
afe6f65353b644f fs/cifs/connect.c       Ronnie Sahlberg        2019-08-28  3078  			cifs_server_dbg(VFS, "Error %d creating socket\n", rc);
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3079  			return rc;
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3080  		}
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3081  
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02 @3082  		sk = server->ssocket->sk;
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3083  		__netns_tracker_free(net, &sk->ns_tracker, false);
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3084  		sk->sk_net_refcnt = 1;
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3085  		get_net_track(net, &sk->ns_tracker, GFP_KERNEL);
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3086  		sock_inuse_add(net, 1);
59ac25049633459 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3087  
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3088  		/* BB other socket options to set KEEPALIVE, NODELAY? */
f96637be081141d fs/cifs/connect.c       Joe Perches            2013-05-04  3089  		cifs_dbg(FYI, "Socket created\n");
f0b6a834a8f0d26 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3090  		socket = server->ssocket;
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3091  		socket->sk->sk_allocation = GFP_NOFS;
98123866fcf3fe9 fs/cifs/connect.c       Benjamin Coddington    2022-12-16  3092  		socket->sk->sk_use_task_frag = false;
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3093  		if (sfamily == AF_INET6)
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3094  			cifs_reclassify_socket6(socket);
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3095  		else
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3096  			cifs_reclassify_socket4(socket);
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3097  	}
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3098  
3eb9a8893a76cf1 fs/cifs/connect.c       Ben Greear             2010-09-01  3099  	rc = bind_socket(server);
3eb9a8893a76cf1 fs/cifs/connect.c       Ben Greear             2010-09-01  3100  	if (rc < 0)
3eb9a8893a76cf1 fs/cifs/connect.c       Ben Greear             2010-09-01  3101  		return rc;
3eb9a8893a76cf1 fs/cifs/connect.c       Ben Greear             2010-09-01  3102  
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3103  	/*
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3104  	 * Eventually check for other socket options to change from
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3105  	 * the default. sock_setsockopt not used because it expects
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3106  	 * user space buffer
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3107  	 */
d5c5605c27c92da fs/cifs/connect.c       Jeff Layton            2008-12-01  3108  	socket->sk->sk_rcvtimeo = 7 * HZ;
da505c386c9f993 fs/cifs/connect.c       Steve French           2009-01-19  3109  	socket->sk->sk_sndtimeo = 5 * HZ;
6a5fa2362b628ee fs/cifs/connect.c       Steve French           2010-01-01  3110  
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3111  	/* make the bufsizes depend on wsize/rsize and max requests */
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3112  	if (server->noautotune) {
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3113  		if (socket->sk->sk_sndbuf < (200 * 1024))
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3114  			socket->sk->sk_sndbuf = 200 * 1024;
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3115  		if (socket->sk->sk_rcvbuf < (140 * 1024))
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3116  			socket->sk->sk_rcvbuf = 140 * 1024;
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3117  	}
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3118  
12abc5ee7873a08 fs/cifs/connect.c       Christoph Hellwig      2020-05-28  3119  	if (server->tcp_nodelay)
12abc5ee7873a08 fs/cifs/connect.c       Christoph Hellwig      2020-05-28  3120  		tcp_sock_set_nodelay(socket->sk);
6a5fa2362b628ee fs/cifs/connect.c       Steve French           2010-01-01  3121  
f96637be081141d fs/cifs/connect.c       Joe Perches            2013-05-04  3122  	cifs_dbg(FYI, "sndbuf %d rcvbuf %d rcvtimeo 0x%lx\n",
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3123  		 socket->sk->sk_sndbuf,
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3124  		 socket->sk->sk_rcvbuf, socket->sk->sk_rcvtimeo);
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3125  
cedc019b9f260fa fs/smb/client/connect.c Jordan Rife            2023-10-03  3126  	rc = kernel_connect(socket, saddr, slen,
8eecd1c2e5bc73d fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-07-16  3127) 			    server->noblockcnt ? O_NONBLOCK : 0);
d532cc7efdfd7bf fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3128) 	/*
d532cc7efdfd7bf fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3129) 	 * When mounting SMB root file systems, we do not want to block in
d532cc7efdfd7bf fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3130) 	 * connect. Otherwise bail out and then let cifs_reconnect() perform
d532cc7efdfd7bf fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3131) 	 * reconnect failover - if possible.
d532cc7efdfd7bf fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3132) 	 */
d532cc7efdfd7bf fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3133) 	if (server->noblockcnt && rc == -EINPROGRESS)
8eecd1c2e5bc73d fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-07-16  3134) 		rc = 0;
ee1b3ea9e6171d7 fs/cifs/connect.c       Jeff Layton            2011-06-21  3135  	if (rc < 0) {
f96637be081141d fs/cifs/connect.c       Joe Perches            2013-05-04  3136  		cifs_dbg(FYI, "Error %d connecting to server\n", rc);
d7171cd1acf70eb fs/cifs/connect.c       Steve French           2021-11-04  3137  		trace_smb3_connect_err(server->hostname, server->conn_id, &server->dstaddr, rc);
ee1b3ea9e6171d7 fs/cifs/connect.c       Jeff Layton            2011-06-21  3138  		sock_release(socket);
ee1b3ea9e6171d7 fs/cifs/connect.c       Jeff Layton            2011-06-21  3139  		server->ssocket = NULL;
ee1b3ea9e6171d7 fs/cifs/connect.c       Jeff Layton            2011-06-21  3140  		return rc;
ee1b3ea9e6171d7 fs/cifs/connect.c       Jeff Layton            2011-06-21  3141  	}
d7171cd1acf70eb fs/cifs/connect.c       Steve French           2021-11-04  3142  	trace_smb3_connect_done(server->hostname, server->conn_id, &server->dstaddr);
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3143  	if (sport == htons(RFC1001_PORT))
a9f1b85e5ba8051 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3144  		rc = ip_rfc1001_connect(server);
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3145  
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3146  	return rc;
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3147  }
^1da177e4c3f415 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
