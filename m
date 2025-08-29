Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5BC30BB96
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Aug 2025 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463595; cv=none; b=d7lkB4WFdvCmWJ/samrT+d0WUg7YJINl/WJZ9iU8w3crWA0P64s6ZzQa1Wlk4btR0AF45NhumkQyzatQcdFJ/Xb0BDCz4MzrWxKiUYgLaPaJjpBfCyuzTik3A4dmhJvPxwgS3KL5QRsz5aUDOJPvX2j3tSBdy7pPC1IFEmpRTKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463595; c=relaxed/simple;
	bh=ctaGdgZ5L094lIbENnlKAVgYch6UElQkBA4MSpZq5TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bK35lJ44VgVL4O/Yq/zE6wgrYN/No/EaE964jGoyk+RGD68f3Kg5EjDAKDUVzHMKA25/V5QyhD2YknLHH8xJCCsjbC/LhULvGB45Ckz+89iPQd14D0ltX6cJGcR/mWwVU9pwBwYlfYqjW3N35bWLA8ue2f6hwTrdli94zZDGCZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ON5voSaK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ON5voSaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756463593; x=1787999593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctaGdgZ5L094lIbENnlKAVgYch6UElQkBA4MSpZq5TA=;
  b=ON5voSaKUFUw9POfb13YeQCsP1P+7qajKQLpJu9/U+ZAVSWnS17144Od
   qNn3EvijMSkaAVT6HtEYz+DBC1DpmcNyW8D3VLcR1LM9D481t6+j9YmUe
   j0xlo3QxszGiQcEz9Kk7z2yHeF3tB4kPcGMQh0M5HQQKG66qkRWuq76lb
   V8HCv7keymHFW6CUlVCSJe/VcyyK+MMG7Y2Dvd89YwE3Aj3o6NROkG7KT
   OtthsRt34yQHsmJJFZs6lHHcRT3UuIFJBdgUGZVSwHvAqIt3ZWfha9joQ
   sW/y6nt9ALv1OdAHtLS8ktjuVx/Wqu4Rlwd5+cNt0rpsG9KE8DluhmMWD
   g==;
X-CSE-ConnectionGUID: z2JvFT1+SISbeBz1Lf93gA==
X-CSE-MsgGUID: CFXK6gdXS4Gh/VpezQO08A==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69455229"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="69455229"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:33:12 -0700
X-CSE-ConnectionGUID: yrmCwjAjSGWczTR5w80aLA==
X-CSE-MsgGUID: B7Au/7U0QGS3f3MCWFnu6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="201293985"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Aug 2025 03:33:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urwOk-000Ud9-2c;
	Fri, 29 Aug 2025 10:32:17 +0000
Date: Fri, 29 Aug 2025 18:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/tipc/node.c:1750 tipc_node_xmit() warn: inconsistent returns
 'bh'.
Message-ID: <202508291815.bBFuBWKT-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   07d9df80082b8d1f37e05658371b087cb6738770
commit: b5f463486b212c56d837c2592d87de7fb4833662 s390: Support PREEMPT_DYNAMIC
date:   9 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 9 months ago
config: s390-randconfig-r072-20250829 (https://download.01.org/0day-ci/archive/20250829/202508291815.bBFuBWKT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508291815.bBFuBWKT-lkp@intel.com/

New smatch warnings:
net/tipc/node.c:1750 tipc_node_xmit() warn: inconsistent returns 'bh'.

Old smatch warnings:
net/tipc/node.c:2278 tipc_nl_peer_rm() error: uninitialized symbol 'addr'.

vim +/bh +1750 net/tipc/node.c

f73b12812a3d1d Hoang Le              2019-10-29  1677  
af9b028e270fda Jon Paul Maloy        2015-07-16  1678  /**
25764779298f23 Mauro Carvalho Chehab 2021-01-14  1679   * tipc_node_xmit() - general link level function for message sending
af9b028e270fda Jon Paul Maloy        2015-07-16  1680   * @net: the applicable net namespace
af9b028e270fda Jon Paul Maloy        2015-07-16  1681   * @list: chain of buffers containing message
af9b028e270fda Jon Paul Maloy        2015-07-16  1682   * @dnode: address of destination node
af9b028e270fda Jon Paul Maloy        2015-07-16  1683   * @selector: a number used for deterministic link selection
365ad353c2564b Jon Paul Maloy        2017-01-03  1684   * Consumes the buffer chain.
637b77fdca5c5e Randy Dunlap          2020-11-29  1685   * Return: 0 if success, otherwise: -ELINKCONG,-EHOSTUNREACH,-EMSGSIZE,-ENOBUF
af9b028e270fda Jon Paul Maloy        2015-07-16  1686   */
af9b028e270fda Jon Paul Maloy        2015-07-16  1687  int tipc_node_xmit(struct net *net, struct sk_buff_head *list,
af9b028e270fda Jon Paul Maloy        2015-07-16  1688  		   u32 dnode, int selector)
af9b028e270fda Jon Paul Maloy        2015-07-16  1689  {
5405ff6e15f40f Jon Paul Maloy        2015-11-19  1690  	struct tipc_link_entry *le = NULL;
af9b028e270fda Jon Paul Maloy        2015-07-16  1691  	struct tipc_node *n;
af9b028e270fda Jon Paul Maloy        2015-07-16  1692  	struct sk_buff_head xmitq;
f73b12812a3d1d Hoang Le              2019-10-29  1693  	bool node_up = false;
88956177db179e Xin Long              2022-12-03  1694  	struct net *peer_net;
4952cd3e7b47df Richard Alpe          2016-02-11  1695  	int bearer_id;
4952cd3e7b47df Richard Alpe          2016-02-11  1696  	int rc;
4952cd3e7b47df Richard Alpe          2016-02-11  1697  
4952cd3e7b47df Richard Alpe          2016-02-11  1698  	if (in_own_node(net, dnode)) {
6c9081a3915dc0 John Rutherford       2019-08-07  1699  		tipc_loopback_trace(net, list);
e654f9f53b45fd Jon Maloy             2019-08-15  1700  		spin_lock_init(&list->lock);
4952cd3e7b47df Richard Alpe          2016-02-11  1701  		tipc_sk_rcv(net, list);
4952cd3e7b47df Richard Alpe          2016-02-11  1702  		return 0;
4952cd3e7b47df Richard Alpe          2016-02-11  1703  	}
af9b028e270fda Jon Paul Maloy        2015-07-16  1704  
af9b028e270fda Jon Paul Maloy        2015-07-16  1705  	n = tipc_node_find(net, dnode);
4952cd3e7b47df Richard Alpe          2016-02-11  1706  	if (unlikely(!n)) {
e654f9f53b45fd Jon Maloy             2019-08-15  1707  		__skb_queue_purge(list);
4952cd3e7b47df Richard Alpe          2016-02-11  1708  		return -EHOSTUNREACH;
4952cd3e7b47df Richard Alpe          2016-02-11  1709  	}
4952cd3e7b47df Richard Alpe          2016-02-11  1710  
88956177db179e Xin Long              2022-12-03  1711  	rcu_read_lock();
5405ff6e15f40f Jon Paul Maloy        2015-11-19  1712  	tipc_node_read_lock(n);
f73b12812a3d1d Hoang Le              2019-10-29  1713  	node_up = node_is_up(n);
88956177db179e Xin Long              2022-12-03  1714  	peer_net = n->peer_net;
88956177db179e Xin Long              2022-12-03  1715  	tipc_node_read_unlock(n);
88956177db179e Xin Long              2022-12-03  1716  	if (node_up && peer_net && check_net(peer_net)) {
f73b12812a3d1d Hoang Le              2019-10-29  1717  		/* xmit inner linux container */
88956177db179e Xin Long              2022-12-03  1718  		tipc_lxc_xmit(peer_net, list);
f73b12812a3d1d Hoang Le              2019-10-29  1719  		if (likely(skb_queue_empty(list))) {
88956177db179e Xin Long              2022-12-03  1720  			rcu_read_unlock();
f73b12812a3d1d Hoang Le              2019-10-29  1721  			tipc_node_put(n);
f73b12812a3d1d Hoang Le              2019-10-29  1722  			return 0;
f73b12812a3d1d Hoang Le              2019-10-29  1723  		}
f73b12812a3d1d Hoang Le              2019-10-29  1724  	}
88956177db179e Xin Long              2022-12-03  1725  	rcu_read_unlock();
f73b12812a3d1d Hoang Le              2019-10-29  1726  
88956177db179e Xin Long              2022-12-03  1727  	tipc_node_read_lock(n);
2312bf61ae365f Jon Paul Maloy        2015-11-19  1728  	bearer_id = n->active_links[selector & 1];
4952cd3e7b47df Richard Alpe          2016-02-11  1729  	if (unlikely(bearer_id == INVALID_BEARER_ID)) {
4952cd3e7b47df Richard Alpe          2016-02-11  1730  		tipc_node_read_unlock(n);
4952cd3e7b47df Richard Alpe          2016-02-11  1731  		tipc_node_put(n);
e654f9f53b45fd Jon Maloy             2019-08-15  1732  		__skb_queue_purge(list);
4952cd3e7b47df Richard Alpe          2016-02-11  1733  		return -EHOSTUNREACH;
4952cd3e7b47df Richard Alpe          2016-02-11  1734  	}
4952cd3e7b47df Richard Alpe          2016-02-11  1735  
4952cd3e7b47df Richard Alpe          2016-02-11  1736  	__skb_queue_head_init(&xmitq);
2312bf61ae365f Jon Paul Maloy        2015-11-19  1737  	le = &n->links[bearer_id];
2312bf61ae365f Jon Paul Maloy        2015-11-19  1738  	spin_lock_bh(&le->lock);
2312bf61ae365f Jon Paul Maloy        2015-11-19  1739  	rc = tipc_link_xmit(le->link, list, &xmitq);
2312bf61ae365f Jon Paul Maloy        2015-11-19  1740  	spin_unlock_bh(&le->lock);
5405ff6e15f40f Jon Paul Maloy        2015-11-19  1741  	tipc_node_read_unlock(n);
4952cd3e7b47df Richard Alpe          2016-02-11  1742  
365ad353c2564b Jon Paul Maloy        2017-01-03  1743  	if (unlikely(rc == -ENOBUFS))
598411d70f85dc Jon Paul Maloy        2015-07-30  1744  		tipc_node_link_down(n, bearer_id, false);
365ad353c2564b Jon Paul Maloy        2017-01-03  1745  	else
fc1b6d6de22087 Tuong Lien            2019-11-08  1746  		tipc_bearer_xmit(net, bearer_id, &xmitq, &le->maddr, n);
4952cd3e7b47df Richard Alpe          2016-02-11  1747  
af9b028e270fda Jon Paul Maloy        2015-07-16  1748  	tipc_node_put(n);
5405ff6e15f40f Jon Paul Maloy        2015-11-19  1749  
dc8d1eb305984b Jon Paul Maloy        2015-12-02 @1750  	return rc;
dc8d1eb305984b Jon Paul Maloy        2015-12-02  1751  }
af9b028e270fda Jon Paul Maloy        2015-07-16  1752  

:::::: The code at line 1750 was first introduced by commit
:::::: dc8d1eb305984b1182f5e85de3c3a1f8592b83af tipc: fix node reference count bug

:::::: TO: Jon Paul Maloy <jon.maloy@ericsson.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
