Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D994624DCF6
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Aug 2026 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950633; cv=none; b=TPfrQdexRXHmyb6C0jl4tHg0GDyjGi2zzZ9LOoHvaB0T3vC9zUq9ezOZneKE2U2CO+4hLUS2N4ssDWL+3IBALiTYtSGbzmh5b5L4WBTpxhgLBlIQqtGBZu9D5Xx6QbcFm18y9uo3KnIT7WukjzTV0TtJHsPkjUqI69L4HYdb1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950633; c=relaxed/simple;
	bh=Uhq/gd7ew99LTqA2YHeTt7xvM5f4+wCUpd5xx7as+70=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IapeFgdVWqnOZ+cwktxSrcN/MnoH2jw4uy3GIbZwjqxCxXoAEi5kJhLmGN3lZa63/J1dfP6A9wGG6s9pVi3sLyC5ztdd9T+YPCm04Uyf/oVEEVj810W0CJllb0+Ezq1/Z7h0+u08mFOi0G8ya7QdXR6ulvWG/Fpj3z9DDOz861E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aD4YP+8R; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aD4YP+8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787950631; x=1819486631;
  h=date:from:to:cc:subject:message-id;
  bh=Uhq/gd7ew99LTqA2YHeTt7xvM5f4+wCUpd5xx7as+70=;
  b=aD4YP+8RBUm6TlnqaLsj228pPg+fGZjV/UsVGpod+wJERNaiUQsGBFci
   HHi9q6hXY4Fyo0nBzGTJFO/rqSjh8tizReb2ByC/FEIhZ6VzZfbrNAQ/2
   yDZOIBQOtG2RLyd6WcLl1Yj9gp+qoOqG6r9xBHGRjxjXXXVgIHQ6lti50
   HjgypTePfYpOuEUinLIvp7xwoILMO1fCOpt4CWjh4sfE0ZgcaW+n1Dcvj
   11lxzb53E/k4ndw9V0bkqKKGY0umyAmQTkHYuDU+5s+Lc+W1NjTf/+aBe
   2FgGj4OQkaJ08oHL0iwa5z7BMu4h3hZXv+5S/B9DBM2CdX+Rwl08P1Xjg
   g==;
X-CSE-ConnectionGUID: si5ZWPRNTZ64Fw4Mus82Ag==
X-CSE-MsgGUID: HdBek3JuSyCnY+jnZqrh3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88226616"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="88226616"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 13:57:11 -0700
X-CSE-ConnectionGUID: 2lXhMw4hQTSOYXID7rn0lA==
X-CSE-MsgGUID: cRfXGWs3Rk+MizDpPOVb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="298174385"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Aug 2026 13:57:09 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x03dK-00000000By6-3Ylb;
	Fri, 28 Aug 2026 20:57:06 +0000
Date: Sat, 29 Aug 2026 04:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/bonding/bond_procfs.c:160:6-41: opportunity for
 str_on_off(READ_ONCE ( bond -> params . lacp_active ))
Message-ID: <202608290438.dGixHlc1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b78070aaef63512688aebfbc82365ef9d6660f1
commit: 4dc5a40b3bc90815efac0558d82f80ca597957dd bonding: annotate data-races in sysfs and procfs
date:   3 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-104 (https://download.01.org/0day-ci/archive/20260829/202608290438.dGixHlc1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4dc5a40b3bc9 ("bonding: annotate data-races in sysfs and procfs")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608290438.dGixHlc1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/net/bonding/bond_procfs.c:103:37-64: opportunity for str_up_down(netif_carrier_ok ( bond -> dev ))
>> drivers/net/bonding/bond_procfs.c:160:6-41: opportunity for str_on_off(READ_ONCE ( bond -> params . lacp_active ))

vim +160 drivers/net/bonding/bond_procfs.c

bd33acc3cc52597 Amerigo Wang        2011-03-06   58  
bd33acc3cc52597 Amerigo Wang        2011-03-06   59  static void bond_info_show_master(struct seq_file *seq)
bd33acc3cc52597 Amerigo Wang        2011-03-06   60  {
359745d78351c6f Muchun Song         2022-01-21   61  	struct bonding *bond = pde_data(file_inode(seq->file));
28f084cca35a736 stephen hemminger   2014-03-06   62  	const struct bond_opt_value *optval;
059b47e8aaf9972 Nikolay Aleksandrov 2014-09-09   63  	struct slave *curr, *primary;
4dc5a40b3bc9081 Eric Dumazet        2026-06-02   64  	int arp_interval, fail_over_mac, miimon, i;
bd33acc3cc52597 Amerigo Wang        2011-03-06   65  
4335d60e5e27149 dingtianhong        2014-02-21   66  	curr = rcu_dereference(bond->curr_active_slave);
bd33acc3cc52597 Amerigo Wang        2011-03-06   67  
bd33acc3cc52597 Amerigo Wang        2011-03-06   68  	seq_printf(seq, "Bonding Mode: %s",
01844098ecd9564 Veaceslav Falico    2014-05-15   69  		   bond_mode_name(BOND_MODE(bond)));
bd33acc3cc52597 Amerigo Wang        2011-03-06   70  
4dc5a40b3bc9081 Eric Dumazet        2026-06-02   71  	fail_over_mac = READ_ONCE(bond->params.fail_over_mac);
4dc5a40b3bc9081 Eric Dumazet        2026-06-02   72  	if (BOND_MODE(bond) == BOND_MODE_ACTIVEBACKUP && fail_over_mac) {
1df6b6aa334c99b Nikolay Aleksandrov 2014-01-22   73  		optval = bond_opt_get_val(BOND_OPT_FAIL_OVER_MAC,
4dc5a40b3bc9081 Eric Dumazet        2026-06-02   74  					  fail_over_mac);
1df6b6aa334c99b Nikolay Aleksandrov 2014-01-22   75  		seq_printf(seq, " (fail_over_mac %s)", optval->string);
1df6b6aa334c99b Nikolay Aleksandrov 2014-01-22   76  	}
bd33acc3cc52597 Amerigo Wang        2011-03-06   77  
bd33acc3cc52597 Amerigo Wang        2011-03-06   78  	seq_printf(seq, "\n");
bd33acc3cc52597 Amerigo Wang        2011-03-06   79  
d7021325a2ea5aa Mahesh Bandewar     2014-10-04   80  	if (bond_mode_uses_xmit_hash(bond)) {
4dc5a40b3bc9081 Eric Dumazet        2026-06-02   81  		int xmit_policy = READ_ONCE(bond->params.xmit_policy);
4dc5a40b3bc9081 Eric Dumazet        2026-06-02   82  
4dc5a40b3bc9081 Eric Dumazet        2026-06-02   83  		optval = bond_opt_get_val(BOND_OPT_XMIT_HASH, xmit_policy);
a4b32ce7f891d50 Nikolay Aleksandrov 2014-01-22   84  		seq_printf(seq, "Transmit Hash Policy: %s (%d)\n",
4dc5a40b3bc9081 Eric Dumazet        2026-06-02   85  			   optval->string, xmit_policy);
bd33acc3cc52597 Amerigo Wang        2011-03-06   86  	}
bd33acc3cc52597 Amerigo Wang        2011-03-06   87  
ec0865a94991d18 Veaceslav Falico    2014-05-15   88  	if (bond_uses_primary(bond)) {
059b47e8aaf9972 Nikolay Aleksandrov 2014-09-09   89  		primary = rcu_dereference(bond->primary_slave);
bd33acc3cc52597 Amerigo Wang        2011-03-06   90  		seq_printf(seq, "Primary Slave: %s",
059b47e8aaf9972 Nikolay Aleksandrov 2014-09-09   91  			   primary ? primary->dev->name : "None");
059b47e8aaf9972 Nikolay Aleksandrov 2014-09-09   92  		if (primary) {
388d3a6d4aa356b Nikolay Aleksandrov 2014-01-22   93  			optval = bond_opt_get_val(BOND_OPT_PRIMARY_RESELECT,
4dc5a40b3bc9081 Eric Dumazet        2026-06-02   94  					READ_ONCE(bond->params.primary_reselect));
bd33acc3cc52597 Amerigo Wang        2011-03-06   95  			seq_printf(seq, " (primary_reselect %s)",
388d3a6d4aa356b Nikolay Aleksandrov 2014-01-22   96  				   optval->string);
388d3a6d4aa356b Nikolay Aleksandrov 2014-01-22   97  		}
bd33acc3cc52597 Amerigo Wang        2011-03-06   98  
bd33acc3cc52597 Amerigo Wang        2011-03-06   99  		seq_printf(seq, "\nCurrently Active Slave: %s\n",
bd33acc3cc52597 Amerigo Wang        2011-03-06  100  			   (curr) ? curr->dev->name : "None");
bd33acc3cc52597 Amerigo Wang        2011-03-06  101  	}
bd33acc3cc52597 Amerigo Wang        2011-03-06  102  
bd33acc3cc52597 Amerigo Wang        2011-03-06  103  	seq_printf(seq, "MII Status: %s\n", netif_carrier_ok(bond->dev) ?
bd33acc3cc52597 Amerigo Wang        2011-03-06  104  		   "up" : "down");
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  105  	miimon = READ_ONCE(bond->params.miimon);
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  106  	seq_printf(seq, "MII Polling Interval (ms): %d\n", miimon);
bd33acc3cc52597 Amerigo Wang        2011-03-06  107  	seq_printf(seq, "Up Delay (ms): %d\n",
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  108  		   READ_ONCE(bond->params.updelay) * miimon);
bd33acc3cc52597 Amerigo Wang        2011-03-06  109  	seq_printf(seq, "Down Delay (ms): %d\n",
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  110  		   READ_ONCE(bond->params.downdelay) * miimon);
07a4ddec3ce9b0a Vincent Bernat      2019-07-02  111  	seq_printf(seq, "Peer Notification Delay (ms): %d\n",
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  112  		   READ_ONCE(bond->params.peer_notif_delay) * miimon);
bd33acc3cc52597 Amerigo Wang        2011-03-06  113  
bd33acc3cc52597 Amerigo Wang        2011-03-06  114  
bd33acc3cc52597 Amerigo Wang        2011-03-06  115  	/* ARP information */
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  116  	arp_interval = READ_ONCE(bond->params.arp_interval);
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  117  	if (arp_interval > 0) {
bd33acc3cc52597 Amerigo Wang        2011-03-06  118  		int printed = 0;
86a5ad0a4608c96 Yufeng Mo           2021-05-20  119  
bd33acc3cc52597 Amerigo Wang        2011-03-06  120  		seq_printf(seq, "ARP Polling Interval (ms): %d\n",
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  121  				arp_interval);
5944b5abd8646e8 Hangbin Liu         2021-11-30  122  		seq_printf(seq, "ARP Missed Max: %u\n",
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  123  				READ_ONCE(bond->params.missed_max));
bd33acc3cc52597 Amerigo Wang        2011-03-06  124  
bd33acc3cc52597 Amerigo Wang        2011-03-06  125  		seq_printf(seq, "ARP IP target/s (n.n.n.n form):");
bd33acc3cc52597 Amerigo Wang        2011-03-06  126  
bd33acc3cc52597 Amerigo Wang        2011-03-06  127  		for (i = 0; (i < BOND_MAX_ARP_TARGETS); i++) {
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  128  			__be32 t = READ_ONCE(bond->params.arp_targets[i]);
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  129  
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  130  			if (!t)
bd33acc3cc52597 Amerigo Wang        2011-03-06  131  				break;
bd33acc3cc52597 Amerigo Wang        2011-03-06  132  			if (printed)
bd33acc3cc52597 Amerigo Wang        2011-03-06  133  				seq_printf(seq, ",");
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  134  			seq_printf(seq, " %pI4", &t);
bd33acc3cc52597 Amerigo Wang        2011-03-06  135  			printed = 1;
bd33acc3cc52597 Amerigo Wang        2011-03-06  136  		}
bd33acc3cc52597 Amerigo Wang        2011-03-06  137  		seq_printf(seq, "\n");
4a1f14df55d1e9e Hangbin Liu         2022-05-30  138  
4a1f14df55d1e9e Hangbin Liu         2022-05-30  139  #if IS_ENABLED(CONFIG_IPV6)
4a1f14df55d1e9e Hangbin Liu         2022-05-30  140  		printed = 0;
4a1f14df55d1e9e Hangbin Liu         2022-05-30  141  		seq_printf(seq, "NS IPv6 target/s (xx::xx form):");
4a1f14df55d1e9e Hangbin Liu         2022-05-30  142  
4a1f14df55d1e9e Hangbin Liu         2022-05-30  143  		for (i = 0; (i < BOND_MAX_NS_TARGETS); i++) {
4a1f14df55d1e9e Hangbin Liu         2022-05-30  144  			if (ipv6_addr_any(&bond->params.ns_targets[i]))
4a1f14df55d1e9e Hangbin Liu         2022-05-30  145  				break;
4a1f14df55d1e9e Hangbin Liu         2022-05-30  146  			if (printed)
4a1f14df55d1e9e Hangbin Liu         2022-05-30  147  				seq_printf(seq, ",");
4a1f14df55d1e9e Hangbin Liu         2022-05-30  148  			seq_printf(seq, " %pI6c", &bond->params.ns_targets[i]);
4a1f14df55d1e9e Hangbin Liu         2022-05-30  149  			printed = 1;
4a1f14df55d1e9e Hangbin Liu         2022-05-30  150  		}
4a1f14df55d1e9e Hangbin Liu         2022-05-30  151  		seq_printf(seq, "\n");
4a1f14df55d1e9e Hangbin Liu         2022-05-30  152  #endif
bd33acc3cc52597 Amerigo Wang        2011-03-06  153  	}
bd33acc3cc52597 Amerigo Wang        2011-03-06  154  
01844098ecd9564 Veaceslav Falico    2014-05-15  155  	if (BOND_MODE(bond) == BOND_MODE_8023AD) {
bd33acc3cc52597 Amerigo Wang        2011-03-06  156  		struct ad_info ad_info;
bd33acc3cc52597 Amerigo Wang        2011-03-06  157  
bd33acc3cc52597 Amerigo Wang        2011-03-06  158  		seq_puts(seq, "\n802.3ad info\n");
3a755cd8b7c601f Hangbin Liu         2021-08-02  159  		seq_printf(seq, "LACP active: %s\n",
4dc5a40b3bc9081 Eric Dumazet        2026-06-02 @160  			   READ_ONCE(bond->params.lacp_active) ? "on" : "off");
bd33acc3cc52597 Amerigo Wang        2011-03-06  161  		seq_printf(seq, "LACP rate: %s\n",
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  162  			   READ_ONCE(bond->params.lacp_fast) ? "fast" : "slow");
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  163  		seq_printf(seq, "Min links: %d\n",
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  164  			   READ_ONCE(bond->params.min_links));
9e5f5eebe765b34 Nikolay Aleksandrov 2014-01-22  165  		optval = bond_opt_get_val(BOND_OPT_AD_SELECT,
4dc5a40b3bc9081 Eric Dumazet        2026-06-02  166  					  READ_ONCE(bond->params.ad_select));
bd33acc3cc52597 Amerigo Wang        2011-03-06  167  		seq_printf(seq, "Aggregator selection policy (ad_select): %s\n",
9e5f5eebe765b34 Nikolay Aleksandrov 2014-01-22  168  			   optval->string);
4cd6b4754492c08 Mahesh Bandewar     2015-06-18  169  		if (capable(CAP_NET_ADMIN)) {
6791e4661c4bd3e Mahesh Bandewar     2015-05-09  170  			seq_printf(seq, "System priority: %d\n",
6791e4661c4bd3e Mahesh Bandewar     2015-05-09  171  				   BOND_AD_INFO(bond).system.sys_priority);
74514957552edd4 Mahesh Bandewar     2015-05-09  172  			seq_printf(seq, "System MAC address: %pM\n",
74514957552edd4 Mahesh Bandewar     2015-05-09  173  				   &BOND_AD_INFO(bond).system.sys_mac_addr);
bd33acc3cc52597 Amerigo Wang        2011-03-06  174  
318debd897735fe Nikolay Aleksandrov 2013-05-18  175  			if (__bond_3ad_get_active_agg_info(bond, &ad_info)) {
4cd6b4754492c08 Mahesh Bandewar     2015-06-18  176  				seq_printf(seq,
4cd6b4754492c08 Mahesh Bandewar     2015-06-18  177  					   "bond %s has no active aggregator\n",
bd33acc3cc52597 Amerigo Wang        2011-03-06  178  					   bond->dev->name);
bd33acc3cc52597 Amerigo Wang        2011-03-06  179  			} else {
bd33acc3cc52597 Amerigo Wang        2011-03-06  180  				seq_printf(seq, "Active Aggregator Info:\n");
bd33acc3cc52597 Amerigo Wang        2011-03-06  181  
bd33acc3cc52597 Amerigo Wang        2011-03-06  182  				seq_printf(seq, "\tAggregator ID: %d\n",
bd33acc3cc52597 Amerigo Wang        2011-03-06  183  					   ad_info.aggregator_id);
bd33acc3cc52597 Amerigo Wang        2011-03-06  184  				seq_printf(seq, "\tNumber of ports: %d\n",
bd33acc3cc52597 Amerigo Wang        2011-03-06  185  					   ad_info.ports);
bd33acc3cc52597 Amerigo Wang        2011-03-06  186  				seq_printf(seq, "\tActor Key: %d\n",
bd33acc3cc52597 Amerigo Wang        2011-03-06  187  					   ad_info.actor_key);
bd33acc3cc52597 Amerigo Wang        2011-03-06  188  				seq_printf(seq, "\tPartner Key: %d\n",
bd33acc3cc52597 Amerigo Wang        2011-03-06  189  					   ad_info.partner_key);
bd33acc3cc52597 Amerigo Wang        2011-03-06  190  				seq_printf(seq, "\tPartner Mac Address: %pM\n",
bd33acc3cc52597 Amerigo Wang        2011-03-06  191  					   ad_info.partner_system);
bd33acc3cc52597 Amerigo Wang        2011-03-06  192  			}
bd33acc3cc52597 Amerigo Wang        2011-03-06  193  		}
bd33acc3cc52597 Amerigo Wang        2011-03-06  194  	}
4cd6b4754492c08 Mahesh Bandewar     2015-06-18  195  }
bd33acc3cc52597 Amerigo Wang        2011-03-06  196  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
