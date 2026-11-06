Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955254;
	b=POdFwAiyQJkOSD9vAjHM5MVJoC7FBQ/mmmOG97UUtzDDRdDR7/a5Xc1nXIB8G0Ypk807
	 1zOV2u5atxKrGU1CEZWufdT+l3Iti1rLR/nRgbtF2OUXDvHJQgEGZQ2+NI6Y84yXV5lLy
	 zXSoQ9q+u5LafmLh3kZPWkIIQ0qKkla96pftKkKOoN3CKteyD86W22baFDWzAbSXaDUwy
	 JfO4VQfGSV/P4kK0truc3HFk2Bq0J9MNHXegV9rczI7uc3bHXAgO9NSfVgSpvOzSHoK91
	 TxsL++Hr6cTkThdtks7EpeavRENBsQYuog7PSye34ZbZI0pmTbDtZDzz5mphh0pwKsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955254;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UC1bTJrngdcXZu6cjZp+vL1tkBEinRZjTFsvqu7PXh4=;
	b=Pw/fRTjsbJIEc5Ggl42ettsJ1gPoTACAVqVnU4xw9a8l34N0pWtnzoy087SXzn+Z6Lx5
	 1/muAPux5gkpjPNpwoGHVfO4iCwd741OxOyT4+2eaSkzKGO3bnt6Zpm+NWv8l7F7wFBKU
	 P8hNtUpaAswrq6dJVZ1d7Ysa/P2DBnMNJZo8apyxSJT0QgCTPBa/3C/Z2KIcJw+910hHP
	 CJOWuY7lmXQTM8aL0yBe84Szes0WH4M6EmMmmET8VDd5vEDPe0ihkrhiyXD7794tdgkAb
	 YeorPKtyb/c3jiJ59JMTq7LYpU2L3+9V3MLUAB2v/SdhYI2kPQGVa8uxp9i9jRvavGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=anyW2oG6;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8A3606A326
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 08:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8A3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=anyW2oG6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793955251; x=1825491251;
  h=date:from:to:cc:subject:message-id;
  bh=KVgzSl0Ygt7c3pWAzrUN/i3YruhNVCYa4YL+3Ka2oXA=;
  b=anyW2oG6Vel0zm5Ug6lJ5QSQKAES0FfbjC6D5xmO42jyy0PYBMs2WtoC
   YVLl1LcEJbnDwl6jFJG2Ds9ndMcwggEFXtzBAFS0Wk3e66W9FO0JZQvGs
   Sunn2MFj3FBZ1Epy0/lEunNoxuVTwv4fiVlmnVlLWb8++zo6Y68O6hVaO
   f4L1qCamTbE2em5VPq6glZejQho61acQFWQG2HO/poA73DPJd4g+VyQTe
   dO5W8nNSVN5+2N6ERtaYRFHn66l3zCiEN5u3plqWoRP8bOHsXy3rjG1eb
   A8Hmm0wCMr4QcjKY5ivN9U9vV93XlwwNs/w7k6aMAGE6nKH8SD34bK4bY
   w==;
X-CSE-ConnectionGUID: +pGdsMQyQvKlwgIHN0ZhDQ==
X-CSE-MsgGUID: v4KItcCDT7qrZ7pmSpLnOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2803420"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2803420"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 00:54:11 -0800
X-CSE-ConnectionGUID: gWTGAo2fQU2G97upQSE54Q==
X-CSE-MsgGUID: RD7iQ8k0RIuhRvqyKgY1bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7651808"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Nov 2026 00:54:11 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPFi3-00000000AA7-3vey;
	Fri, 06 Nov 2026 08:54:07 +0000
Date: Fri, 06 Nov 2026 09:53:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 390/390]
 fs/smb/client/connect.c:2957 generic_ip_connect() error: we previously
 assumed 'socket' could be null (see line 2945)
Message-ID: <202611060956.w9ZYVm13-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [390/390] smb: move client and server files to common directory fs/smb
:::::: branch date: 35 hours ago
:::::: commit date: 3 years, 4 months ago
config: i386-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060956.w9ZYVm13-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060956.w9ZYVm13-lkp@intel.com/

New smatch warnings:
fs/smb/client/connect.c:2957 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2945)
fs/smb/client/smb2ops.c:4984 receive_encrypted_read() error: we previously assumed 'pages' could be null (see line 4912)
fs/smb/client/cifssmb.c:4026 CIFSFindFirst() warn: missing error code? 'rc'
fs/smb/client/cifssmb.c:4153 CIFSFindNext() warn: missing error code? 'rc'

Old smatch warnings:
fs/smb/client/connect.c:2758 cifs_match_super() error: 'tlink' dereferencing possible ERR_PTR()
fs/smb/client/smb2ops.c:2054 smb3_enum_snapshots() warn: potential user controlled sizeof overflow 'snapshot_in.snapshot_array_size + 12' '0-u32max + 12'
fs/smb/client/smb2ops.c:2056 smb3_enum_snapshots() warn: potential user controlled sizeof overflow 'snapshot_in.snapshot_array_size + 12' '0-u32max + 12'

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
