Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E6079920
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jan 2024 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706640608; cv=none; b=M32bstt4dMSaDfy6oxcrkweBQ+msuzbJ7/NcOaiONeTbgSjun6Un5DETv6IcMCBD9LP9vjblcRzxhjC+/uZgfa3dM3/4zcvS/HfvnCZ++7EnWLPVIvtIusVeAtpQVFNgUzer7P4d4dkkIH3Qsx/IBJ68F79CwzUrhHo11+iaOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706640608; c=relaxed/simple;
	bh=8OCsJaBzeAavQXKeCHpwOXowO3WwURogqzEkOWviGTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uB3REKpIPMmyQa8oDFzkCNh3F82NgVnZzKm5bLi/QCuOW4TXOkhlyBCLmoCNxD1UYkUOWnUaVe8b9lBLviu5EJnkkqoC9DLP2h1hzogNWHC9GbX2EnmhXH4JisBKnHoSlel3mWATDvyUWlQiWVN3nciljLjsN8LOTgEQNiUIyfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpBNVP+p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpBNVP+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706640606; x=1738176606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8OCsJaBzeAavQXKeCHpwOXowO3WwURogqzEkOWviGTw=;
  b=UpBNVP+p55FAVOw2sYE0nPqtlPjQ6Fou+DbGDwO8STzn6Hvl6A7zc81A
   kYyUWgIaVvYNpFd7IMMw1jSTYuU3Cu2XgJBddN7SMpC4kktu74rqfi0lF
   gF9siRF/GuG/hWufFtg6kQ2hg1HmN8T/vxfT6MY+dYQ1EaH9p1I0hEmVj
   BD9qZlKyCdwRLO36cDQgYLny5GgqSK/sQCHzKaKx+Y4wBzA5rdro0r0jH
   rFeuS9WgmYvLYC1fJzXY13fQgAeXz4dpbsGSCW8n4uPivSjCy+xGzPJFc
   vWFQNwFCGZqz94tp/24kSjJvHlclZPTjMYgoq20l8Oz2Pftjev3dhUNhJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10121463"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="10121463"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 10:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="907586394"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="907586394"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2024 10:50:03 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUtBJ-0000hk-25;
	Tue, 30 Jan 2024 18:50:01 +0000
Date: Wed, 31 Jan 2024 02:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2540/2827] net/ipv4/netfilter/iptable_nat.c:111:
 undefined reference to `ipt_alloc_initial_table'
Message-ID: <202401310217.MOObXEB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: net/ipv4/netfilter/iptable_nat.c:111: undefined reference to `ipt_alloc_initial_table'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Florian Westphal <fw@strlen.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
commit: a9525c7f6219cee9284c0031c5930e8d41384677 [2540/2827] netfilter: xtables: allow xtables-nft only builds
:::::: branch date: 16 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-061-20240130 (https://download.01.org/0day-ci/archive/20240131/202401310217.MOObXEB0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310217.MOObXEB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401310217.MOObXEB0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/netfilter/iptable_nat.o: in function `iptable_nat_table_init':
>> net/ipv4/netfilter/iptable_nat.c:111: undefined reference to `ipt_alloc_initial_table'
>> ld: net/ipv4/netfilter/iptable_nat.c:115: undefined reference to `ipt_register_table'
>> ld: net/ipv4/netfilter/iptable_nat.c:123: undefined reference to `ipt_unregister_table_exit'
   ld: net/ipv4/netfilter/iptable_nat.o: in function `iptable_nat_net_exit':
>> net/ipv4/netfilter/iptable_nat.c:136: undefined reference to `ipt_unregister_table_exit'
>> ld: net/ipv4/netfilter/iptable_nat.o:net/ipv4/netfilter/iptable_nat.c:32: undefined reference to `ipt_do_table'
>> ld: net/ipv4/netfilter/iptable_nat.o:(.rodata+0x18): undefined reference to `ipt_do_table'
   ld: net/ipv4/netfilter/iptable_nat.o:(.rodata+0x30): undefined reference to `ipt_do_table'
   ld: net/ipv4/netfilter/iptable_nat.o:(.rodata+0x48): undefined reference to `ipt_do_table'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IP6_NF_IPTABLES_LEGACY
   Depends on [m]: NET [=y] && INET [=y] && IPV6 [=m] && NETFILTER [=y]
   Selected by [y]:
   - IP_NF_NAT [=y] && NET [=y] && INET [=y] && NETFILTER [=y] && IP_NF_IPTABLES [=y] && NF_CONNTRACK [=y]


vim +111 net/ipv4/netfilter/iptable_nat.c

5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   31  
591bb2789bc2a9 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2017-07-26  @32  static const struct nf_hook_ops nf_nat_ipv4_ops[] = {
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   33  	{
8844e01062ddd8 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-10-11   34  		.hook		= ipt_do_table,
24c232d8e911ef net/ipv4/netfilter/nf_nat_standalone.c Jan Engelhardt   2009-06-13   35  		.pf		= NFPROTO_IPV4,
6e23ae2a48750b net/ipv4/netfilter/nf_nat_standalone.c Patrick McHardy  2007-11-19   36  		.hooknum	= NF_INET_PRE_ROUTING,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   37  		.priority	= NF_IP_PRI_NAT_DST,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   38  	},
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   39  	{
8844e01062ddd8 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-10-11   40  		.hook		= ipt_do_table,
24c232d8e911ef net/ipv4/netfilter/nf_nat_standalone.c Jan Engelhardt   2009-06-13   41  		.pf		= NFPROTO_IPV4,
6e23ae2a48750b net/ipv4/netfilter/nf_nat_standalone.c Patrick McHardy  2007-11-19   42  		.hooknum	= NF_INET_POST_ROUTING,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   43  		.priority	= NF_IP_PRI_NAT_SRC,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   44  	},
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   45  	{
8844e01062ddd8 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-10-11   46  		.hook		= ipt_do_table,
24c232d8e911ef net/ipv4/netfilter/nf_nat_standalone.c Jan Engelhardt   2009-06-13   47  		.pf		= NFPROTO_IPV4,
6e23ae2a48750b net/ipv4/netfilter/nf_nat_standalone.c Patrick McHardy  2007-11-19   48  		.hooknum	= NF_INET_LOCAL_OUT,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   49  		.priority	= NF_IP_PRI_NAT_DST,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   50  	},
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   51  	{
8844e01062ddd8 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-10-11   52  		.hook		= ipt_do_table,
24c232d8e911ef net/ipv4/netfilter/nf_nat_standalone.c Jan Engelhardt   2009-06-13   53  		.pf		= NFPROTO_IPV4,
6e23ae2a48750b net/ipv4/netfilter/nf_nat_standalone.c Patrick McHardy  2007-11-19   54  		.hooknum	= NF_INET_LOCAL_IN,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   55  		.priority	= NF_IP_PRI_NAT_SRC,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   56  	},
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   57  };
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02   58  
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   59  static int ipt_nat_register_lookups(struct net *net)
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   60  {
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   61  	struct iptable_nat_pernet *xt_nat_net;
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   62  	struct nf_hook_ops *ops;
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   63  	struct xt_table *table;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   64  	int i, ret;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   65  
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   66  	xt_nat_net = net_generic(net, iptable_nat_net_id);
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   67  	table = xt_find_table(net, NFPROTO_IPV4, "nat");
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   68  	if (WARN_ON_ONCE(!table))
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   69  		return -ENOENT;
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   70  
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   71  	ops = kmemdup(nf_nat_ipv4_ops, sizeof(nf_nat_ipv4_ops), GFP_KERNEL);
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   72  	if (!ops)
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   73  		return -ENOMEM;
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   74  
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   75  	for (i = 0; i < ARRAY_SIZE(nf_nat_ipv4_ops); i++) {
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   76  		ops[i].priv = table;
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   77  		ret = nf_nat_ipv4_register_fn(net, &ops[i]);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   78  		if (ret) {
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   79  			while (i)
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   80  				nf_nat_ipv4_unregister_fn(net, &ops[--i]);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   81  
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   82  			kfree(ops);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   83  			return ret;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   84  		}
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   85  	}
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   86  
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   87  	xt_nat_net->nf_nat_ops = ops;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   88  	return 0;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   89  }
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   90  
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   91  static void ipt_nat_unregister_lookups(struct net *net)
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   92  {
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   93  	struct iptable_nat_pernet *xt_nat_net = net_generic(net, iptable_nat_net_id);
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   94  	struct nf_hook_ops *ops = xt_nat_net->nf_nat_ops;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   95  	int i;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14   96  
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   97  	if (!ops)
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   98  		return;
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21   99  
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14  100  	for (i = 0; i < ARRAY_SIZE(nf_nat_ipv4_ops); i++)
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21  101  		nf_nat_ipv4_unregister_fn(net, &ops[i]);
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21  102  
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21  103  	kfree(ops);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14  104  }
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14  105  
fdacd57c79b79a net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-08-03  106  static int iptable_nat_table_init(struct net *net)
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02  107  {
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012-08-26  108  	struct ipt_replace *repl;
a67dd266adf42a net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2016-02-25  109  	int ret;
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012-08-26  110  
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012-08-26 @111  	repl = ipt_alloc_initial_table(&nf_nat_ipv4_table);
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012-08-26  112  	if (repl == NULL)
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012-08-26  113  		return -ENOMEM;
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21  114  
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21 @115  	ret = ipt_register_table(net, &nf_nat_ipv4_table, repl, NULL);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14  116  	if (ret < 0) {
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14  117  		kfree(repl);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14  118  		return ret;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14  119  	}
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14  120  
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21  121  	ret = ipt_nat_register_lookups(net);
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21  122  	if (ret < 0)
20a9df33594fe6 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21 @123  		ipt_unregister_table_exit(net, "nat");
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018-05-14  124  
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012-08-26  125  	kfree(repl);
a67dd266adf42a net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2016-02-25  126  	return ret;
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02  127  }
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012-08-26  128  
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020-06-22  129  static void __net_exit iptable_nat_net_pre_exit(struct net *net)
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020-06-22  130  {
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020-06-22  131  	ipt_nat_unregister_lookups(net);
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020-06-22  132  }
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020-06-22  133  
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012-08-26  134  static void __net_exit iptable_nat_net_exit(struct net *net)
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012-08-26  135  {
20a9df33594fe6 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021-04-21 @136  	ipt_unregister_table_exit(net, "nat");
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02  137  }
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006-12-02  138  

:::::: The code at line 111 was first introduced by commit
:::::: c7232c9979cba684c50b64c513c4a83c9aa70563 netfilter: add protocol independent NAT core

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
