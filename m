Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC937FF56
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205904; cv=none; b=WGO+MZ67a6Zt8R52QsEtLagwqLCc9sL7cMxzJgVz6X78xJDKU2MMnt7zN/qmLXWoXEQPoX6amcYsra9QWUYrjawcTTBuyGpSp/+nfTltQSbmHOitHqEEz+zg0EvL1jbPp1fAs5FT+n7/1PyO5kb3KeSHrAI1sIG+P/lkDObBjws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205904; c=relaxed/simple;
	bh=1vKSU63sK78OqiDe3hX+YPIX7DFdDvo+d1TgCVfQTKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ia/Kc68fc1M2c7MZ3lz45pvUmfctDr4v8sv+WlmK4w/QYOC3hflK9+W32bb8kOKaUGzInxBufuv4J5eyhT57v0SLFGqy3xc1ioJVR5vdcHx14bZmeM42detyfvR0gFM3kvG8d5OvuPsIyIujMPuP5G4dlkJoP9JYqG2ibAvJL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOJBIQvp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOJBIQvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205903; x=1806741903;
  h=date:from:to:cc:subject:message-id;
  bh=1vKSU63sK78OqiDe3hX+YPIX7DFdDvo+d1TgCVfQTKk=;
  b=ZOJBIQvpft+QEMZTZZ61CO7MT8iFPDISrDMC8ulQZfSGhWiar206EhGI
   9JTl/1XxvH63wEgMp239WKbWaJxjNV2mOl6pX8QoClwEuqEew9cnKTLn6
   prn/3uocSv/ftrfMDuRN501CXrVTnKxTZaZSGjs0fM81lc6FEr4H+Z3Ol
   cScEXO8ycJza28OgncWwE5O8yuyjqlTrJmXgC8yZV75br+LrDXaML76sR
   pyDldNORaJ0dqhbkU36G0TzvfH3V9NgqhozKOo16vyucfgCe5MLgYu9Ie
   y/X9U90WPot6KbK354v+DFRc71VDhQLt30qQCLAimIxGfU5+7ieqdJ5Qt
   A==;
X-CSE-ConnectionGUID: i7o3QawYRkOoyMfFubvWaw==
X-CSE-MsgGUID: GByLnC0hQS6V4qtbkgFRMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86888900"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86888900"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:45:00 -0700
X-CSE-ConnectionGUID: LrMPdF8URn2oZvUG8+dXRw==
X-CSE-MsgGUID: N7B/QjJpTRGhDDJ0H72L0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368667"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:44:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015R-1Lup;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 03 Apr 2026 16:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 8/8]
 fs/smb/client/connect.c:2957 generic_ip_connect() error: we previously
 assumed 'socket' could be null (see line 2945)
Message-ID: <202604030858.SLDwL27t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5e515a3e6a73395e13127a3a8172e77da3d9b30
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [8/8] smb: move client and server files to common directory fs/smb
:::::: branch date: 26 hours ago
:::::: commit date: 2 years, 9 months ago
config: x86_64-randconfig-161-20260402 (https://download.01.org/0day-ci/archive/20260403/202604030858.SLDwL27t-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604030858.SLDwL27t-lkp@intel.com/

smatch warnings:
fs/smb/client/connect.c:2957 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2945)
fs/smb/client/smb2ops.c:4984 receive_encrypted_read() error: we previously assumed 'pages' could be null (see line 4912)
fs/smb/client/cifssmb.c:4026 CIFSFindFirst() warn: missing error code? 'rc'
fs/smb/client/cifssmb.c:4153 CIFSFindNext() warn: missing error code? 'rc'

vim +/socket +2957 fs/smb/client/connect.c

^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2915  
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2916  static int
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2917  generic_ip_connect(struct TCP_Server_Info *server)
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2918  {
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2919  	int rc = 0;
6da9791061ca3b fs/cifs/connect.c Steve French           2011-03-13  2920  	__be16 sport;
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2921  	int slen, sfamily;
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2922  	struct socket *socket = server->ssocket;
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2923  	struct sockaddr *saddr;
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2924  
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2925  	saddr = (struct sockaddr *) &server->dstaddr;
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2926  
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2927  	if (server->dstaddr.ss_family == AF_INET6) {
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2928  		struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *)&server->dstaddr;
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2929  
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2930  		sport = ipv6->sin6_port;
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2931  		slen = sizeof(struct sockaddr_in6);
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2932  		sfamily = AF_INET6;
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2933  		cifs_dbg(FYI, "%s: connecting to [%pI6]:%d\n", __func__, &ipv6->sin6_addr,
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2934  				ntohs(sport));
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2935  	} else {
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2936  		struct sockaddr_in *ipv4 = (struct sockaddr_in *)&server->dstaddr;
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2937  
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2938  		sport = ipv4->sin_port;
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2939  		slen = sizeof(struct sockaddr_in);
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2940  		sfamily = AF_INET;
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2941  		cifs_dbg(FYI, "%s: connecting to %pI4:%d\n", __func__, &ipv4->sin_addr,
def6e1dc178168 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2942  				ntohs(sport));
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2943  	}
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2944  
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01 @2945  	if (socket == NULL) {
f1d0c998653f1e fs/cifs/connect.c Rob Landley            2011-01-22  2946  		rc = __sock_create(cifs_net_ns(server), sfamily, SOCK_STREAM,
f1d0c998653f1e fs/cifs/connect.c Rob Landley            2011-01-22  2947  				   IPPROTO_TCP, &socket, 1);
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2948  		if (rc < 0) {
afe6f65353b644 fs/cifs/connect.c Ronnie Sahlberg        2019-08-28  2949  			cifs_server_dbg(VFS, "Error %d creating socket\n", rc);
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2950  			server->ssocket = NULL;
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2951  			return rc;
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2952  		}
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2953  
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2954  		/* BB other socket options to set KEEPALIVE, NODELAY? */
f96637be081141 fs/cifs/connect.c Joe Perches            2013-05-04  2955  		cifs_dbg(FYI, "Socket created\n");
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2956  		server->ssocket = socket;
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01 @2957  		socket->sk->sk_allocation = GFP_NOFS;
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2958  		if (sfamily == AF_INET6)
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2959  			cifs_reclassify_socket6(socket);
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2960  		else
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2961  			cifs_reclassify_socket4(socket);
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2962  	}
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  2963  
3eb9a8893a76cf fs/cifs/connect.c Ben Greear             2010-09-01  2964  	rc = bind_socket(server);
3eb9a8893a76cf fs/cifs/connect.c Ben Greear             2010-09-01  2965  	if (rc < 0)
3eb9a8893a76cf fs/cifs/connect.c Ben Greear             2010-09-01  2966  		return rc;
3eb9a8893a76cf fs/cifs/connect.c Ben Greear             2010-09-01  2967  
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2968  	/*
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2969  	 * Eventually check for other socket options to change from
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2970  	 * the default. sock_setsockopt not used because it expects
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2971  	 * user space buffer
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2972  	 */
d5c5605c27c92d fs/cifs/connect.c Jeff Layton            2008-12-01  2973  	socket->sk->sk_rcvtimeo = 7 * HZ;
da505c386c9f99 fs/cifs/connect.c Steve French           2009-01-19  2974  	socket->sk->sk_sndtimeo = 5 * HZ;
6a5fa2362b628e fs/cifs/connect.c Steve French           2010-01-01  2975  
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2976  	/* make the bufsizes depend on wsize/rsize and max requests */
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2977  	if (server->noautotune) {
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2978  		if (socket->sk->sk_sndbuf < (200 * 1024))
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2979  			socket->sk->sk_sndbuf = 200 * 1024;
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2980  		if (socket->sk->sk_rcvbuf < (140 * 1024))
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2981  			socket->sk->sk_rcvbuf = 140 * 1024;
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2982  	}
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2983  
12abc5ee7873a0 fs/cifs/connect.c Christoph Hellwig      2020-05-28  2984  	if (server->tcp_nodelay)
12abc5ee7873a0 fs/cifs/connect.c Christoph Hellwig      2020-05-28  2985  		tcp_sock_set_nodelay(socket->sk);
6a5fa2362b628e fs/cifs/connect.c Steve French           2010-01-01  2986  
f96637be081141 fs/cifs/connect.c Joe Perches            2013-05-04  2987  	cifs_dbg(FYI, "sndbuf %d rcvbuf %d rcvtimeo 0x%lx\n",
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2988  		 socket->sk->sk_sndbuf,
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2989  		 socket->sk->sk_rcvbuf, socket->sk->sk_rcvtimeo);
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2990  
8eecd1c2e5bc73 fs/cifs/connect.c Paulo Alcantara (SUSE  2019-07-16  2991) 	rc = socket->ops->connect(socket, saddr, slen,
8eecd1c2e5bc73 fs/cifs/connect.c Paulo Alcantara (SUSE  2019-07-16  2992) 				  server->noblockcnt ? O_NONBLOCK : 0);
d532cc7efdfd7b fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2993) 	/*
d532cc7efdfd7b fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2994) 	 * When mounting SMB root file systems, we do not want to block in
d532cc7efdfd7b fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2995) 	 * connect. Otherwise bail out and then let cifs_reconnect() perform
d532cc7efdfd7b fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2996) 	 * reconnect failover - if possible.
d532cc7efdfd7b fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2997) 	 */
d532cc7efdfd7b fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2998) 	if (server->noblockcnt && rc == -EINPROGRESS)
8eecd1c2e5bc73 fs/cifs/connect.c Paulo Alcantara (SUSE  2019-07-16  2999) 		rc = 0;
ee1b3ea9e6171d fs/cifs/connect.c Jeff Layton            2011-06-21  3000  	if (rc < 0) {
f96637be081141 fs/cifs/connect.c Joe Perches            2013-05-04  3001  		cifs_dbg(FYI, "Error %d connecting to server\n", rc);
d7171cd1acf70e fs/cifs/connect.c Steve French           2021-11-04  3002  		trace_smb3_connect_err(server->hostname, server->conn_id, &server->dstaddr, rc);
ee1b3ea9e6171d fs/cifs/connect.c Jeff Layton            2011-06-21  3003  		sock_release(socket);
ee1b3ea9e6171d fs/cifs/connect.c Jeff Layton            2011-06-21  3004  		server->ssocket = NULL;
ee1b3ea9e6171d fs/cifs/connect.c Jeff Layton            2011-06-21  3005  		return rc;
ee1b3ea9e6171d fs/cifs/connect.c Jeff Layton            2011-06-21  3006  	}
d7171cd1acf70e fs/cifs/connect.c Steve French           2021-11-04  3007  	trace_smb3_connect_done(server->hostname, server->conn_id, &server->dstaddr);
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  3008  	if (sport == htons(RFC1001_PORT))
a9f1b85e5ba805 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  3009  		rc = ip_rfc1001_connect(server);
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  3010  
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  3011  	return rc;
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  3012  }
^1da177e4c3f41 fs/cifs/connect.c Linus Torvalds         2005-04-16  3013  

:::::: The code at line 2957 was first introduced by commit
:::::: d5c5605c27c92dac6de1a7a658af5b030847f949 cifs: make ipv6_connect take a TCP_Server_Info arg

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
