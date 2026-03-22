Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931A835958
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774203196; cv=none; b=Humii/Lib3AlIhjd5u3/3vVL3Atmukg7TnCV/PpGy97Lqw4dZYGGhpTTN6DTa3G9nDdw/pbxUQTx4iBV5EATIQ4CiNwTypaJn0slvUgycuWLULwrq22UMNzrUOol0wxHwZIKk3Iea/zmZ7JuK+X8hLGONJjL13c3OgScJ3ixT7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774203196; c=relaxed/simple;
	bh=Z8/V9NbCoIzoLKYUxr84MGk/HvFk5gTl++2+2DVBCQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GM3HGPg2zfail4YEaScHJ6juPhFeqT0+3Ld6oATfA+VLznqfZSUntBorI9Jd9hMNVhlZGIgkocDnsmsjxBuXUh2RASc+lTTFWSt/YtrUFWpYEjEH0ZCcggmvmFODEcRAnlJhaR2/vESdizK39Ojcmx7ht8dHgCeF4Cf0XDF1s0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuuIARYq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuuIARYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774203195; x=1805739195;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z8/V9NbCoIzoLKYUxr84MGk/HvFk5gTl++2+2DVBCQM=;
  b=DuuIARYqhvEFof09fHAMoVWlxhlS7ivsHxz8MDIgbmBCthysRSeLgmQh
   1sXRTNHorNiVCn9nFIwK13wdxYYaU7ao00i2/ffQEhaon8eJCWHrVxRP8
   yV5RXl3A8U6r1ClmIe/ofzX5wq3vssIK3F0Lc4sw/MpnZelj/gsdcWYor
   hweAwkVWfzTrUzqFfmo/yZlShCZdnRwYHGwcIklMNOQ3qiQDtGYv4RjJg
   EjOwn/oHMU4KDP0fDZA2hTmoB4ZgMJ3aMAKNgpvcwKLK/kVUs0NILsrnz
   oKpR9ARLhFmNHv0Bil2iPJNXdcORwExJN57cq7ExsMcLCEj1nOU6kRFIJ
   g==;
X-CSE-ConnectionGUID: kOa1oigyQsC6w0xjYo4ccQ==
X-CSE-MsgGUID: D+G3RjeQQX65Y62tuZUvIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100668813"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="100668813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 11:13:14 -0700
X-CSE-ConnectionGUID: QV8tyfCiRBKoCG2zJp6KmQ==
X-CSE-MsgGUID: FitFhWmBTNm62mXdeOFpEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="261720877"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Mar 2026 11:13:12 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4NIT-000000002Ut-32d3;
	Sun, 22 Mar 2026 18:13:09 +0000
Date: Mon, 23 Mar 2026 02:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/client/connect.c:3360 generic_ip_connect() error: we
 previously assumed 'server->ssocket' could be null (see line 3347)
Message-ID: <202603230251.8scooaYz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f
commit: 95d2b9f693ff2a1180a23d7d59acc0c4e72f4c41 Revert "smb: client: fix T=
CP timers deadlock after rmmod"
date:   11 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 11 months ago
config: hexagon-randconfig-r072-20260322 (https://download.01.org/0day-ci/a=
rchive/20260323/202603230251.8scooaYz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603230251.8scooaYz-lkp@intel.com/

smatch warnings:
fs/smb/client/connect.c:3360 generic_ip_connect() error: we previously assu=
med 'server->ssocket' could be null (see line 3347)

vim +3360 fs/smb/client/connect.c

^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
317 =20
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
318  static int
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
319  generic_ip_connect(struct TCP_Server_Info *server)
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
320  {
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
321  	struct sockaddr *saddr;
f0b6a834a8f0d2 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3=
322  	struct socket *socket;
f0b6a834a8f0d2 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3=
323  	int slen, sfamily;
f0b6a834a8f0d2 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3=
324  	__be16 sport;
f0b6a834a8f0d2 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3=
325  	int rc =3D 0;
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
326 =20
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
327  	saddr =3D (struct sockaddr *) &server->dstaddr;
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
328 =20
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
329  	if (server->dstaddr.ss_family =3D=3D AF_INET6) {
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
330  		struct sockaddr_in6 *ipv6 =3D (struct sockaddr_in6 *)&server->dstadd=
r;
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
331 =20
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
332  		sport =3D ipv6->sin6_port;
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
333  		slen =3D sizeof(struct sockaddr_in6);
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
334  		sfamily =3D AF_INET6;
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
335  		cifs_dbg(FYI, "%s: connecting to [%pI6]:%d\n", __func__, &ipv6->sin6=
_addr,
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
336  				ntohs(sport));
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
337  	} else {
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
338  		struct sockaddr_in *ipv4 =3D (struct sockaddr_in *)&server->dstaddr;
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
339 =20
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
340  		sport =3D ipv4->sin_port;
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
341  		slen =3D sizeof(struct sockaddr_in);
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
342  		sfamily =3D AF_INET;
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
343  		cifs_dbg(FYI, "%s: connecting to %pI4:%d\n", __func__, &ipv4->sin_ad=
dr,
def6e1dc178168 fs/cifs/connect.c       Samuel Cabrero         2020-10-16  3=
344  				ntohs(sport));
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
345  	}
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
346 =20
f0b6a834a8f0d2 fs/smb/client/connect.c Paulo Alcantara        2023-06-19 @3=
347  	if (server->ssocket) {
f0b6a834a8f0d2 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3=
348  		socket =3D server->ssocket;
f0b6a834a8f0d2 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3=
349  	} else {
ef7134c7fc48e1 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3=
350  		struct net *net =3D cifs_net_ns(server);
95d2b9f693ff2a fs/smb/client/connect.c Kuniyuki Iwashima      2025-04-02  3=
351  		struct sock *sk;
ef7134c7fc48e1 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3=
352 =20
95d2b9f693ff2a fs/smb/client/connect.c Kuniyuki Iwashima      2025-04-02  3=
353  		rc =3D __sock_create(net, sfamily, SOCK_STREAM,
95d2b9f693ff2a fs/smb/client/connect.c Kuniyuki Iwashima      2025-04-02  3=
354  				   IPPROTO_TCP, &server->ssocket, 1);
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
355  		if (rc < 0) {
afe6f65353b644 fs/cifs/connect.c       Ronnie Sahlberg        2019-08-28  3=
356  			cifs_server_dbg(VFS, "Error %d creating socket\n", rc);
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
357  			return rc;
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
358  		}
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
359 =20
95d2b9f693ff2a fs/smb/client/connect.c Kuniyuki Iwashima      2025-04-02 @3=
360  		sk =3D server->ssocket->sk;
95d2b9f693ff2a fs/smb/client/connect.c Kuniyuki Iwashima      2025-04-02  3=
361  		__netns_tracker_free(net, &sk->ns_tracker, false);
95d2b9f693ff2a fs/smb/client/connect.c Kuniyuki Iwashima      2025-04-02  3=
362  		sk->sk_net_refcnt =3D 1;
95d2b9f693ff2a fs/smb/client/connect.c Kuniyuki Iwashima      2025-04-02  3=
363  		get_net_track(net, &sk->ns_tracker, GFP_KERNEL);
95d2b9f693ff2a fs/smb/client/connect.c Kuniyuki Iwashima      2025-04-02  3=
364  		sock_inuse_add(net, 1);
ef7134c7fc48e1 fs/smb/client/connect.c Kuniyuki Iwashima      2024-11-02  3=
365 =20
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
366  		/* BB other socket options to set KEEPALIVE, NODELAY? */
f96637be081141 fs/cifs/connect.c       Joe Perches            2013-05-04  3=
367  		cifs_dbg(FYI, "Socket created\n");
f0b6a834a8f0d2 fs/smb/client/connect.c Paulo Alcantara        2023-06-19  3=
368  		socket =3D server->ssocket;
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
369  		socket->sk->sk_allocation =3D GFP_NOFS;
98123866fcf3fe fs/cifs/connect.c       Benjamin Coddington    2022-12-16  3=
370  		socket->sk->sk_use_task_frag =3D false;
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
371  		if (sfamily =3D=3D AF_INET6)
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
372  			cifs_reclassify_socket6(socket);
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
373  		else
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
374  			cifs_reclassify_socket4(socket);
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
375  	}
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
376 =20
3eb9a8893a76cf fs/cifs/connect.c       Ben Greear             2010-09-01  3=
377  	rc =3D bind_socket(server);
95d2b9f693ff2a fs/smb/client/connect.c Kuniyuki Iwashima      2025-04-02  3=
378  	if (rc < 0)
3eb9a8893a76cf fs/cifs/connect.c       Ben Greear             2010-09-01  3=
379  		return rc;
3eb9a8893a76cf fs/cifs/connect.c       Ben Greear             2010-09-01  3=
380 =20
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
381  	/*
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
382  	 * Eventually check for other socket options to change from
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
383  	 * the default. sock_setsockopt not used because it expects
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
384  	 * user space buffer
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
385  	 */
d5c5605c27c92d fs/cifs/connect.c       Jeff Layton            2008-12-01  3=
386  	socket->sk->sk_rcvtimeo =3D 7 * HZ;
da505c386c9f99 fs/cifs/connect.c       Steve French           2009-01-19  3=
387  	socket->sk->sk_sndtimeo =3D 5 * HZ;
6a5fa2362b628e fs/cifs/connect.c       Steve French           2010-01-01  3=
388 =20
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
389  	/* make the bufsizes depend on wsize/rsize and max requests */
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
390  	if (server->noautotune) {
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
391  		if (socket->sk->sk_sndbuf < (200 * 1024))
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
392  			socket->sk->sk_sndbuf =3D 200 * 1024;
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
393  		if (socket->sk->sk_rcvbuf < (140 * 1024))
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
394  			socket->sk->sk_rcvbuf =3D 140 * 1024;
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
395  	}
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
396 =20
12abc5ee7873a0 fs/cifs/connect.c       Christoph Hellwig      2020-05-28  3=
397  	if (server->tcp_nodelay)
12abc5ee7873a0 fs/cifs/connect.c       Christoph Hellwig      2020-05-28  3=
398  		tcp_sock_set_nodelay(socket->sk);
6a5fa2362b628e fs/cifs/connect.c       Steve French           2010-01-01  3=
399 =20
f96637be081141 fs/cifs/connect.c       Joe Perches            2013-05-04  3=
400  	cifs_dbg(FYI, "sndbuf %d rcvbuf %d rcvtimeo 0x%lx\n",
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
401  		 socket->sk->sk_sndbuf,
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
402  		 socket->sk->sk_rcvbuf, socket->sk->sk_rcvtimeo);
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
403 =20
cedc019b9f260f fs/smb/client/connect.c Jordan Rife            2023-10-03  3=
404  	rc =3D kernel_connect(socket, saddr, slen,
8eecd1c2e5bc73 fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-07-16  3=
405) 			    server->noblockcnt ? O_NONBLOCK : 0);
d532cc7efdfd7b fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3=
406) 	/*
d532cc7efdfd7b fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3=
407) 	 * When mounting SMB root file systems, we do not want to block in
d532cc7efdfd7b fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3=
408) 	 * connect. Otherwise bail out and then let cifs_reconnect() perform
d532cc7efdfd7b fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3=
409) 	 * reconnect failover - if possible.
d532cc7efdfd7b fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3=
410) 	 */
d532cc7efdfd7b fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-10-10  3=
411) 	if (server->noblockcnt && rc =3D=3D -EINPROGRESS)
8eecd1c2e5bc73 fs/cifs/connect.c       Paulo Alcantara (SUSE  2019-07-16  3=
412) 		rc =3D 0;
ee1b3ea9e6171d fs/cifs/connect.c       Jeff Layton            2011-06-21  3=
413  	if (rc < 0) {
f96637be081141 fs/cifs/connect.c       Joe Perches            2013-05-04  3=
414  		cifs_dbg(FYI, "Error %d connecting to server\n", rc);
d7171cd1acf70e fs/cifs/connect.c       Steve French           2021-11-04  3=
415  		trace_smb3_connect_err(server->hostname, server->conn_id, &server->d=
staddr, rc);
ee1b3ea9e6171d fs/cifs/connect.c       Jeff Layton            2011-06-21  3=
416  		sock_release(socket);
ee1b3ea9e6171d fs/cifs/connect.c       Jeff Layton            2011-06-21  3=
417  		server->ssocket =3D NULL;
ee1b3ea9e6171d fs/cifs/connect.c       Jeff Layton            2011-06-21  3=
418  		return rc;
ee1b3ea9e6171d fs/cifs/connect.c       Jeff Layton            2011-06-21  3=
419  	}
d7171cd1acf70e fs/cifs/connect.c       Steve French           2021-11-04  3=
420  	trace_smb3_connect_done(server->hostname, server->conn_id, &server->d=
staddr);
7d14dd683b1b00 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
27  3421 =20
7d14dd683b1b00 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
27  3422  	/*
7d14dd683b1b00 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
27  3423  	 * Establish RFC1001 NetBIOS session when it was explicitly requ=
ested
7d14dd683b1b00 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
27  3424  	 * by mount option -o nbsessinit, or when connecting to default =
RFC1001
7d14dd683b1b00 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
27  3425  	 * server port (139) and it was not explicitly disabled by mount=
 option
7d14dd683b1b00 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
27  3426  	 * -o nonbsessinit.
7d14dd683b1b00 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
27  3427  	 */
665e18794804f8 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
28  3428  	if (server->with_rfc1001 ||
665e18794804f8 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
28  3429  	    server->rfc1001_sessinit =3D=3D 1 ||
7d14dd683b1b00 fs/smb/client/connect.c Pali Roh=C3=A1r             2024-10-=
27  3430  	    (server->rfc1001_sessinit =3D=3D -1 && sport =3D=3D htons(RF=
C1001_PORT)))
a9f1b85e5ba805 fs/cifs/connect.c       Pavel Shilovsky        2010-12-13  3=
431  		rc =3D ip_rfc1001_connect(server);
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
432 =20
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
433  	return rc;
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
434  }
^1da177e4c3f41 fs/cifs/connect.c       Linus Torvalds         2005-04-16  3=
435 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
