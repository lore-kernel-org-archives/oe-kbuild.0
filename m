Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B82366
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Jan 2023 05:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673502571; x=1705038571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cAn4lC39yDsuyjPSFC24Kv73l99wgJ/Bqgg2sH/AJBQ=;
  b=dx8+ZJ2+q/UynVzmbLQJNLLxSxarE2XQHys6DmLtuZVJ44mJWp4fTO3J
   A1ffBk8ZzBpYnWtb09bRjq3EVmlEm5XapwGcSjxl7wjUs6fq8KPF3QUiM
   ogb1gxiIpgGeCuPyWmJ3uV+utum09Cbyk5g059ypiwAEBoJsIZU/IAuHC
   Zf/zHdC2tPjtshRN932mSLl8rjzkt63N9pJny2e+ahzNX2FUhxgumabY7
   Rl5hYzBoC4BcZSv+SgYkGHFqWH9KxYzF4Luc0Erph/RHN+lEy7OwceEzs
   rjFKsxQCLqqMqAu4v+9J7J2Oh8Z9NdFTk2hURcLIrtK+Ti6UNGJmo370g
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="385932997"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="385932997"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 21:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="690003437"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="690003437"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Jan 2023 21:49:30 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFqSv-0009rk-0s;
	Thu, 12 Jan 2023 05:49:29 +0000
Date: Thu, 12 Jan 2023 13:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/rxrpc/peer_object.c:123:26: warning: Uninitialized variables:
 peer.rcu, peer.ref, peer.hash_key, peer.hash_link, peer.local,
 peer.error_targets, peer.service_conns, peer.keepalive_link,
 peer.last_tx_at, peer.service_conn_lock, peer.lock, peer.if_mtu, ...
Message-ID: <202301121317.AjChjink-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/rxrpc/peer_object.c:123:26: warning: Uninitialized variables: peer.rcu, peer.ref, peer.hash_key, peer.hash_link, peer.local, peer.error_targets, peer.service_conns, peer.keepalive_link, peer.last_tx_at, peer.service_conn_lock, peer.lock, peer.if_mtu, peer.mtu, peer.maxdata, peer.hdrsize, peer.debug_id, peer.srx, peer.rtt_input_lock, peer.rtt_last_req, peer.rtt_count, peer.srtt_us, peer.mdev_us, peer.mdev_max_us, peer.rttvar_us, peer.rto_j, peer.backoff, peer.cong_cwnd [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8f60cd7db24f94f2dbed6bec30dd16a68fc0828
commit: a05754295e01f006a651eec759c5dbe682ef6cef rxrpc: Use refcount_t rather than atomic_t
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a05754295e01f006a651eec759c5dbe682ef6cef
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/rxrpc/peer_object.c:123:26: warning: Uninitialized variables: peer.rcu, peer.ref, peer.hash_key, peer.hash_link, peer.local, peer.error_targets, peer.service_conns, peer.keepalive_link, peer.last_tx_at, peer.service_conn_lock, peer.lock, peer.if_mtu, peer.mtu, peer.maxdata, peer.hdrsize, peer.debug_id, peer.srx, peer.rtt_input_lock, peer.rtt_last_req, peer.rtt_count, peer.srtt_us, peer.mdev_us, peer.mdev_max_us, peer.rttvar_us, peer.rto_j, peer.backoff, peer.cong_cwnd [uninitvar]
     if (rxrpc_peer_cmp_key(peer, local, srx, hash_key) == 0 &&
                            ^

vim +123 net/rxrpc/peer_object.c

be6e6707f6eec2 David Howells 2016-04-04  110  
be6e6707f6eec2 David Howells 2016-04-04  111  /*
be6e6707f6eec2 David Howells 2016-04-04  112   * Look up a remote transport endpoint for the specified address using RCU.
be6e6707f6eec2 David Howells 2016-04-04  113   */
be6e6707f6eec2 David Howells 2016-04-04  114  static struct rxrpc_peer *__rxrpc_lookup_peer_rcu(
be6e6707f6eec2 David Howells 2016-04-04  115  	struct rxrpc_local *local,
be6e6707f6eec2 David Howells 2016-04-04  116  	const struct sockaddr_rxrpc *srx,
be6e6707f6eec2 David Howells 2016-04-04  117  	unsigned long hash_key)
be6e6707f6eec2 David Howells 2016-04-04  118  {
be6e6707f6eec2 David Howells 2016-04-04  119  	struct rxrpc_peer *peer;
2baec2c3f854d1 David Howells 2017-05-24  120  	struct rxrpc_net *rxnet = local->rxnet;
be6e6707f6eec2 David Howells 2016-04-04  121  
2baec2c3f854d1 David Howells 2017-05-24  122  	hash_for_each_possible_rcu(rxnet->peer_hash, peer, hash_link, hash_key) {
0099dc589bfa7c David Howells 2018-09-27 @123  		if (rxrpc_peer_cmp_key(peer, local, srx, hash_key) == 0 &&
a05754295e01f0 David Howells 2022-05-21  124  		    refcount_read(&peer->ref) > 0)
be6e6707f6eec2 David Howells 2016-04-04  125  			return peer;
be6e6707f6eec2 David Howells 2016-04-04  126  	}
be6e6707f6eec2 David Howells 2016-04-04  127  
be6e6707f6eec2 David Howells 2016-04-04  128  	return NULL;
be6e6707f6eec2 David Howells 2016-04-04  129  }
be6e6707f6eec2 David Howells 2016-04-04  130  

:::::: The code at line 123 was first introduced by commit
:::::: 0099dc589bfa7caf6f2608c4cbc1181cfee22b0c rxrpc: Make service call handling more robust

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
