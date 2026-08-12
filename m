Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C489D43F8B2
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 21:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568498; cv=none; b=Llmq1e25k2iyNcDNuBcNJo9bQytEoWKuUCgIW6nVUkIfLcNOnyy4JZ1v7UmqC5TqZaJeDac59wFNnpD+kMU2Gph4VgiPA1z+Kw2QbPMSEZbniUKQkrF7GmleH28KvT7Gy1+ziED6w30j3NiK/dOgX61TuqEvHQ8mZt1OIx+rGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568498; c=relaxed/simple;
	bh=nNyoD79HhaMFesohsU10GDsJkb7OL5ays8nQ0KrpRkU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iUfi2EtyViN/z1gN2gqf1wbBiOPJs+W0BwKocXBALMgIk4x4vX8ajBNXXKiQxbjWzffRIbsALZulks6uUil6WSI2BrvZsvLwB351UTJQDPBxgi3MSLfp90/Fx0n+DQuKywwaWYVtUqXbNYZ9p+8J4vauZTNxTdD45CpvF3E0YKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaZbT7l/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaZbT7l/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786568496; x=1818104496;
  h=date:from:to:cc:subject:message-id;
  bh=nNyoD79HhaMFesohsU10GDsJkb7OL5ays8nQ0KrpRkU=;
  b=EaZbT7l/ov+6rzJXqVa0mcPXn7ZCP9uEPUe4Wx4oz8H/7yQnVqsunazx
   OtNsIiNEz83YSmamnP9+S/isqt+50NrbG6CJdQkRlCLKi34k4mhJvCrW7
   mdiRo8vFIrAhVlyNYb03dhX+2D19ABzk9Oam3nADJwWBklfpZIlvQKfUp
   V5iuxU4SVcGka1vi2IrAtfUboUKVeDUwmw0/xrQNJ01/OgGVkTvoAQys0
   /EbqST9MD3QlPqmXY8V/OaNlir0zwVAsRoMgoXhajKqpQNnXhgI4eAmJG
   PR8mk+pKf6jplWY3y3geh7mLCJQ9Ygv3D0jVjTtL2493jEL324wU7jW3K
   A==;
X-CSE-ConnectionGUID: mWHluNd1Q6+prxix8UVZDw==
X-CSE-MsgGUID: 4kJpgu2cQX+Otl5IPFPTwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86098014"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86098014"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 14:01:35 -0700
X-CSE-ConnectionGUID: hhk9khXoQoyVpDGN+ismtQ==
X-CSE-MsgGUID: 1I+cTx6lSzGNnFBQvatQCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="287200710"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2026 14:01:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuG4q-00000000RhQ-0SIf;
	Wed, 12 Aug 2026 21:01:32 +0000
Date: Thu, 13 Aug 2026 05:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-net-queue:main 7/7] net/tipc/node.c:1099
 tipc_node_link_down() warn: inconsistent returns '&n->lock'.
Message-ID: <202608130505.TCb1foou-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Jun Yang <junvyyang@tencent.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Tung Nguyen <tung.quang.nguyen@est.tech>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git main
head:   cba9ccb47e9fa4cc77692fb896cc5ab57a667882
commit: cba9ccb47e9fa4cc77692fb896cc5ab57a667882 [7/7] tipc: read le->link under the node lock in tipc_node_link_down()
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130505.TCb1foou-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608130505.TCb1foou-lkp@intel.com/

smatch warnings:
net/tipc/node.c:1099 tipc_node_link_down() warn: inconsistent returns '&n->lock'.
net/tipc/node.c:1099 tipc_node_link_down() warn: inconsistent returns 'bh'.

vim +1099 net/tipc/node.c

598411d70f85dc Jon Paul Maloy 2015-07-30  1061  
598411d70f85dc Jon Paul Maloy 2015-07-30  1062  static void tipc_node_link_down(struct tipc_node *n, int bearer_id, bool delete)
598411d70f85dc Jon Paul Maloy 2015-07-30  1063  {
737889efe9713a Jon Maloy      2019-03-22  1064  	struct tipc_media_addr *maddr = NULL;
35c55c9877f8de Jon Paul Maloy 2016-06-13  1065  	int old_bearer_id = bearer_id;
cba9ccb47e9fa4 Jun Yang       2026-08-10  1066  	struct tipc_link_entry *le;
737889efe9713a Jon Maloy      2019-03-22  1067  	struct sk_buff_head xmitq;
cba9ccb47e9fa4 Jun Yang       2026-08-10  1068  	struct tipc_link *l;
73f646cec35477 Jon Paul Maloy 2015-10-15  1069  
598411d70f85dc Jon Paul Maloy 2015-07-30  1070  	__skb_queue_head_init(&xmitq);
598411d70f85dc Jon Paul Maloy 2015-07-30  1071  
cba9ccb47e9fa4 Jun Yang       2026-08-10  1072  	/* Synchronize the link lookup with bearer teardown. */
5405ff6e15f40f Jon Paul Maloy 2015-11-19  1073  	tipc_node_write_lock(n);
cba9ccb47e9fa4 Jun Yang       2026-08-10  1074  	le = &n->links[bearer_id];
cba9ccb47e9fa4 Jun Yang       2026-08-10  1075  	l = le->link;
cba9ccb47e9fa4 Jun Yang       2026-08-10  1076  	if (!l) {
cba9ccb47e9fa4 Jun Yang       2026-08-10  1077  		tipc_node_write_unlock_fast(n);
cba9ccb47e9fa4 Jun Yang       2026-08-10  1078  		return;
cba9ccb47e9fa4 Jun Yang       2026-08-10  1079  	}
cba9ccb47e9fa4 Jun Yang       2026-08-10  1080  
73f646cec35477 Jon Paul Maloy 2015-10-15  1081  	if (!tipc_link_is_establishing(l)) {
598411d70f85dc Jon Paul Maloy 2015-07-30  1082  		__tipc_node_link_down(n, &bearer_id, &xmitq, &maddr);
91986ee166cf08 Tuong Lien     2019-02-11  1083  	} else {
91986ee166cf08 Tuong Lien     2019-02-11  1084  		/* Defuse pending tipc_node_link_up() */
91986ee166cf08 Tuong Lien     2019-02-11  1085  		tipc_link_reset(l);
91986ee166cf08 Tuong Lien     2019-02-11  1086  		tipc_link_fsm_evt(l, LINK_RESET_EVT);
91986ee166cf08 Tuong Lien     2019-02-11  1087  	}
73f646cec35477 Jon Paul Maloy 2015-10-15  1088  	if (delete) {
73f646cec35477 Jon Paul Maloy 2015-10-15  1089  		kfree(l);
598411d70f85dc Jon Paul Maloy 2015-07-30  1090  		le->link = NULL;
598411d70f85dc Jon Paul Maloy 2015-07-30  1091  		n->link_cnt--;
598411d70f85dc Jon Paul Maloy 2015-07-30  1092  	}
eb18a510b5cd4d Tuong Lien     2018-12-19  1093  	trace_tipc_node_link_down(n, true, "node link down or deleted!");
5405ff6e15f40f Jon Paul Maloy 2015-11-19  1094  	tipc_node_write_unlock(n);
35c55c9877f8de Jon Paul Maloy 2016-06-13  1095  	if (delete)
35c55c9877f8de Jon Paul Maloy 2016-06-13  1096  		tipc_mon_remove_peer(n->net, n->addr, old_bearer_id);
737889efe9713a Jon Maloy      2019-03-22  1097  	if (!skb_queue_empty(&xmitq))
fc1b6d6de22087 Tuong Lien     2019-11-08  1098  		tipc_bearer_xmit(n->net, bearer_id, &xmitq, maddr, n);
598411d70f85dc Jon Paul Maloy 2015-07-30 @1099  	tipc_sk_rcv(n->net, &le->inputq);
b97bf3fd8f6a16 Per Liden      2006-01-02  1100  }
b97bf3fd8f6a16 Per Liden      2006-01-02  1101  

:::::: The code at line 1099 was first introduced by commit
:::::: 598411d70f85dcf5b5c6c2369cc48637c251b656 tipc: make resetting of links non-atomic

:::::: TO: Jon Paul Maloy <jon.maloy@ericsson.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
