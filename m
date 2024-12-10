Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48153C17
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 18:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733855723; cv=none; b=SP8v8Fst1sObURByL/Gvj/9wbZTGAWoquhxgoVzSsLkme2+RSyCSAKsVa+otQawTP/L6G1HqcDczTVmFm7y/JBFZLi6TcHkQwPp8jTZSAB2yOym/0xEU6BYuCd6FWJhrAie4cP3ZcWSRt6U7Zne8CAvwD89BSevO7aX1WPcRP1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733855723; c=relaxed/simple;
	bh=uuvJnHWPHMPl5TDIChz/QYXQp3a7w8we5GCMXqvkr/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZwHp0sBHul1CQ2+wDZr9vEfCofwXhwqwNTFO4+iDJN/tmZ7vnMcwaBh8LG9egqFEebrgD7TTGX8hPLutMHWuwbUDZV0eMezCtp+jMPNPm6MouQ/49WWaN7MfyOfigEpxz1hLmj4fXSrenreWqDXvzNfhVi5iZx+gclHgdqrbZ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqDuIPT2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqDuIPT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733855721; x=1765391721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uuvJnHWPHMPl5TDIChz/QYXQp3a7w8we5GCMXqvkr/w=;
  b=SqDuIPT22+71pza/Nr4rFHsVGdPoC4r479pjTyECRbV61TfIDCR3E76v
   wp80yy3dSqpeXq+MkmUV8Jm2LlBMLBRRWohZMzzGm4+qXIuY2nMXO0xL+
   z6Fv8qmn9iNFZ+SzhQe3r7JyYu/jYuY+T1DSOVxVCxN3vTvO9E+KX8Vpw
   HsW1KCfFjKeC2J8G8enammqHmLCEVsnUPqjOFZvIpHYJmofcSCYAFfdiE
   qrZ4zCXt4ClxsheNQXP52xO2kGrsJqoEp0nNESFb+rJn4u0lNGRO2Z9FU
   zdwFO1DULdpUDdCSncp0pOFBjCNEZ0DJB+JeaakUTlanvTyCzbw8Zh9+M
   A==;
X-CSE-ConnectionGUID: aC4LBVGcT5uvfG4X3TcSIw==
X-CSE-MsgGUID: W8mdqZ35T8qHy0bI6Hr9qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37901789"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="37901789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 10:35:20 -0800
X-CSE-ConnectionGUID: H/GCobyeSxO5QqDgYyaROw==
X-CSE-MsgGUID: DIH3VAAVT5GOMOtKIs7jZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="95321241"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 10:35:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL54l-0005r7-36;
	Tue, 10 Dec 2024 18:35:15 +0000
Date: Wed, 11 Dec 2024 02:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 2/2] datagram, udp: Set local address and rehash
 socket atomically against lookup
Message-ID: <202412110238.YqquWDMw-lkp@intel.com>
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
In-Reply-To: <20241204221254.3537932-3-sbrivio@redhat.com>
References: <20241204221254.3537932-3-sbrivio@redhat.com>
TO: Stefano Brivio <sbrivio@redhat.com>
TO: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: netdev@vger.kernel.org
CC: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: Mike Manning <mvrmanning@gmail.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Paul Holzinger <pholzing@redhat.com>
CC: Philo Lu <lulie@linux.alibaba.com>
CC: Cambda Zhu <cambda@linux.alibaba.com>
CC: Fred Chen <fred.cc@alibaba-inc.com>
CC: Yubing Qiu <yubing.qiuyubing@alibaba-inc.com>

Hi Stefano,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefano-Brivio/datagram-Rehash-sockets-only-if-local-address-changed-for-their-family/20241205-062005
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241204221254.3537932-3-sbrivio%40redhat.com
patch subject: [PATCH net-next 2/2] datagram, udp: Set local address and rehash socket atomically against lookup
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: sparc64-randconfig-r072-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110238.YqquWDMw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412110238.YqquWDMw-lkp@intel.com/

New smatch warnings:
net/ipv4/udp.c:2248 udp_lib_set_rcv_saddr() error: uninitialized symbol 'hslot'.

Old smatch warnings:
net/ipv4/udp.c:2488 __udp4_lib_mcast_deliver() warn: potential spectre issue 'udptable->hash2' [r]
net/ipv4/udp.c:2728 __udp4_lib_mcast_demux_lookup() warn: potential spectre issue 'udptable->hash' [r]

vim +/hslot +2248 net/ipv4/udp.c

645ca708f936b2f Eric Dumazet      2008-10-29  2181  
ab240d39ed91dae Stefano Brivio    2024-12-04  2182  /**
ab240d39ed91dae Stefano Brivio    2024-12-04  2183   * udp_lib_set_rcv_saddr() - Set local address and rehash socket atomically
ab240d39ed91dae Stefano Brivio    2024-12-04  2184   * @sk:		Socket changing local address
ab240d39ed91dae Stefano Brivio    2024-12-04  2185   * @addr:	New address, __be32 * or struct in6_addr * depending on family
ab240d39ed91dae Stefano Brivio    2024-12-04  2186   * @hash:	New secondary hash (local port and address) for socket
ab240d39ed91dae Stefano Brivio    2024-12-04  2187   * @hash4:	New 4-tuple hash (local/remote port and address) for socket
ab240d39ed91dae Stefano Brivio    2024-12-04  2188   *
ab240d39ed91dae Stefano Brivio    2024-12-04  2189   * Set local address for socket and rehash it while holding a spinlock on the
ab240d39ed91dae Stefano Brivio    2024-12-04  2190   * primary hash chain (port only). This needs to be atomic to avoid that a
ab240d39ed91dae Stefano Brivio    2024-12-04  2191   * concurrent lookup misses a socket while it's being connected or disconnected.
719f835853a92f6 Eric Dumazet      2010-09-08  2192   */
ab240d39ed91dae Stefano Brivio    2024-12-04  2193  void udp_lib_set_rcv_saddr(struct sock *sk, void *addr, u16 hash, u16 hash4)
719f835853a92f6 Eric Dumazet      2010-09-08  2194  {
ab240d39ed91dae Stefano Brivio    2024-12-04  2195  	struct udp_hslot *hslot;
ab240d39ed91dae Stefano Brivio    2024-12-04  2196  
719f835853a92f6 Eric Dumazet      2010-09-08  2197  	if (sk_hashed(sk)) {
67fb43308f4b354 Kuniyuki Iwashima 2022-11-14  2198  		struct udp_table *udptable = udp_get_table_prot(sk);
ab240d39ed91dae Stefano Brivio    2024-12-04  2199  		struct udp_hslot *hslot2, *nhslot2;
719f835853a92f6 Eric Dumazet      2010-09-08  2200  
719f835853a92f6 Eric Dumazet      2010-09-08  2201  		hslot2 = udp_hashslot2(udptable, udp_sk(sk)->udp_portaddr_hash);
ab240d39ed91dae Stefano Brivio    2024-12-04  2202  		nhslot2 = udp_hashslot2(udptable, hash);
e32ea7e747271a0 Craig Gallek      2016-01-04  2203  
719f835853a92f6 Eric Dumazet      2010-09-08  2204  		hslot = udp_hashslot(udptable, sock_net(sk),
719f835853a92f6 Eric Dumazet      2010-09-08  2205  				     udp_sk(sk)->udp_port_hash);
ab240d39ed91dae Stefano Brivio    2024-12-04  2206  
719f835853a92f6 Eric Dumazet      2010-09-08  2207  		spin_lock_bh(&hslot->lock);
ab240d39ed91dae Stefano Brivio    2024-12-04  2208  
ab240d39ed91dae Stefano Brivio    2024-12-04  2209  		udp_sk(sk)->udp_portaddr_hash = hash;
ab240d39ed91dae Stefano Brivio    2024-12-04  2210  
ab240d39ed91dae Stefano Brivio    2024-12-04  2211  		if (hslot2 != nhslot2 ||
ab240d39ed91dae Stefano Brivio    2024-12-04  2212  		    rcu_access_pointer(sk->sk_reuseport_cb)) {
e32ea7e747271a0 Craig Gallek      2016-01-04  2213  			if (rcu_access_pointer(sk->sk_reuseport_cb))
e32ea7e747271a0 Craig Gallek      2016-01-04  2214  				reuseport_detach_sock(sk);
719f835853a92f6 Eric Dumazet      2010-09-08  2215  
e32ea7e747271a0 Craig Gallek      2016-01-04  2216  			if (hslot2 != nhslot2) {
719f835853a92f6 Eric Dumazet      2010-09-08  2217  				spin_lock(&hslot2->lock);
ca065d0cf80fa54 Eric Dumazet      2016-04-01  2218  				hlist_del_init_rcu(&udp_sk(sk)->udp_portaddr_node);
719f835853a92f6 Eric Dumazet      2010-09-08  2219  				hslot2->count--;
719f835853a92f6 Eric Dumazet      2010-09-08  2220  				spin_unlock(&hslot2->lock);
719f835853a92f6 Eric Dumazet      2010-09-08  2221  
719f835853a92f6 Eric Dumazet      2010-09-08  2222  				spin_lock(&nhslot2->lock);
ca065d0cf80fa54 Eric Dumazet      2016-04-01  2223  				hlist_add_head_rcu(&udp_sk(sk)->udp_portaddr_node,
719f835853a92f6 Eric Dumazet      2010-09-08  2224  							 &nhslot2->head);
719f835853a92f6 Eric Dumazet      2010-09-08  2225  				nhslot2->count++;
719f835853a92f6 Eric Dumazet      2010-09-08  2226  				spin_unlock(&nhslot2->lock);
e32ea7e747271a0 Craig Gallek      2016-01-04  2227  			}
719f835853a92f6 Eric Dumazet      2010-09-08  2228  
78c91ae2c6deb5d Philo Lu          2024-11-14  2229  			if (udp_hashed4(sk)) {
ab240d39ed91dae Stefano Brivio    2024-12-04  2230  				udp_rehash4(udptable, sk, hash4);
78c91ae2c6deb5d Philo Lu          2024-11-14  2231  
78c91ae2c6deb5d Philo Lu          2024-11-14  2232  				if (hslot2 != nhslot2) {
78c91ae2c6deb5d Philo Lu          2024-11-14  2233  					spin_lock(&hslot2->lock);
78c91ae2c6deb5d Philo Lu          2024-11-14  2234  					udp_hash4_dec(hslot2);
78c91ae2c6deb5d Philo Lu          2024-11-14  2235  					spin_unlock(&hslot2->lock);
78c91ae2c6deb5d Philo Lu          2024-11-14  2236  
78c91ae2c6deb5d Philo Lu          2024-11-14  2237  					spin_lock(&nhslot2->lock);
78c91ae2c6deb5d Philo Lu          2024-11-14  2238  					udp_hash4_inc(nhslot2);
78c91ae2c6deb5d Philo Lu          2024-11-14  2239  					spin_unlock(&nhslot2->lock);
78c91ae2c6deb5d Philo Lu          2024-11-14  2240  				}
78c91ae2c6deb5d Philo Lu          2024-11-14  2241  			}
719f835853a92f6 Eric Dumazet      2010-09-08  2242  		}
719f835853a92f6 Eric Dumazet      2010-09-08  2243  	}
ab240d39ed91dae Stefano Brivio    2024-12-04  2244  
ab240d39ed91dae Stefano Brivio    2024-12-04  2245  	inet_update_saddr(sk, addr, sk->sk_family);
ab240d39ed91dae Stefano Brivio    2024-12-04  2246  
ab240d39ed91dae Stefano Brivio    2024-12-04  2247  	if (sk_hashed(sk))
ab240d39ed91dae Stefano Brivio    2024-12-04 @2248  		spin_unlock_bh(&hslot->lock);
719f835853a92f6 Eric Dumazet      2010-09-08  2249  }
ab240d39ed91dae Stefano Brivio    2024-12-04  2250  EXPORT_SYMBOL(udp_lib_set_rcv_saddr);
719f835853a92f6 Eric Dumazet      2010-09-08  2251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
