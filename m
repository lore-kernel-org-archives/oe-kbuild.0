Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6B8149E16
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 05:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738992428; cv=none; b=laYjeVYLDAgPvuFNBkapIaRCopqRv/fZLDVGGc/+T9nRZdJa2P5IzIgEAngfp9RJpboaBVJ+vWUyuKREg2344fCou0VTdcY+zceTyu4hoftMt9p/JwGI8p1oqBWCERu1nQrCvQGmwtZk00005BE5NMhN7mxJQDnDoHGNoQ2e8zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738992428; c=relaxed/simple;
	bh=P5h1OnhNUrwjgxeWUzlnlh+fsAhpTAJJXMiO3nZRhec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UWPyv1qoZiCoUb5VySuHKsgKtG4spuqBLw/AwrwmHiZ1oDFog9UpoXQM4Zm5qv1NGHOf/3kXk73h3PCN9lf2cXz0S2PivToMrYzxrhzyHManKvPCg80LENz3LacQmDi3+9/c1KfFwrV3OKjfJvxVYOv6Fk55DI9WrZRYZO485yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvESfLT6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvESfLT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738992426; x=1770528426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P5h1OnhNUrwjgxeWUzlnlh+fsAhpTAJJXMiO3nZRhec=;
  b=MvESfLT60GH9kXnWee3VHqksJjTlN+7JMiFzjz1Eh+/TEHABGLEDAEBI
   tpdZwMARXCaIw4JyZGNmjkDJwUpoohK5Ttd2HDRNZKKvHVQaA0EUxapeL
   n4KIQNjukvEB7xrpNfq7TWeG1Rf8ukazQZ2CnJVqT9BhHHQsg2vg8Wch8
   KZdoNQA8A6VYtBRl376EXjnWERHJygRRFARd99B/TY6nGeu5ry8KMlogC
   VhxxdXjucKccvX+cA4BVPiiBK9SC6Ec8r46e3aOEKYJe3c+d52oizhN5h
   kv5jH4KhQ8QtJ+NRWyNDDqx6JpgXz6B+85S57a4rVLJVl2QFfXIDHYPeh
   Q==;
X-CSE-ConnectionGUID: YcmgM7PLRDu6ePWK+d7RWQ==
X-CSE-MsgGUID: X+DNDZMkS5SGcwjgemMssw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43299450"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="43299450"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 21:27:05 -0800
X-CSE-ConnectionGUID: szfl4CStSbGgeWSeQk8Yyg==
X-CSE-MsgGUID: ajZOUZzhQpqOQnpNaiZ6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116653921"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2025 21:27:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgdMr-000zZ5-32;
	Sat, 08 Feb 2025 05:27:01 +0000
Date: Sat, 8 Feb 2025 13:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis 15/24] net/ipv6/af_inet6.c:511
 inet6_cleanup_sock() error: uninitialized symbol 'opt'.
Message-ID: <202502081353.DjMlFh2p-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   851975056da0349bf975a5b389266691881d11ce
commit: aa981bfd4ebd5e150da60844c3b68823b94466d6 [15/24] rcu: Support Clang's capability analysis
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081353.DjMlFh2p-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502081353.DjMlFh2p-lkp@intel.com/

New smatch warnings:
net/ipv6/af_inet6.c:511 inet6_cleanup_sock() error: uninitialized symbol 'opt'.
include/net/sock.h:2133 sk_dst_set() error: uninitialized symbol 'old_dst'.
include/net/sock.h:2133 sk_dst_set() error: uninitialized symbol 'old_dst'.
net/ipv6/route.c:370 ip6_dst_destroy() error: uninitialized symbol 'from'.
net/ipv6/route.c:388 ip6_dst_ifdown() error: uninitialized symbol 'from'.
net/ipv6/route.c:1445 rt6_make_pcpu_route() error: uninitialized symbol 'from'.
include/net/sock.h:2133 sk_dst_set() error: uninitialized symbol 'old_dst'.
net/ipv6/ip6_fib.c:984 __fib6_drop_pcpu_from() error: uninitialized symbol 'from'.
net/core/gen_estimator.c:210 gen_kill_estimator() error: uninitialized symbol 'est'.
net/ipv4/tcp_fastopen.c:54 tcp_fastopen_ctx_destroy() error: uninitialized symbol 'ctxt'.
net/ipv4/tcp_fastopen.c:89 tcp_fastopen_reset_cipher() error: uninitialized symbol 'octx'.
include/net/sock.h:2133 sk_dst_set() error: uninitialized symbol 'old_dst'.
net/ipv4/udp.c:2483 udp_sk_rx_dst_set() error: uninitialized symbol 'old'.
drivers/dma-buf/dma-fence-chain.c:67 dma_fence_chain_walk() error: uninitialized symbol 'tmp'.
net/core/sock_diag.c:199 sock_diag_unregister_inet_compat() error: uninitialized symbol 'old'.

Old smatch warnings:
net/ipv4/route.c:599 fnhe_remove_oldest() error: uninitialized symbol 'oldest_p'.
net/ipv4/route.c:3590 sysctl_route_net_init() warn: (struct ctl_table)->procname cannot be NULL. Expression : tbl[0]->procname
net/ipv6/route.c:3422 ip6_route_check_nh() error: we previously assumed '_dev' could be null (see line 3382)
net/ipv6/route.c:5732 rt6_fill_node() error: we previously assumed 'dst' could be null (see line 5717)
net/ipv4/udp.c:2516 __udp4_lib_mcast_deliver() warn: potential spectre issue 'udptable->hash2' [r]
net/ipv4/udp.c:2756 __udp4_lib_mcast_demux_lookup() warn: potential spectre issue 'udptable->hash' [r]

vim +/opt +511 net/ipv6/af_inet6.c

7159039a128fa0 YOSHIFUJI Hideaki 2007-02-22  490  
1f8c4eeb945553 Kuniyuki Iwashima 2022-10-19  491  void inet6_cleanup_sock(struct sock *sk)
^1da177e4c3f41 Linus Torvalds    2005-04-16  492  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  493  	struct ipv6_pinfo *np = inet6_sk(sk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  494  	struct sk_buff *skb;
^1da177e4c3f41 Linus Torvalds    2005-04-16  495  	struct ipv6_txoptions *opt;
^1da177e4c3f41 Linus Torvalds    2005-04-16  496  
^1da177e4c3f41 Linus Torvalds    2005-04-16  497  	/* Release rx options */
^1da177e4c3f41 Linus Torvalds    2005-04-16  498  
647c0c70e8a44e Eldad Zack        2012-05-05  499  	skb = xchg(&np->pktoptions, NULL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  500  	kfree_skb(skb);
4b340ae20d0e23 Brian Haley       2010-04-23  501  
647c0c70e8a44e Eldad Zack        2012-05-05  502  	skb = xchg(&np->rxpmtu, NULL);
4b340ae20d0e23 Brian Haley       2010-04-23  503  	kfree_skb(skb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  504  
^1da177e4c3f41 Linus Torvalds    2005-04-16  505  	/* Free flowlabels */
^1da177e4c3f41 Linus Torvalds    2005-04-16  506  	fl6_free_socklist(sk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  507  
^1da177e4c3f41 Linus Torvalds    2005-04-16  508  	/* Free tx options */
^1da177e4c3f41 Linus Torvalds    2005-04-16  509  
b4cb4a1391dcdc Eric Dumazet      2024-06-04  510  	opt = unrcu_pointer(xchg(&np->opt, NULL));
45f6fad84cc305 Eric Dumazet      2015-11-29 @511  	if (opt) {
45f6fad84cc305 Eric Dumazet      2015-11-29  512  		atomic_sub(opt->tot_len, &sk->sk_omem_alloc);
45f6fad84cc305 Eric Dumazet      2015-11-29  513  		txopt_put(opt);
45f6fad84cc305 Eric Dumazet      2015-11-29  514  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  515  }
21985f43376cee Kuniyuki Iwashima 2022-10-06  516  EXPORT_SYMBOL_GPL(inet6_cleanup_sock);
21985f43376cee Kuniyuki Iwashima 2022-10-06  517  

:::::: The code at line 511 was first introduced by commit
:::::: 45f6fad84cc305103b28d73482b344d7f5b76f39 ipv6: add complete rcu protection around np->opt

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
