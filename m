Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816719C566
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 04:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738989906; cv=none; b=hHNEdMpfN7qqpT7LMZpjlU11jtJ3Xt2RpsyrDUP2TtlfNicGlE0ZJmX2QBuPFDmIBKhEhR1Q93DtFwo2h3ZR68S415L9twaFzPRK9MvPNLEKQ5ozheJY7uBfkiWWCG5B9aiQJPvQy62uhhSujhllEO3l5nQrAFTy9IyqLpyR07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738989906; c=relaxed/simple;
	bh=p0o9Q0/G4k/0vXXU/ezy49eZAJGyLTpZZX5VP5Ua4u8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bntod7XjloHx+UfgADSwOc/VsbfCN9FTJv5VSyFWXe4Am2kymjZWhxNtkAmBNZegco+PN+o/1IH6i/3lUMISq7AB/HfPByWyV4Jo6zMAHNdyTP6fdRQCxuzwHHnewfAaWNSvMTguhNBv5TiXmXjCtViRQbxbANf6bZ4AK1FxqUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHgGIBf5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHgGIBf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738989905; x=1770525905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p0o9Q0/G4k/0vXXU/ezy49eZAJGyLTpZZX5VP5Ua4u8=;
  b=nHgGIBf5ezTbZmkkcW3ulJGHhmAFhoY+T++JVAfjZVHbAbPkFHVg5P2Y
   dWAH2Xx+8fgzoQPvt1CIBu+pXUqVGEBR96Sn9w9pCY4rNnx9xr8P3g2Zl
   85BuxqBY1IZof1K627SpfzNJW3Ol4OOBgwGTKpPRGUpV2Ho/TJKJAx9gU
   oxI1mwIJ4jph1r8N2ZS7YeWvZ7PkG7OP3WaDXWokmpsocZnBZ4nrjfbB0
   vdC7jZrqyKi7ewnE1NbTKKiAZFWdYwvMPkpb7EFDkU0ia3PioEqml6ciw
   zcP0ynamxiYFtT0iNGEQXZvGCZqmeckDxWXxiIU7jyAAgqtqcJN0/9vvU
   Q==;
X-CSE-ConnectionGUID: jg12XGYvRvq7TckvyhAueQ==
X-CSE-MsgGUID: 8yFHXb1FRxGqyM5Z6gIFDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43401133"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="43401133"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 20:45:02 -0800
X-CSE-ConnectionGUID: y9Ak9MCNTUybrSJSyTXKEQ==
X-CSE-MsgGUID: 1XZXyKxPStWxAAU+fae+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116646894"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2025 20:45:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgci9-000zXJ-39;
	Sat, 08 Feb 2025 04:44:57 +0000
Date: Sat, 8 Feb 2025 12:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 4/7] ipv4: remove get_rttos
Message-ID: <202502081210.DN5Un7Vb-lkp@intel.com>
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
In-Reply-To: <20250206193521.2285488-5-willemdebruijn.kernel@gmail.com>
References: <20250206193521.2285488-5-willemdebruijn.kernel@gmail.com>
TO: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
TO: netdev@vger.kernel.org
CC: davem@davemloft.net
CC: kuba@kernel.org
CC: edumazet@google.com
CC: pabeni@redhat.com
CC: Willem de Bruijn <willemb@google.com>

Hi Willem,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Willem-de-Bruijn/tcp-only-initialize-sockcm-tsflags-field/20250207-033912
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250206193521.2285488-5-willemdebruijn.kernel%40gmail.com
patch subject: [PATCH net-next 4/7] ipv4: remove get_rttos
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-141-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081210.DN5Un7Vb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502081210.DN5Un7Vb-lkp@intel.com/

New smatch warnings:
net/ipv4/raw.c:608 raw_sendmsg() error: uninitialized symbol 'tos'.
net/ipv4/udp.c:1444 udp_sendmsg() error: uninitialized symbol 'tos'.
net/ipv4/ping.c:781 ping_v4_sendmsg() error: uninitialized symbol 'tos'.

Old smatch warnings:
net/ipv4/udp.c:2515 __udp4_lib_mcast_deliver() warn: potential spectre issue 'udptable->hash2' [r]
net/ipv4/udp.c:2755 __udp4_lib_mcast_demux_lookup() warn: potential spectre issue 'udptable->hash' [r]

vim +/tos +608 net/ipv4/raw.c

c008ba5bdc9fa8 Herbert Xu            2014-11-07  481  
1b784140474e4f Ying Xue              2015-03-02  482  static int raw_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
^1da177e4c3f41 Linus Torvalds        2005-04-16  483  {
^1da177e4c3f41 Linus Torvalds        2005-04-16  484  	struct inet_sock *inet = inet_sk(sk);
bb191c3e874650 David Ahern           2015-10-05  485  	struct net *net = sock_net(sk);
^1da177e4c3f41 Linus Torvalds        2005-04-16  486  	struct ipcm_cookie ipc;
^1da177e4c3f41 Linus Torvalds        2005-04-16  487  	struct rtable *rt = NULL;
77968b78242ee2 David S. Miller       2011-05-08  488  	struct flowi4 fl4;
c85be08fc4fa44 Guillaume Nault       2023-05-22  489  	u8 tos, scope;
^1da177e4c3f41 Linus Torvalds        2005-04-16  490  	int free = 0;
3ca3c68e76686b Al Viro               2006-09-27  491  	__be32 daddr;
c1d18f9fa09489 Al Viro               2006-09-27  492  	__be32 saddr;
959d5c11601b2b Eric Dumazet          2023-09-22  493  	int uc_index, err;
f6d8bd051c391c Eric Dumazet          2011-04-21  494  	struct ip_options_data opt_copy;
c008ba5bdc9fa8 Herbert Xu            2014-11-07  495  	struct raw_frag_vec rfv;
8f659a03a0ba92 Mohamed Ghannam       2017-12-10  496  	int hdrincl;
^1da177e4c3f41 Linus Torvalds        2005-04-16  497  
^1da177e4c3f41 Linus Torvalds        2005-04-16  498  	err = -EMSGSIZE;
926d4b8122fb32 Jesper Juhl           2005-06-18  499  	if (len > 0xFFFF)
^1da177e4c3f41 Linus Torvalds        2005-04-16  500  		goto out;
^1da177e4c3f41 Linus Torvalds        2005-04-16  501  
cafbe182a467bf Eric Dumazet          2023-08-16  502  	hdrincl = inet_test_bit(HDRINCL, sk);
cafbe182a467bf Eric Dumazet          2023-08-16  503  
^1da177e4c3f41 Linus Torvalds        2005-04-16  504  	/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  505  	 *	Check the flags.
^1da177e4c3f41 Linus Torvalds        2005-04-16  506  	 */
^1da177e4c3f41 Linus Torvalds        2005-04-16  507  
^1da177e4c3f41 Linus Torvalds        2005-04-16  508  	err = -EOPNOTSUPP;
^1da177e4c3f41 Linus Torvalds        2005-04-16  509  	if (msg->msg_flags & MSG_OOB)	/* Mirror BSD error message */
^1da177e4c3f41 Linus Torvalds        2005-04-16  510  		goto out;               /* compatibility */
^1da177e4c3f41 Linus Torvalds        2005-04-16  511  
^1da177e4c3f41 Linus Torvalds        2005-04-16  512  	/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  513  	 *	Get and verify the address.
^1da177e4c3f41 Linus Torvalds        2005-04-16  514  	 */
^1da177e4c3f41 Linus Torvalds        2005-04-16  515  
^1da177e4c3f41 Linus Torvalds        2005-04-16  516  	if (msg->msg_namelen) {
342dfc306fb321 Steffen Hurrle        2014-01-17  517  		DECLARE_SOCKADDR(struct sockaddr_in *, usin, msg->msg_name);
^1da177e4c3f41 Linus Torvalds        2005-04-16  518  		err = -EINVAL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  519  		if (msg->msg_namelen < sizeof(*usin))
^1da177e4c3f41 Linus Torvalds        2005-04-16  520  			goto out;
^1da177e4c3f41 Linus Torvalds        2005-04-16  521  		if (usin->sin_family != AF_INET) {
058bd4d2a4ff0a Joe Perches           2012-03-11  522  			pr_info_once("%s: %s forgot to set AF_INET. Fix it!\n",
058bd4d2a4ff0a Joe Perches           2012-03-11  523  				     __func__, current->comm);
^1da177e4c3f41 Linus Torvalds        2005-04-16  524  			err = -EAFNOSUPPORT;
^1da177e4c3f41 Linus Torvalds        2005-04-16  525  			if (usin->sin_family)
^1da177e4c3f41 Linus Torvalds        2005-04-16  526  				goto out;
^1da177e4c3f41 Linus Torvalds        2005-04-16  527  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  528  		daddr = usin->sin_addr.s_addr;
^1da177e4c3f41 Linus Torvalds        2005-04-16  529  		/* ANK: I did not forget to get protocol from port field.
^1da177e4c3f41 Linus Torvalds        2005-04-16  530  		 * I just do not know, who uses this weirdness.
^1da177e4c3f41 Linus Torvalds        2005-04-16  531  		 * IP_HDRINCL is much more convenient.
^1da177e4c3f41 Linus Torvalds        2005-04-16  532  		 */
^1da177e4c3f41 Linus Torvalds        2005-04-16  533  	} else {
^1da177e4c3f41 Linus Torvalds        2005-04-16  534  		err = -EDESTADDRREQ;
^1da177e4c3f41 Linus Torvalds        2005-04-16  535  		if (sk->sk_state != TCP_ESTABLISHED)
^1da177e4c3f41 Linus Torvalds        2005-04-16  536  			goto out;
c720c7e8383aff Eric Dumazet          2009-10-15  537  		daddr = inet->inet_daddr;
^1da177e4c3f41 Linus Torvalds        2005-04-16  538  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  539  
351782067b6be8 Willem de Bruijn      2018-07-06  540  	ipcm_init_sk(&ipc, inet);
3632679d9e4f87 Nicolas Dichtel       2023-05-22  541  	/* Keep backward compat */
3632679d9e4f87 Nicolas Dichtel       2023-05-22  542  	if (hdrincl)
3632679d9e4f87 Nicolas Dichtel       2023-05-22  543  		ipc.protocol = IPPROTO_RAW;
^1da177e4c3f41 Linus Torvalds        2005-04-16  544  
^1da177e4c3f41 Linus Torvalds        2005-04-16  545  	if (msg->msg_controllen) {
24025c465f77c3 Soheil Hassas Yeganeh 2016-04-02  546  		err = ip_cmsg_send(sk, msg, &ipc, false);
919483096bfe75 Eric Dumazet          2016-02-04  547  		if (unlikely(err)) {
919483096bfe75 Eric Dumazet          2016-02-04  548  			kfree(ipc.opt);
^1da177e4c3f41 Linus Torvalds        2005-04-16  549  			goto out;
919483096bfe75 Eric Dumazet          2016-02-04  550  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  551  		if (ipc.opt)
^1da177e4c3f41 Linus Torvalds        2005-04-16  552  			free = 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16  553  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  554  
^1da177e4c3f41 Linus Torvalds        2005-04-16  555  	saddr = ipc.addr;
^1da177e4c3f41 Linus Torvalds        2005-04-16  556  	ipc.addr = daddr;
^1da177e4c3f41 Linus Torvalds        2005-04-16  557  
f6d8bd051c391c Eric Dumazet          2011-04-21  558  	if (!ipc.opt) {
f6d8bd051c391c Eric Dumazet          2011-04-21  559  		struct ip_options_rcu *inet_opt;
f6d8bd051c391c Eric Dumazet          2011-04-21  560  
f6d8bd051c391c Eric Dumazet          2011-04-21  561  		rcu_read_lock();
f6d8bd051c391c Eric Dumazet          2011-04-21  562  		inet_opt = rcu_dereference(inet->inet_opt);
f6d8bd051c391c Eric Dumazet          2011-04-21  563  		if (inet_opt) {
f6d8bd051c391c Eric Dumazet          2011-04-21  564  			memcpy(&opt_copy, inet_opt,
f6d8bd051c391c Eric Dumazet          2011-04-21  565  			       sizeof(*inet_opt) + inet_opt->opt.optlen);
f6d8bd051c391c Eric Dumazet          2011-04-21  566  			ipc.opt = &opt_copy.opt;
f6d8bd051c391c Eric Dumazet          2011-04-21  567  		}
f6d8bd051c391c Eric Dumazet          2011-04-21  568  		rcu_read_unlock();
f6d8bd051c391c Eric Dumazet          2011-04-21  569  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  570  
^1da177e4c3f41 Linus Torvalds        2005-04-16  571  	if (ipc.opt) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  572  		err = -EINVAL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  573  		/* Linux does not mangle headers on raw sockets,
^1da177e4c3f41 Linus Torvalds        2005-04-16  574  		 * so that IP options + IP_HDRINCL is non-sense.
^1da177e4c3f41 Linus Torvalds        2005-04-16  575  		 */
8f659a03a0ba92 Mohamed Ghannam       2017-12-10  576  		if (hdrincl)
^1da177e4c3f41 Linus Torvalds        2005-04-16  577  			goto done;
f6d8bd051c391c Eric Dumazet          2011-04-21  578  		if (ipc.opt->opt.srr) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  579  			if (!daddr)
^1da177e4c3f41 Linus Torvalds        2005-04-16  580  				goto done;
f6d8bd051c391c Eric Dumazet          2011-04-21  581  			daddr = ipc.opt->opt.faddr;
^1da177e4c3f41 Linus Torvalds        2005-04-16  582  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  583  	}
c85be08fc4fa44 Guillaume Nault       2023-05-22  584  	scope = ip_sendmsg_scope(inet, &ipc, msg);
^1da177e4c3f41 Linus Torvalds        2005-04-16  585  
959d5c11601b2b Eric Dumazet          2023-09-22  586  	uc_index = READ_ONCE(inet->uc_index);
f97c1e0c6ebdb6 Joe Perches           2007-12-16  587  	if (ipv4_is_multicast(daddr)) {
854da991733d1b Robert Shearman       2018-10-01  588  		if (!ipc.oif || netif_index_is_l3_master(sock_net(sk), ipc.oif))
02715925222c13 Eric Dumazet          2023-09-22  589  			ipc.oif = READ_ONCE(inet->mc_index);
^1da177e4c3f41 Linus Torvalds        2005-04-16  590  		if (!saddr)
02715925222c13 Eric Dumazet          2023-09-22  591  			saddr = READ_ONCE(inet->mc_addr);
9515a2e082f914 David Ahern           2018-01-24  592  	} else if (!ipc.oif) {
959d5c11601b2b Eric Dumazet          2023-09-22  593  		ipc.oif = uc_index;
959d5c11601b2b Eric Dumazet          2023-09-22  594  	} else if (ipv4_is_lbcast(daddr) && uc_index) {
645f08975f4944 Miaohe Lin            2020-08-27  595  		/* oif is set, packet is to local broadcast
9515a2e082f914 David Ahern           2018-01-24  596  		 * and uc_index is set. oif is most likely set
9515a2e082f914 David Ahern           2018-01-24  597  		 * by sk_bound_dev_if. If uc_index != oif check if the
9515a2e082f914 David Ahern           2018-01-24  598  		 * oif is an L3 master and uc_index is an L3 slave.
9515a2e082f914 David Ahern           2018-01-24  599  		 * If so, we want to allow the send using the uc_index.
9515a2e082f914 David Ahern           2018-01-24  600  		 */
959d5c11601b2b Eric Dumazet          2023-09-22  601  		if (ipc.oif != uc_index &&
9515a2e082f914 David Ahern           2018-01-24  602  		    ipc.oif == l3mdev_master_ifindex_by_index(sock_net(sk),
959d5c11601b2b Eric Dumazet          2023-09-22  603  							      uc_index)) {
959d5c11601b2b Eric Dumazet          2023-09-22  604  			ipc.oif = uc_index;
9515a2e082f914 David Ahern           2018-01-24  605  		}
9515a2e082f914 David Ahern           2018-01-24  606  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  607  
c85be08fc4fa44 Guillaume Nault       2023-05-22 @608  	flowi4_init_output(&fl4, ipc.oif, ipc.sockc.mark, tos, scope,
3632679d9e4f87 Nicolas Dichtel       2023-05-22  609  			   hdrincl ? ipc.protocol : sk->sk_protocol,
0e0d44ab427554 Steffen Klassert      2013-08-28  610  			   inet_sk_flowi_flags(sk) |
8f659a03a0ba92 Mohamed Ghannam       2017-12-10  611  			    (hdrincl ? FLOWI_FLAG_KNOWN_NH : 0),
e2d118a1cb5e60 Lorenzo Colitti       2016-11-04  612  			   daddr, saddr, 0, 0, sk->sk_uid);
ef164ae3563bf4 David S. Miller       2011-03-31  613  
fc1092f5156727 Shigeru Yoshida       2024-04-30  614  	fl4.fl4_icmp_type = 0;
fc1092f5156727 Shigeru Yoshida       2024-04-30  615  	fl4.fl4_icmp_code = 0;
fc1092f5156727 Shigeru Yoshida       2024-04-30  616  
8f659a03a0ba92 Mohamed Ghannam       2017-12-10  617  	if (!hdrincl) {
b61e9dcc5e77d5 Al Viro               2014-11-24  618  		rfv.msg = msg;
c008ba5bdc9fa8 Herbert Xu            2014-11-07  619  		rfv.hlen = 0;
c008ba5bdc9fa8 Herbert Xu            2014-11-07  620  
c008ba5bdc9fa8 Herbert Xu            2014-11-07  621  		err = raw_probe_proto_opt(&rfv, &fl4);
a27b58fed90cc5 Heiko Carstens        2006-10-30  622  		if (err)
a27b58fed90cc5 Heiko Carstens        2006-10-30  623  			goto done;
a27b58fed90cc5 Heiko Carstens        2006-10-30  624  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  625  
3df98d79215ace Paul Moore            2020-09-27  626  	security_sk_classify_flow(sk, flowi4_to_flowi_common(&fl4));
bb191c3e874650 David Ahern           2015-10-05  627  	rt = ip_route_output_flow(net, &fl4, sk);
b23dd4fe42b455 David S. Miller       2011-03-02  628  	if (IS_ERR(rt)) {
b23dd4fe42b455 David S. Miller       2011-03-02  629  		err = PTR_ERR(rt);
4910ac6c526d28 David S. Miller       2011-03-28  630  		rt = NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  631  		goto done;
b23dd4fe42b455 David S. Miller       2011-03-02  632  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  633  
^1da177e4c3f41 Linus Torvalds        2005-04-16  634  	err = -EACCES;
^1da177e4c3f41 Linus Torvalds        2005-04-16  635  	if (rt->rt_flags & RTCF_BROADCAST && !sock_flag(sk, SOCK_BROADCAST))
^1da177e4c3f41 Linus Torvalds        2005-04-16  636  		goto done;
^1da177e4c3f41 Linus Torvalds        2005-04-16  637  
^1da177e4c3f41 Linus Torvalds        2005-04-16  638  	if (msg->msg_flags & MSG_CONFIRM)
^1da177e4c3f41 Linus Torvalds        2005-04-16  639  		goto do_confirm;
^1da177e4c3f41 Linus Torvalds        2005-04-16  640  back_from_confirm:
^1da177e4c3f41 Linus Torvalds        2005-04-16  641  
8f659a03a0ba92 Mohamed Ghannam       2017-12-10  642  	if (hdrincl)
7ae9abfd9d6f32 Al Viro               2014-11-27  643  		err = raw_send_hdrinc(sk, &fl4, msg, len,
c14ac9451c3483 Soheil Hassas Yeganeh 2016-04-02  644  				      &rt, msg->msg_flags, &ipc.sockc);
^1da177e4c3f41 Linus Torvalds        2005-04-16  645  
^1da177e4c3f41 Linus Torvalds        2005-04-16  646  	 else {
^1da177e4c3f41 Linus Torvalds        2005-04-16  647  		if (!ipc.addr)
77968b78242ee2 David S. Miller       2011-05-08  648  			ipc.addr = fl4.daddr;
^1da177e4c3f41 Linus Torvalds        2005-04-16  649  		lock_sock(sk);
c008ba5bdc9fa8 Herbert Xu            2014-11-07  650  		err = ip_append_data(sk, &fl4, raw_getfrag,
c008ba5bdc9fa8 Herbert Xu            2014-11-07  651  				     &rfv, len, 0,
2e77d89b2fa8e3 Eric Dumazet          2008-11-24  652  				     &ipc, &rt, msg->msg_flags);
^1da177e4c3f41 Linus Torvalds        2005-04-16  653  		if (err)
^1da177e4c3f41 Linus Torvalds        2005-04-16  654  			ip_flush_pending_frames(sk);
6ce9e7b5fe3195 Eric Dumazet          2009-09-02  655  		else if (!(msg->msg_flags & MSG_MORE)) {
77968b78242ee2 David S. Miller       2011-05-08  656  			err = ip_push_pending_frames(sk, &fl4);
6b5f43ea08150e Eric Dumazet          2023-08-16  657  			if (err == -ENOBUFS && !inet_test_bit(RECVERR, sk))
6ce9e7b5fe3195 Eric Dumazet          2009-09-02  658  				err = 0;
6ce9e7b5fe3195 Eric Dumazet          2009-09-02  659  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  660  		release_sock(sk);
^1da177e4c3f41 Linus Torvalds        2005-04-16  661  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  662  done:
^1da177e4c3f41 Linus Torvalds        2005-04-16  663  	if (free)
^1da177e4c3f41 Linus Torvalds        2005-04-16  664  		kfree(ipc.opt);
^1da177e4c3f41 Linus Torvalds        2005-04-16  665  	ip_rt_put(rt);
^1da177e4c3f41 Linus Torvalds        2005-04-16  666  
5418c6926fcb0e Jesper Juhl           2005-06-18  667  out:
5418c6926fcb0e Jesper Juhl           2005-06-18  668  	if (err < 0)
5418c6926fcb0e Jesper Juhl           2005-06-18  669  		return err;
5418c6926fcb0e Jesper Juhl           2005-06-18  670  	return len;
^1da177e4c3f41 Linus Torvalds        2005-04-16  671  
^1da177e4c3f41 Linus Torvalds        2005-04-16  672  do_confirm:
0dec879f636f11 Julian Anastasov      2017-02-06  673  	if (msg->msg_flags & MSG_PROBE)
0dec879f636f11 Julian Anastasov      2017-02-06  674  		dst_confirm_neigh(&rt->dst, &fl4.daddr);
^1da177e4c3f41 Linus Torvalds        2005-04-16  675  	if (!(msg->msg_flags & MSG_PROBE) || len)
^1da177e4c3f41 Linus Torvalds        2005-04-16  676  		goto back_from_confirm;
^1da177e4c3f41 Linus Torvalds        2005-04-16  677  	err = 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  678  	goto done;
^1da177e4c3f41 Linus Torvalds        2005-04-16  679  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  680  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
