Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA33147357
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 22:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695421453; x=1726957453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2k8AUQTIADFa+Sp2kTuX1MEyb+SphZWGzfi9FFLmUyI=;
  b=CXu6CTXHKDXMRI6B2KeZiT/OEQYvopO4y7FGnjhFhRvI5E+R6QPt2KX1
   +Fcw2RNeC8pgyWvi3lexu5KpCxaWaYdV10uAgym+KLcja9pVivB+hHL79
   7xH4C9UhpDkm4jy7SSvuwAsW+xxtCN9hE+6p3TrgV8JhqScKEEc9sAASb
   nggqTG4Tw5BewkwkUtYtx9K240KYP/2LEs3caAhbv8kaLJ+/wqq4AE45C
   2U+8RdUQN1O8+pz6CrlrfR5UhTeX8ZfwODk4KHQkTgz0da+TqXjgTA313
   ELgegopLZcdfz6GtLyYhPFObQrW3z6YzxhTbXyTalaqWdWJztMWws7Bhs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360340290"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="360340290"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 15:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813244482"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="813244482"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Sep 2023 15:24:11 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjoZF-0001P7-0W;
	Fri, 22 Sep 2023 22:24:09 +0000
Date: Sat, 23 Sep 2023 06:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [nf PATCH v2] netfilter: nf_tables: Fix entries val in rule
 reset audit log
Message-ID: <202309230628.jYkaSoee-lkp@intel.com>
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
In-Reply-To: <20230908081033.30806-1-phil@nwl.cc>
References: <20230908081033.30806-1-phil@nwl.cc>
TO: Phil Sutter <phil@nwl.cc>

Hi Phil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on netfilter-nf/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Phil-Sutter/netfilter-nf_tables-Fix-entries-val-in-rule-reset-audit-log/20230908-161249
base:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20230908081033.30806-1-phil%40nwl.cc
patch subject: [nf PATCH v2] netfilter: nf_tables: Fix entries val in rule reset audit log
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20230922 (https://download.01.org/0day-ci/archive/20230923/202309230628.jYkaSoee-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230628.jYkaSoee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309230628.jYkaSoee-lkp@intel.com/

smatch warnings:
net/netfilter/nf_tables_api.c:3546 nf_tables_dump_rules() error: uninitialized symbol 'ret'.

vim +/ret +3546 net/netfilter/nf_tables_api.c

241faeceb849cb Phil Sutter       2018-12-12  3486  
96518518cc417b Patrick McHardy   2013-10-14  3487  static int nf_tables_dump_rules(struct sk_buff *skb,
96518518cc417b Patrick McHardy   2013-10-14  3488  				struct netlink_callback *cb)
96518518cc417b Patrick McHardy   2013-10-14  3489  {
96518518cc417b Patrick McHardy   2013-10-14  3490  	const struct nfgenmsg *nfmsg = nlmsg_data(cb->nlh);
6e1f760e13c75e Pablo Neira Ayuso 2016-07-19  3491  	const struct nft_rule_dump_ctx *ctx = cb->data;
241faeceb849cb Phil Sutter       2018-12-12  3492  	struct nft_table *table;
96518518cc417b Patrick McHardy   2013-10-14  3493  	const struct nft_chain *chain;
35118755b61ff5 Phil Sutter       2023-09-08  3494  	unsigned int idx = 0, s_idx;
99633ab29b2131 Pablo Neira Ayuso 2013-10-10  3495  	struct net *net = sock_net(skb->sk);
96518518cc417b Patrick McHardy   2013-10-14  3496  	int family = nfmsg->nfgen_family;
0854db2aaef3fc Florian Westphal  2021-04-01  3497  	struct nftables_pernet *nft_net;
8daa8fde3fc3f0 Phil Sutter       2022-10-14  3498  	bool reset = false;
35118755b61ff5 Phil Sutter       2023-09-08  3499  	int ret;
8daa8fde3fc3f0 Phil Sutter       2022-10-14  3500  
8daa8fde3fc3f0 Phil Sutter       2022-10-14  3501  	if (NFNL_MSG_TYPE(cb->nlh->nlmsg_type) == NFT_MSG_GETRULE_RESET)
8daa8fde3fc3f0 Phil Sutter       2022-10-14  3502  		reset = true;
96518518cc417b Patrick McHardy   2013-10-14  3503  
e688a7f8c6cb7a Pablo Neira Ayuso 2014-07-01  3504  	rcu_read_lock();
d59d2f82f984df Pablo Neira Ayuso 2021-04-23  3505  	nft_net = nft_pernet(net);
3400278328285a Pablo Neira Ayuso 2022-08-09  3506  	cb->seq = READ_ONCE(nft_net->base_seq);
38e029f14a9702 Pablo Neira Ayuso 2014-07-01  3507  
0854db2aaef3fc Florian Westphal  2021-04-01  3508  	list_for_each_entry_rcu(table, &nft_net->tables, list) {
98319cb9089844 Pablo Neira Ayuso 2018-01-09  3509  		if (family != NFPROTO_UNSPEC && family != table->family)
96518518cc417b Patrick McHardy   2013-10-14  3510  			continue;
96518518cc417b Patrick McHardy   2013-10-14  3511  
36596dadf54a92 Pablo Neira Ayuso 2018-01-09  3512  		if (ctx && ctx->table && strcmp(ctx->table, table->name) != 0)
6e1f760e13c75e Pablo Neira Ayuso 2016-07-19  3513  			continue;
6e1f760e13c75e Pablo Neira Ayuso 2016-07-19  3514  
715849ab31f8e5 Pablo Neira Ayuso 2019-01-08  3515  		if (ctx && ctx->table && ctx->chain) {
241faeceb849cb Phil Sutter       2018-12-12  3516  			struct rhlist_head *list, *tmp;
6e1f760e13c75e Pablo Neira Ayuso 2016-07-19  3517  
241faeceb849cb Phil Sutter       2018-12-12  3518  			list = rhltable_lookup(&table->chains_ht, ctx->chain,
241faeceb849cb Phil Sutter       2018-12-12  3519  					       nft_chain_ht_params);
241faeceb849cb Phil Sutter       2018-12-12  3520  			if (!list)
96518518cc417b Patrick McHardy   2013-10-14  3521  				goto done;
38e029f14a9702 Pablo Neira Ayuso 2014-07-01  3522  
241faeceb849cb Phil Sutter       2018-12-12  3523  			rhl_for_each_entry_rcu(chain, tmp, list, rhlhead) {
241faeceb849cb Phil Sutter       2018-12-12  3524  				if (!nft_is_active(net, chain))
241faeceb849cb Phil Sutter       2018-12-12  3525  					continue;
241faeceb849cb Phil Sutter       2018-12-12  3526  				__nf_tables_dump_rules(skb, &idx,
8daa8fde3fc3f0 Phil Sutter       2022-10-14  3527  						       cb, table, chain, reset);
241faeceb849cb Phil Sutter       2018-12-12  3528  				break;
96518518cc417b Patrick McHardy   2013-10-14  3529  			}
35118755b61ff5 Phil Sutter       2023-09-08  3530  			if (reset && idx > cb->args[0])
35118755b61ff5 Phil Sutter       2023-09-08  3531  				audit_log_rule_reset(table, cb->seq,
35118755b61ff5 Phil Sutter       2023-09-08  3532  						     idx - cb->args[0]);
241faeceb849cb Phil Sutter       2018-12-12  3533  			goto done;
96518518cc417b Patrick McHardy   2013-10-14  3534  		}
241faeceb849cb Phil Sutter       2018-12-12  3535  
35118755b61ff5 Phil Sutter       2023-09-08  3536  		s_idx = max_t(long, idx, cb->args[0]);
241faeceb849cb Phil Sutter       2018-12-12  3537  		list_for_each_entry_rcu(chain, &table->chains, list) {
35118755b61ff5 Phil Sutter       2023-09-08  3538  			ret = __nf_tables_dump_rules(skb, &idx,
35118755b61ff5 Phil Sutter       2023-09-08  3539  						     cb, table, chain, reset);
35118755b61ff5 Phil Sutter       2023-09-08  3540  			if (ret)
35118755b61ff5 Phil Sutter       2023-09-08  3541  				break;
241faeceb849cb Phil Sutter       2018-12-12  3542  		}
35118755b61ff5 Phil Sutter       2023-09-08  3543  		if (reset && idx > s_idx)
35118755b61ff5 Phil Sutter       2023-09-08  3544  			audit_log_rule_reset(table, cb->seq, idx - s_idx);
241faeceb849cb Phil Sutter       2018-12-12  3545  
35118755b61ff5 Phil Sutter       2023-09-08 @3546  		if ((ctx && ctx->table) || ret)
241faeceb849cb Phil Sutter       2018-12-12  3547  			break;
96518518cc417b Patrick McHardy   2013-10-14  3548  	}
96518518cc417b Patrick McHardy   2013-10-14  3549  done:
e688a7f8c6cb7a Pablo Neira Ayuso 2014-07-01  3550  	rcu_read_unlock();
310529e663ed97 Phil Sutter       2018-12-30  3551  
310529e663ed97 Phil Sutter       2018-12-30  3552  	cb->args[0] = idx;
96518518cc417b Patrick McHardy   2013-10-14  3553  	return skb->len;
96518518cc417b Patrick McHardy   2013-10-14  3554  }
96518518cc417b Patrick McHardy   2013-10-14  3555  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
