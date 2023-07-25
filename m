Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C541F17C
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Jul 2023 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690296151; x=1721832151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEVZ4gDDvxF2YxgI9cugFC19HU68srIUHQOh2+003dg=;
  b=DURSpVcSQxf2Z3seoM/2aWfDnzepLLyL4TxR/AaxPIYyt8OJC4VrD3p/
   8K6oNSlJz2Cy24mA5NgmOR6hBSg5XhRstaIbo+ACMz3oj3HxJ79xC6qkw
   k1MNwRlbEkbL17D8g3VOeYwBfji1z9ppk2gm/LieglomsFYExsEIWjhMo
   y6GXnAfEjGP8osm0AKDBC7VLlcuIpygmPmkg/B2BfnAqs2TlHtOzecTMQ
   dxzs/qylINn3t5FwlTzwqstS3dKFRxu5NKOOrk7Jc2aMr39ItxJbt/W+M
   2Z/ojTT+WJjmG/iVPT47eCmBHOkUErr1cbCn+JkIniWBd5IUPiVyWGnzK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="433997227"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="433997227"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791420219"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="791420219"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 07:42:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOJF6-00003n-1n;
	Tue, 25 Jul 2023 14:42:28 +0000
Date: Tue, 25 Jul 2023 22:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next] flow_dissector: Add IPSEC dissectors
Message-ID: <202307252253.1DutjtIg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/net/flow_dissector.h:442:50: sparse: sparse: shift too big (32) for type int"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230725032451.505189-1-rkannoth@marvell.com>
References: <20230725032451.505189-1-rkannoth@marvell.com>
TO: Ratheesh Kannoth <rkannoth@marvell.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: jhs@mojatatu.com
CC: xiyou.wangcong@gmail.com
CC: jiri@resnulli.us
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: Ratheesh Kannoth <rkannoth@marvell.com>

Hi Ratheesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ratheesh-Kannoth/flow_dissector-Add-IPSEC-dissectors/20230725-112644
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230725032451.505189-1-rkannoth%40marvell.com
patch subject: [PATCH net-next] flow_dissector: Add IPSEC dissectors
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: powerpc-randconfig-r093-20230725 (https://download.01.org/0day-ci/archive/20230725/202307252253.1DutjtIg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307252253.1DutjtIg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307252253.1DutjtIg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/flow_dissector.c: note: in included file (through include/linux/if_pppox.h):
   include/uapi/linux/if_pppox.h:153:29: sparse: sparse: array of flexible structures
   net/core/flow_dissector.c: note: in included file (through include/linux/skbuff.h):
>> include/net/flow_dissector.h:442:50: sparse: sparse: shift too big (32) for type int

vim +442 include/net/flow_dissector.h

bcc83839ffdb06 Tom Herbert       2015-09-01  433  
c6cc1ca7f4d70c Tom Herbert       2015-09-01  434  u32 flow_hash_from_keys(struct flow_keys *keys);
5dec597e5cd0f4 Matteo Croce      2019-10-29  435  void skb_flow_get_icmp_tci(const struct sk_buff *skb,
5dec597e5cd0f4 Matteo Croce      2019-10-29  436  			   struct flow_dissector_key_icmp *key_icmp,
f96533cded173b Alexander Lobakin 2021-03-14  437  			   const void *data, int thoff, int hlen);
c6cc1ca7f4d70c Tom Herbert       2015-09-01  438  
8de2d793daf784 Amir Vadai        2016-03-08  439  static inline bool dissector_uses_key(const struct flow_dissector *flow_dissector,
8de2d793daf784 Amir Vadai        2016-03-08  440  				      enum flow_dissector_key_id key_id)
8de2d793daf784 Amir Vadai        2016-03-08  441  {
8de2d793daf784 Amir Vadai        2016-03-08 @442  	return flow_dissector->used_keys & (1 << key_id);
8de2d793daf784 Amir Vadai        2016-03-08  443  }
8de2d793daf784 Amir Vadai        2016-03-08  444  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
