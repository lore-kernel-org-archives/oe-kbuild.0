Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C484284690
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 04:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259707; cv=none; b=ScP2LyfUmrpE+Xxpq5dkkrsNPV2u+2ufDTlDqPT2QbeEex6D2Kg2Eb86ziecmiDhx5AOQ3GzypAOdtQeW9y38PFolh9kqt3+yscKuh7JR5/YAEbJeTZr4JbFoh5lQ8B5FDiXiu0xxsYXPPjPCsDziWJmFFRJrGuDaoihxpfP1uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259707; c=relaxed/simple;
	bh=e603ANF5NFLouT4123VpUQWga/LErse9RPqFauhWOfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1nfb0yK017olHwneb69B6k5KdbWrCaLCx2ZGM+7CAjV+IOZzwX+/LpVAFvhUYmfBQEjAcC4SrvjqNYFeFc58CM55xqHbV9YEqS9z8fADr4KL+GJjA6vAhkZZ9Mxb9jCOAlEM9y75UyL3IX8pnjgvJWCPmFm4aqZ9+YYUKYnII0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ej5v/IRI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ej5v/IRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791259704; x=1822795704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e603ANF5NFLouT4123VpUQWga/LErse9RPqFauhWOfc=;
  b=Ej5v/IRIWaqmO3vM6qe4iwrervcO6yUQBPzV+gTFYX3zfn72ceylOTLM
   aAg0bnOlUNtkofdSnlDkdgI+to1lHPAfXd2Dy7GcQ+LigsbaTtvjVy9KG
   DUZIIhZLUp5PutvEv7KVXVdml0a96f9tvTgk96dLtYpLfj1XjfWsZ2VIe
   s5oxpKYa7gS+V1UOqA52ztvvc+PVN6re93gjwGe0DaWQLrBprLuhJ+vS0
   It0u+fRkoH51IDWsVy7RYfljI3GffNg9QrM+shdKo2hA9QrSz/5OqP2TP
   Yi0+9kDCL77C07p9MWtBrZ6HEznz485NAOGwzuNM4xXyX2z6Vg/Tzf1dZ
   w==;
X-CSE-ConnectionGUID: nTuRmtHxRgCN67ab9AemLw==
X-CSE-MsgGUID: L82lSiUWTla0c9Hg4DcrPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="103309346"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="103309346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 21:08:23 -0700
X-CSE-ConnectionGUID: S/G4Uz9IS+O6wL/PtMv2XA==
X-CSE-MsgGUID: Pa0C10PHS+ql3uEh+BkUJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="285135701"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Oct 2026 21:08:23 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDwTU-000000000hD-1scr;
	Tue, 06 Oct 2026 04:08:20 +0000
Date: Tue, 6 Oct 2026 06:07:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: netfilter: nf_tables: switch chain_types array to rcu
Message-ID: <202610060650.xzhIFZJL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <202610060650.xzhIFZJL-lkp@intel.com>
References: <202610060650.xzhIFZJL-lkp@intel.com>

Hi Florian,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nf_tables-switch-chain_types-array-to-rcu/20260929-165944
base:   
patch link:    https://lore.kernel.org/r/202610060650.xzhIFZJL-lkp%40intel.com
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: xtensa-randconfig-r2200-20261005 (https://download.01.org/0day-ci/archive/20261006/202610060650.xzhIFZJL-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610060650.xzhIFZJL-lkp@intel.com/

New smatch warnings:
net/netfilter/nf_tables_api.c:2653 nft_chain_parse_hook() warn: missing unwind goto?

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +2653 net/netfilter/nf_tables_api.c

d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2585  
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2586  static int nft_chain_parse_hook(struct net *net,
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2587  				struct nft_base_chain *basechain,
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2588  				const struct nlattr * const nla[],
36596dadf54a92 Pablo Neira Ayuso 2018-01-09  2589  				struct nft_chain_hook *hook, u8 family,
207296f1a03bfe Pablo Neira Ayuso 2023-04-21  2590  				u32 flags, struct netlink_ext_ack *extack)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2591  {
d59d2f82f984df Pablo Neira Ayuso 2021-04-23  2592  	struct nftables_pernet *nft_net = nft_pernet(net);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2593  	struct nlattr *ha[NFTA_HOOK_MAX + 1];
32537e91847a56 Pablo Neira Ayuso 2018-03-27  2594  	const struct nft_chain_type *type;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2595  	int err;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2596  
0854db2aaef3fc Florian Westphal  2021-04-01  2597  	lockdep_assert_held(&nft_net->commit_mutex);
f102d66b335a41 Florian Westphal  2018-07-11  2598  	lockdep_nfnl_nft_mutex_not_held();
f102d66b335a41 Florian Westphal  2018-07-11  2599  
8cb081746c031f Johannes Berg     2019-04-26  2600  	err = nla_parse_nested_deprecated(ha, NFTA_HOOK_MAX,
8cb081746c031f Johannes Berg     2019-04-26  2601  					  nla[NFTA_CHAIN_HOOK],
fceb6435e85298 Johannes Berg     2017-04-12  2602  					  nft_hook_policy, NULL);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2603  	if (err < 0)
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2604  		return err;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2605  
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2606  	if (!basechain) {
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2607  		if (!ha[NFTA_HOOK_HOOKNUM] ||
8509f62b0b07ae Pablo Neira Ayuso 2023-04-25  2608  		    !ha[NFTA_HOOK_PRIORITY]) {
8509f62b0b07ae Pablo Neira Ayuso 2023-04-25  2609  			NL_SET_BAD_ATTR(extack, nla[NFTA_CHAIN_NAME]);
8509f62b0b07ae Pablo Neira Ayuso 2023-04-25  2610  			return -ENOENT;
8509f62b0b07ae Pablo Neira Ayuso 2023-04-25  2611  		}
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2612  
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2613  		hook->num = ntohl(nla_get_be32(ha[NFTA_HOOK_HOOKNUM]));
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2614  		hook->priority = ntohl(nla_get_be32(ha[NFTA_HOOK_PRIORITY]));
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2615  
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2616  		if (nla[NFTA_CHAIN_TYPE]) {
452238e8d5ffd8 Florian Westphal  2018-07-11  2617  			type = nf_tables_chain_type_lookup(net, nla[NFTA_CHAIN_TYPE],
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2618  							   family, true);
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  2619  			if (IS_ERR(type)) {
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  2620  				NL_SET_BAD_ATTR(extack, nla[NFTA_CHAIN_TYPE]);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2621  				return PTR_ERR(type);
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2622  			}
a70566b815bfff Florian Westphal  2026-09-29  2623  		} else {
a70566b815bfff Florian Westphal  2026-09-29  2624  			type = nft_chain_type_get(family, NFT_CHAIN_T_DEFAULT);
a70566b815bfff Florian Westphal  2026-09-29  2625  			if (!type)
a70566b815bfff Florian Westphal  2026-09-29  2626  				return -EOPNOTSUPP;
983c4fcb81d6bd Pablo Neira Ayuso 2021-05-19  2627  		}
a70566b815bfff Florian Westphal  2026-09-29  2628  
a70566b815bfff Florian Westphal  2026-09-29  2629  		err = -EOPNOTSUPP;
d25e2e9388eda6 Pablo Neira Ayuso 2020-10-14  2630  		if (hook->num >= NFT_MAX_HOOKS || !(type->hook_mask & (1 << hook->num)))
a70566b815bfff Florian Westphal  2026-09-29  2631  			goto out_put_type;
84ba7dd71add05 Florian Westphal  2017-12-08  2632  
84ba7dd71add05 Florian Westphal  2017-12-08  2633  		if (type->type == NFT_CHAIN_T_NAT &&
84ba7dd71add05 Florian Westphal  2017-12-08  2634  		    hook->priority <= NF_IP_PRI_CONNTRACK)
a70566b815bfff Florian Westphal  2026-09-29  2635  			goto out_put_type;
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2636  	} else {
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2637  		if (ha[NFTA_HOOK_HOOKNUM]) {
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2638  			hook->num = ntohl(nla_get_be32(ha[NFTA_HOOK_HOOKNUM]));
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2639  			if (hook->num != basechain->ops.hooknum)
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2640  				return -EOPNOTSUPP;
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2641  		}
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2642  		if (ha[NFTA_HOOK_PRIORITY]) {
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2643  			hook->priority = ntohl(nla_get_be32(ha[NFTA_HOOK_PRIORITY]));
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2644  			if (hook->priority != basechain->ops.priority)
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2645  				return -EOPNOTSUPP;
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2646  		}
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2647  
aaba7ddc8507f4 Pablo Neira Ayuso 2023-12-14  2648  		if (nla[NFTA_CHAIN_TYPE]) {
aaba7ddc8507f4 Pablo Neira Ayuso 2023-12-14  2649  			type = __nf_tables_chain_type_lookup(nla[NFTA_CHAIN_TYPE],
aaba7ddc8507f4 Pablo Neira Ayuso 2023-12-14  2650  							     family);
aaba7ddc8507f4 Pablo Neira Ayuso 2023-12-14  2651  			if (!type) {
aaba7ddc8507f4 Pablo Neira Ayuso 2023-12-14  2652  				NL_SET_BAD_ATTR(extack, nla[NFTA_CHAIN_TYPE]);
aaba7ddc8507f4 Pablo Neira Ayuso 2023-12-14 @2653  				return -ENOENT;
aaba7ddc8507f4 Pablo Neira Ayuso 2023-12-14  2654  			}
aaba7ddc8507f4 Pablo Neira Ayuso 2023-12-14  2655  		} else {
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2656  			type = basechain->type;
a70566b815bfff Florian Westphal  2026-09-29  2657  			__module_get(type->owner);
b9703ed44ffbfb Pablo Neira Ayuso 2023-04-21  2658  		}
aaba7ddc8507f4 Pablo Neira Ayuso 2023-12-14  2659  	}
84ba7dd71add05 Florian Westphal  2017-12-08  2660  
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2661  	hook->type = type;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2662  
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2663  	INIT_LIST_HEAD(&hook->list);
d3519cb89f6d59 Pablo Neira Ayuso 2020-10-08  2664  	if (nft_base_chain_netdev(family, hook->num)) {
207296f1a03bfe Pablo Neira Ayuso 2023-04-21  2665  		err = nft_chain_parse_netdev(net, ha, &hook->list, extack, flags);
a70566b815bfff Florian Westphal  2026-09-29  2666  		if (err < 0)
a70566b815bfff Florian Westphal  2026-09-29  2667  			goto out_put_type;
d54725cd11a57c Pablo Neira Ayuso 2019-10-16  2668  	} else if (ha[NFTA_HOOK_DEV] || ha[NFTA_HOOK_DEVS]) {
a70566b815bfff Florian Westphal  2026-09-29  2669  		err = -EOPNOTSUPP;
a70566b815bfff Florian Westphal  2026-09-29  2670  		goto out_put_type;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2671  	}
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2672  
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2673  	return 0;
a70566b815bfff Florian Westphal  2026-09-29  2674  
a70566b815bfff Florian Westphal  2026-09-29  2675  out_put_type:
a70566b815bfff Florian Westphal  2026-09-29  2676  	module_put(type->owner);
a70566b815bfff Florian Westphal  2026-09-29  2677  	return err;
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2678  }
508f8ccdab0ef5 Pablo Neira Ayuso 2016-08-02  2679  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
