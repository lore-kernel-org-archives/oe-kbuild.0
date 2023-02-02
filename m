Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F39AD3A
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Feb 2023 23:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675381437; x=1706917437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uedu1G4IT0jKLvlBZEYWlOxuAdDHxUKWeVV0kPriKgs=;
  b=HJC6fMrXP+noUZcBxrjLZnvrjcAE4bz6j9DQlOU0eRdKvFFnkZxOpgqb
   X1wUvDDETYAtnI49TsOxqgcRNModYwhwMOx+K7y+j1+r6ngNC52K6vcAF
   IxpnIp5Wk6jNbMr2zZ4+/DwOWghHZWOPt8rv/drU85Dp9dyYEGPTnOKln
   ZlxpDwlNlN4FGSwDH1kRfy7JTB2yAmj7/4oBdeo0OhNsaEH9j6yXndN58
   y7QBZbxToWZKGfGlmX1hENUDhhqVNLh/aIb94m6lZ8YVzrflD2+FHZC4r
   CfHAPRMd5z79xgXpkaxz9kmNeaY+lrmw713z4NFD3nulZWCx8I/8iJcGK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393196561"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="393196561"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 15:43:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="789483393"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="789483393"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Feb 2023 15:43:56 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNjFD-0006xO-1O;
	Thu, 02 Feb 2023 23:43:55 +0000
Date: Fri, 3 Feb 2023 07:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] gro: optimise redundant parsing of packets
Message-ID: <202302030719.VvvUWPzr-lkp@intel.com>
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
In-Reply-To: <20230130130752.GA8015@debian>
References: <20230130130752.GA8015@debian>
TO: Richard Gobert <richardbgobert@gmail.com>
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: yoshfuji@linux-ipv6.org
TO: dsahern@kernel.org
TO: steffen.klassert@secunet.com
TO: lixiaoyan@google.com
TO: alexanderduyck@fb.com
TO: leon@kernel.org
TO: ye.xingchen@zte.com.cn
TO: iwienand@redhat.com
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Richard,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master horms-ipvs/master linus/master v6.2-rc6 next-20230202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Gobert/gro-decrease-size-of-CB/20230130-211021
patch link:    https://lore.kernel.org/r/20230130130752.GA8015%40debian
patch subject: [PATCH 2/2] gro: optimise redundant parsing of packets
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230203/202302030719.VvvUWPzr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
net/ipv4/af_inet.c:1641 inet_gro_complete() warn: potential spectre issue 'inet_offloads' [w]

vim +/inet_offloads +1641 net/ipv4/af_inet.c

f4713a3dfad045 Willem de Bruijn 2014-11-26  1621  
b8921ca83eed24 Tom Herbert      2016-05-18  1622  int inet_gro_complete(struct sk_buff *skb, int nhoff)
73cc19f1556b95 Herbert Xu       2008-12-15  1623  {
299603e8370a93 Jerry Chu        2013-12-11  1624  	__be16 newlen = htons(skb->len - nhoff);
299603e8370a93 Jerry Chu        2013-12-11  1625  	struct iphdr *iph = (struct iphdr *)(skb->data + nhoff);
bca49f843eac59 Vlad Yasevich    2012-11-15  1626  	const struct net_offload *ops;
5eba599d4a8c3c Richard Gobert   2023-01-30  1627  	int proto;
73cc19f1556b95 Herbert Xu       2008-12-15  1628  	int err = -ENOSYS;
73cc19f1556b95 Herbert Xu       2008-12-15  1629  
294acf1c01bace Paolo Abeni      2017-03-07  1630  	if (skb->encapsulation) {
294acf1c01bace Paolo Abeni      2017-03-07  1631  		skb_set_inner_protocol(skb, cpu_to_be16(ETH_P_IP));
c3caf1192f904d Jerry Chu        2014-07-14  1632  		skb_set_inner_network_header(skb, nhoff);
5eba599d4a8c3c Richard Gobert   2023-01-30  1633  		proto = iph->protocol;
5eba599d4a8c3c Richard Gobert   2023-01-30  1634  	} else {
5eba599d4a8c3c Richard Gobert   2023-01-30  1635  		proto = NAPI_GRO_CB(skb)->transport_proto;
294acf1c01bace Paolo Abeni      2017-03-07  1636  	}
c3caf1192f904d Jerry Chu        2014-07-14  1637  
73cc19f1556b95 Herbert Xu       2008-12-15  1638  	csum_replace2(&iph->check, iph->tot_len, newlen);
73cc19f1556b95 Herbert Xu       2008-12-15  1639  	iph->tot_len = newlen;
73cc19f1556b95 Herbert Xu       2008-12-15  1640  
bca49f843eac59 Vlad Yasevich    2012-11-15 @1641  	ops = rcu_dereference(inet_offloads[proto]);
f191a1d17f2270 Vlad Yasevich    2012-11-15  1642  	if (WARN_ON(!ops || !ops->callbacks.gro_complete))
627b94f75b82d1 Eric Dumazet     2021-11-23  1643  		goto out;
73cc19f1556b95 Herbert Xu       2008-12-15  1644  
299603e8370a93 Jerry Chu        2013-12-11  1645  	/* Only need to add sizeof(*iph) to get to the next hdr below
299603e8370a93 Jerry Chu        2013-12-11  1646  	 * because any hdr with option will have been flushed in
299603e8370a93 Jerry Chu        2013-12-11  1647  	 * inet_gro_receive().
299603e8370a93 Jerry Chu        2013-12-11  1648  	 */
028e0a4766844e Paolo Abeni      2018-12-14  1649  	err = INDIRECT_CALL_2(ops->callbacks.gro_complete,
028e0a4766844e Paolo Abeni      2018-12-14  1650  			      tcp4_gro_complete, udp4_gro_complete,
028e0a4766844e Paolo Abeni      2018-12-14  1651  			      skb, nhoff + sizeof(*iph));
73cc19f1556b95 Herbert Xu       2008-12-15  1652  
627b94f75b82d1 Eric Dumazet     2021-11-23  1653  out:
73cc19f1556b95 Herbert Xu       2008-12-15  1654  	return err;
73cc19f1556b95 Herbert Xu       2008-12-15  1655  }
73cc19f1556b95 Herbert Xu       2008-12-15  1656  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
