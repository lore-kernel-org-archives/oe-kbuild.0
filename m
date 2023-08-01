Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720C4DC7B
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Aug 2023 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690908088; x=1722444088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37tg3wgPcFspuYA3y62nzvMRW3EKnojyKluas/IbT3E=;
  b=Kp8ulCeh+8OP0IM6SllPJlwoVxDbtUXmkT5ErG7wFn7gvStUMuzV4NHB
   ljhXM4qptGtKSLxRu5mSJ9X3z2bYUp3fM2YsXA5IK8z+81NMIfugfYokl
   0C3XE3bbs+60yF/kmLNS2CTP6khaogD4ncntNVov6yZD/rymOqhuyLJfy
   4W8qyfCL5VEjEI4qfeo6DopX5bKnDHUGdsKnjd/tVkofEZPmh3PZWXvRI
   RsMJe63WcYmEoY+1VSBYrUv29VfRNQZgYyPSiL9NeCw91pP2FGFeqIVam
   eF6YsPIEDLoc62R702AgNByksehpXOIz93ElpjcX3SlAq7xLcCQtM2ZJK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372990556"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="372990556"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 09:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="818862570"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="818862570"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Aug 2023 09:41:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQsR4-0000R5-0E;
	Tue, 01 Aug 2023 16:41:26 +0000
Date: Wed, 2 Aug 2023 00:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC net-next v2 1/7] net: openvswitch: add datapath flow drop
 reason
Message-ID: <202308020058.GWV6FTPm-lkp@intel.com>
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
In-Reply-To: <20230801151649.744695-2-amorenoz@redhat.com>
References: <20230801151649.744695-2-amorenoz@redhat.com>
TO: Adrian Moreno <amorenoz@redhat.com>

Hi Adrian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Moreno/net-openvswitch-add-datapath-flow-drop-reason/20230801-232241
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230801151649.744695-2-amorenoz%40redhat.com
patch subject: [RFC net-next v2 1/7] net: openvswitch: add datapath flow drop reason
:::::: branch date: 73 minutes ago
:::::: commit date: 73 minutes ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230802/202308020058.GWV6FTPm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020058.GWV6FTPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308020058.GWV6FTPm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/openvswitch/actions.c: In function 'sample':
>> net/openvswitch/actions.c:1040:47: warning: implicit conversion from 'enum ovs_drop_reason' to 'enum skb_drop_reason' [-Wenum-conversion]
    1040 |                         kfree_skb_reason(skb, OVS_DROP_FLOW);
         |                                               ^~~~~~~~~~~~~
   net/openvswitch/actions.c: In function 'do_execute_actions':
   net/openvswitch/actions.c:1496:31: warning: implicit conversion from 'enum ovs_drop_reason' to 'enum skb_drop_reason' [-Wenum-conversion]
    1496 |         kfree_skb_reason(skb, OVS_DROP_FLOW);
         |                               ^~~~~~~~~~~~~


vim +1040 net/openvswitch/actions.c

744676e777207f Matteo Croce       2020-02-15  1017  
798c166173ffb5 andy zhou          2017-03-20  1018  /* When 'last' is true, sample() should always consume the 'skb'.
798c166173ffb5 andy zhou          2017-03-20  1019   * Otherwise, sample() should keep 'skb' intact regardless what
798c166173ffb5 andy zhou          2017-03-20  1020   * actions are executed within sample().
798c166173ffb5 andy zhou          2017-03-20  1021   */
ccb1352e76cff0 Jesse Gross        2011-10-25  1022  static int sample(struct datapath *dp, struct sk_buff *skb,
ccea74457bbdaf Neil McKee         2015-05-26  1023  		  struct sw_flow_key *key, const struct nlattr *attr,
798c166173ffb5 andy zhou          2017-03-20  1024  		  bool last)
ccb1352e76cff0 Jesse Gross        2011-10-25  1025  {
798c166173ffb5 andy zhou          2017-03-20  1026  	struct nlattr *actions;
798c166173ffb5 andy zhou          2017-03-20  1027  	struct nlattr *sample_arg;
798c166173ffb5 andy zhou          2017-03-20  1028  	int rem = nla_len(attr);
798c166173ffb5 andy zhou          2017-03-20  1029  	const struct sample_arg *arg;
bef7f7567a104a andy zhou          2017-03-20  1030  	bool clone_flow_key;
ccb1352e76cff0 Jesse Gross        2011-10-25  1031  
798c166173ffb5 andy zhou          2017-03-20  1032  	/* The first action is always 'OVS_SAMPLE_ATTR_ARG'. */
798c166173ffb5 andy zhou          2017-03-20  1033  	sample_arg = nla_data(attr);
798c166173ffb5 andy zhou          2017-03-20  1034  	arg = nla_data(sample_arg);
798c166173ffb5 andy zhou          2017-03-20  1035  	actions = nla_next(sample_arg, &rem);
e05176a3283822 Wenyu Zhang        2015-08-05  1036  
798c166173ffb5 andy zhou          2017-03-20  1037  	if ((arg->probability != U32_MAX) &&
a251c17aa558d8 Jason A. Donenfeld 2022-10-05  1038  	    (!arg->probability || get_random_u32() > arg->probability)) {
798c166173ffb5 andy zhou          2017-03-20  1039  		if (last)
d6647a78fa3e11 Adrian Moreno      2023-08-01 @1040  			kfree_skb_reason(skb, OVS_DROP_FLOW);
ccb1352e76cff0 Jesse Gross        2011-10-25  1041  		return 0;
ccb1352e76cff0 Jesse Gross        2011-10-25  1042  	}
651887b0c22cff Simon Horman       2014-07-21  1043  
bef7f7567a104a andy zhou          2017-03-20  1044  	clone_flow_key = !arg->exec;
bef7f7567a104a andy zhou          2017-03-20  1045  	return clone_execute(dp, skb, key, 0, actions, rem, last,
bef7f7567a104a andy zhou          2017-03-20  1046  			     clone_flow_key);
971427f353f3c4 Andy Zhou          2014-09-15  1047  }
971427f353f3c4 Andy Zhou          2014-09-15  1048  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
