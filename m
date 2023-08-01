Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD14722F09
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Aug 2023 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690898786; x=1722434786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5kmZwX+T+S7qyUJPnvcR9PFvnX0O/3zf907APcIPNnA=;
  b=gIiiBRMwQJL1D08QRYnavOtO+2oJZhyVhWZv6B+kWlBBLBpjkjyBRjqA
   x5MuY8AH6Bq8Z3vBeqk0WRqSHzrON1JIkPJVEQP3i8enudK19j6hJdxO7
   gf78b6peI1qrypnRs1aptxFlFYModFib/2gCmkZ2k6EtlkzrnqDVGG2jD
   neiwf3q79DVDN+XX0GV2k/ZxjWtf9KfWZAH+EUpGZNG8mEqEXW9W1tmYa
   1KrL6Q7frc7wHfvOlVz9duTr4qC36SqPUbTnSUgfu3K7Bdw2pe1kBvfCQ
   o+KpYPyXY9CbyF0P3svh/XD9GpbgYutRMy0mmL84algag85cVE+j+qu00
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369300289"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="369300289"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 07:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="798667561"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="798667561"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2023 07:05:59 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQq0c-0000Ks-2b;
	Tue, 01 Aug 2023 14:05:58 +0000
Date: Tue, 1 Aug 2023 22:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net-next PATCH v1 5/9] netdev-genl: Add netlink framework
 functions for napi
Message-ID: <202308012142.JralXUe0-lkp@intel.com>
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
In-Reply-To: <169059163779.3736.7602272507688648566.stgit@anambiarhost.jf.intel.com>
References: <169059163779.3736.7602272507688648566.stgit@anambiarhost.jf.intel.com>
TO: Amritha Nambiar <amritha.nambiar@intel.com>
TO: netdev@vger.kernel.org
TO: kuba@kernel.org
TO: davem@davemloft.net
CC: sridhar.samudrala@intel.com
CC: amritha.nambiar@intel.com

Hi Amritha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Amritha-Nambiar/net-Introduce-new-fields-for-napi-and-queue-associations/20230729-083646
base:   net-next/main
patch link:    https://lore.kernel.org/r/169059163779.3736.7602272507688648566.stgit%40anambiarhost.jf.intel.com
patch subject: [net-next PATCH v1 5/9] netdev-genl: Add netlink framework functions for napi
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20230730 (https://download.01.org/0day-ci/archive/20230801/202308012142.JralXUe0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012142.JralXUe0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308012142.JralXUe0-lkp@intel.com/

smatch warnings:
net/core/netdev-genl.c:369 netdev_nl_napi_get_dumpit() error: uninitialized symbol 'err'.

vim +/err +369 net/core/netdev-genl.c

1dd6a2baf41577 Amritha Nambiar 2023-07-28  332  
1dd6a2baf41577 Amritha Nambiar 2023-07-28  333  int netdev_nl_napi_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
1dd6a2baf41577 Amritha Nambiar 2023-07-28  334  {
68813f1fd8bd2d Amritha Nambiar 2023-07-28  335  	struct netdev_nl_dump_ctx *ctx = netdev_dump_ctx(cb);
68813f1fd8bd2d Amritha Nambiar 2023-07-28  336  	struct net *net = sock_net(skb->sk);
68813f1fd8bd2d Amritha Nambiar 2023-07-28  337  	struct net_device *netdev;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  338  	int idx = 0, s_idx, n_idx;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  339  	int h, s_h;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  340  	int err;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  341  
68813f1fd8bd2d Amritha Nambiar 2023-07-28  342  	s_h = ctx->dev_entry_hash;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  343  	s_idx = ctx->dev_entry_idx;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  344  	n_idx = ctx->napi_idx;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  345  
68813f1fd8bd2d Amritha Nambiar 2023-07-28  346  	rtnl_lock();
68813f1fd8bd2d Amritha Nambiar 2023-07-28  347  
68813f1fd8bd2d Amritha Nambiar 2023-07-28  348  	for (h = s_h; h < NETDEV_HASHENTRIES; h++, s_idx = 0) {
68813f1fd8bd2d Amritha Nambiar 2023-07-28  349  		struct hlist_head *head;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  350  
68813f1fd8bd2d Amritha Nambiar 2023-07-28  351  		idx = 0;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  352  		head = &net->dev_index_head[h];
68813f1fd8bd2d Amritha Nambiar 2023-07-28  353  		hlist_for_each_entry(netdev, head, index_hlist) {
68813f1fd8bd2d Amritha Nambiar 2023-07-28  354  			if (idx < s_idx)
68813f1fd8bd2d Amritha Nambiar 2023-07-28  355  				goto cont;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  356  			err = netdev_nl_napi_dump_entry(netdev, skb, cb, &n_idx);
68813f1fd8bd2d Amritha Nambiar 2023-07-28  357  			if (err == -EMSGSIZE)
68813f1fd8bd2d Amritha Nambiar 2023-07-28  358  				goto out;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  359  			n_idx = 0;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  360  			if (err < 0)
68813f1fd8bd2d Amritha Nambiar 2023-07-28  361  				break;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  362  cont:
68813f1fd8bd2d Amritha Nambiar 2023-07-28  363  			idx++;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  364  		}
68813f1fd8bd2d Amritha Nambiar 2023-07-28  365  	}
68813f1fd8bd2d Amritha Nambiar 2023-07-28  366  
68813f1fd8bd2d Amritha Nambiar 2023-07-28  367  	rtnl_unlock();
68813f1fd8bd2d Amritha Nambiar 2023-07-28  368  
68813f1fd8bd2d Amritha Nambiar 2023-07-28 @369  	return err;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  370  
68813f1fd8bd2d Amritha Nambiar 2023-07-28  371  out:
68813f1fd8bd2d Amritha Nambiar 2023-07-28  372  	rtnl_unlock();
68813f1fd8bd2d Amritha Nambiar 2023-07-28  373  
68813f1fd8bd2d Amritha Nambiar 2023-07-28  374  	ctx->dev_entry_idx = idx;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  375  	ctx->dev_entry_hash = h;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  376  	ctx->napi_idx = n_idx;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  377  	cb->seq = net->dev_base_seq;
68813f1fd8bd2d Amritha Nambiar 2023-07-28  378  
68813f1fd8bd2d Amritha Nambiar 2023-07-28  379  	return skb->len;
1dd6a2baf41577 Amritha Nambiar 2023-07-28  380  }
1dd6a2baf41577 Amritha Nambiar 2023-07-28  381  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
