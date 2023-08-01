Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50A2150D
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Aug 2023 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690911100; x=1722447100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsL+jJxQ+JqQ6RUYzMWsnC5zP0wxJTHqPe6fV00WLcg=;
  b=AC9uD7QV/4J09BM7LrHAMxGfvULlN1sTPkzMIUxhlw7OjsV99xyX+5IH
   GOlKiIM1AwVnVubBd4YKSkCg4xzM9FaE5EkIPIMScN7MqDowFs+hvkqOL
   E7XtyE7YaTxo/tjOSMPVbis7FrvKBmXiZdbO5zgNFOa4201f0vUaDrT04
   imtZSOerOAiFSi9mdXsMIE1lorE2AY/unI/4tVAbF/oau4nNFG57LMxzd
   3mPo6bpu0MwAqGIDsPBnqVAyW1msB2YbB17ViByh5sdYPLoCkw/bVAQ/E
   9iyqijmJLr9mqXErbBe1LtO/rICecVyBYI1onkEDYt9bCAy6a7Xj9ly15
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="354291970"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="354291970"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 10:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="678734070"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="678734070"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Aug 2023 10:31:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQtDT-0000T5-0v;
	Tue, 01 Aug 2023 17:31:27 +0000
Date: Wed, 2 Aug 2023 01:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC net-next v2 5/7] net: openvswitch: add misc error drop
 reasons
Message-ID: <202308020103.R4iuCxzm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230801151649.744695-6-amorenoz@redhat.com>
References: <20230801151649.744695-6-amorenoz@redhat.com>
TO: Adrian Moreno <amorenoz@redhat.com>

Hi Adrian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Moreno/net-openvswitch-add-datapath-flow-drop-reason/20230801-232241
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230801151649.744695-6-amorenoz%40redhat.com
patch subject: [RFC net-next v2 5/7] net: openvswitch: add misc error drop reasons
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230802/202308020103.R4iuCxzm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020103.R4iuCxzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308020103.R4iuCxzm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/openvswitch/conntrack.c: In function 'ovs_ct_execute':
>> net/openvswitch/conntrack.c:1039:39: warning: implicit conversion from 'enum ovs_drop_reason' to 'enum skb_drop_reason' [-Wenum-conversion]
    1039 |                 kfree_skb_reason(skb, OVS_DROP_CONNTRACK);
         |                                       ^~~~~~~~~~~~~~~~~~


vim +1039 net/openvswitch/conntrack.c

7d904c7bcd51f7 Jarno Rajahalme    2016-06-21  1004  
74c16618137f15 Joe Stringer       2015-10-25  1005  /* Returns 0 on success, -EINPROGRESS if 'skb' is stolen, or other nonzero
74c16618137f15 Joe Stringer       2015-10-25  1006   * value if 'skb' is freed.
74c16618137f15 Joe Stringer       2015-10-25  1007   */
7f8a436eaa2c3d Joe Stringer       2015-08-26  1008  int ovs_ct_execute(struct net *net, struct sk_buff *skb,
7f8a436eaa2c3d Joe Stringer       2015-08-26  1009  		   struct sw_flow_key *key,
7f8a436eaa2c3d Joe Stringer       2015-08-26  1010  		   const struct ovs_conntrack_info *info)
7f8a436eaa2c3d Joe Stringer       2015-08-26  1011  {
7f8a436eaa2c3d Joe Stringer       2015-08-26  1012  	int nh_ofs;
7f8a436eaa2c3d Joe Stringer       2015-08-26  1013  	int err;
7f8a436eaa2c3d Joe Stringer       2015-08-26  1014  
7f8a436eaa2c3d Joe Stringer       2015-08-26  1015  	/* The conntrack module expects to be working at L3. */
7f8a436eaa2c3d Joe Stringer       2015-08-26  1016  	nh_ofs = skb_network_offset(skb);
75f01a4c9cc291 Lance Richardson   2017-01-12  1017  	skb_pull_rcsum(skb, nh_ofs);
7f8a436eaa2c3d Joe Stringer       2015-08-26  1018  
67fc5d7ffbd4f9 Xin Long           2023-02-07  1019  	err = nf_ct_skb_network_trim(skb, info->family);
67fc5d7ffbd4f9 Xin Long           2023-02-07  1020  	if (err) {
67fc5d7ffbd4f9 Xin Long           2023-02-07  1021  		kfree_skb(skb);
9382fe71c00584 Ed Swierk          2018-01-31  1022  		return err;
67fc5d7ffbd4f9 Xin Long           2023-02-07  1023  	}
9382fe71c00584 Ed Swierk          2018-01-31  1024  
7f8a436eaa2c3d Joe Stringer       2015-08-26  1025  	if (key->ip.frag != OVS_FRAG_TYPE_NONE) {
1b83bf4489cbc4 Xin Long           2023-02-07  1026  		err = ovs_ct_handle_fragments(net, key, info->zone.id,
1b83bf4489cbc4 Xin Long           2023-02-07  1027  					      info->family, skb);
7f8a436eaa2c3d Joe Stringer       2015-08-26  1028  		if (err)
7f8a436eaa2c3d Joe Stringer       2015-08-26  1029  			return err;
7f8a436eaa2c3d Joe Stringer       2015-08-26  1030  	}
7f8a436eaa2c3d Joe Stringer       2015-08-26  1031  
ab38a7b5a4493a Joe Stringer       2015-10-06  1032  	if (info->commit)
7d904c7bcd51f7 Jarno Rajahalme    2016-06-21  1033  		err = ovs_ct_commit(net, key, info, skb);
7f8a436eaa2c3d Joe Stringer       2015-08-26  1034  	else
7f8a436eaa2c3d Joe Stringer       2015-08-26  1035  		err = ovs_ct_lookup(net, key, info, skb);
7f8a436eaa2c3d Joe Stringer       2015-08-26  1036  
7d42e84eb99daf Christophe JAILLET 2021-04-04  1037  	skb_push_rcsum(skb, nh_ofs);
74c16618137f15 Joe Stringer       2015-10-25  1038  	if (err)
05faae6f4ad870 Adrian Moreno      2023-08-01 @1039  		kfree_skb_reason(skb, OVS_DROP_CONNTRACK);
7f8a436eaa2c3d Joe Stringer       2015-08-26  1040  	return err;
7f8a436eaa2c3d Joe Stringer       2015-08-26  1041  }
7f8a436eaa2c3d Joe Stringer       2015-08-26  1042  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
