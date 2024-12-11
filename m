Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2419179EA
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 00:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733876501; cv=none; b=VTgPDhB1Tol/Z+LuxeJJGdZ+AsxuKBdRKfccSSm6x4qFut/vHOR+ksR9ZAlmX34CI1fEgYrMG+COvvNDcDA0xALDTGN7h3RzRtLZMI70rt2h9+BP1lRE63G3b3jq+8c1Ovnv2+a/eUOI2OcvojmpPmG6GENceimEUBkWo3KNMd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733876501; c=relaxed/simple;
	bh=3EGtjIV6lzn5K7mwBp9nOGuc0978YxGTCdiEhPk9LQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AfJEFYQEcDkkBdxvV38yn2uw+NClQLBx9CwY4rkW2cW16m+cECLojenC8ghVdP927mpUiHG4KmG6xe/xa3+s1hQStPwE+pAjWHfSdKMmo0cTwsLzF72VLjekQuK3dIaUDTjjS7nQKjhiX0viSnSi7L7AuFNqZZQmeBo7mWRfjjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JL6lnoxd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JL6lnoxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733876500; x=1765412500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3EGtjIV6lzn5K7mwBp9nOGuc0978YxGTCdiEhPk9LQE=;
  b=JL6lnoxdtgN4GTy4L8A+AfZpO2RUyYHhSsRAbt11+LJvBkALd1fpyMBP
   Rkf5at2OTc8OHjOPojGxyLnImGrtJfVKh4ipCma5yJT/klNc9laGC7XgL
   K1/KnxKGIBNUagLoAKgD5V6e9jtz28Bj/wuhLqnYxEqDTstlm9Tpz35sV
   nG53Kl46+VthLdjKGS4J9N/P8pWwlFe3sUGsOVzNHNr5P9DztFfSqLEoH
   cygvDhCr0NS89SeOzdh0MQefTQhoYpRxzehtn2pIKwxABU5Ne9EZ3KfmH
   cunFB02RLdCUgJPEDaYShXTg+UI2W6ca9x+vIpnGo415R9I8C4EkXGuwn
   Q==;
X-CSE-ConnectionGUID: iabvSgeiRKO+2SE4H6WH+g==
X-CSE-MsgGUID: BJkvpDGaTc6uQtb+DlzMsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44714434"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="44714434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 16:21:39 -0800
X-CSE-ConnectionGUID: 8t0JTkpjTSGFAIr4uXId1w==
X-CSE-MsgGUID: vCBSngIoR7mspjgxgjb+LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95452988"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2024 16:21:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLATv-00065P-0F;
	Wed, 11 Dec 2024 00:21:35 +0000
Date: Wed, 11 Dec 2024 08:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:rdma-next 34/62] drivers/infiniband/core/nldev.c:2678
 nldev_mgmt_get_doit() error: uninitialized symbol 'sa_min_timeout'.
Message-ID: <202412110832.fhe95pCu-lkp@intel.com>
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
TO: Vlad Dumitrescu <vdumitrescu@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Sean Hefty <shefty@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   41a9ef1058fc527c0acde5e18fc830ffbc554152
commit: 757fd3c27069d4bb25ce01fd2f88cbe98b82184d [34/62] RDMA/nldev: Add sa-min-timeout management attribute
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-141-20241211 (https://download.01.org/0day-ci/archive/20241211/202412110832.fhe95pCu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412110832.fhe95pCu-lkp@intel.com/

New smatch warnings:
drivers/infiniband/core/nldev.c:2678 nldev_mgmt_get_doit() error: uninitialized symbol 'sa_min_timeout'.

Old smatch warnings:
drivers/infiniband/core/nldev.c:2965 rdma_nl_notify_event() warn: missing error code 'ret'

vim +/sa_min_timeout +2678 drivers/infiniband/core/nldev.c

060c642b2ab8b4 Mark Zhang      2024-06-16  2624  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2625  static int nldev_mgmt_get_doit(struct sk_buff *skb, struct nlmsghdr *nlh,
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2626  			       struct netlink_ext_ack *extack)
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2627  {
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2628  	struct nlattr *tb[RDMA_NLDEV_ATTR_MAX];
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2629  	struct ib_device *device;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2630  	struct sk_buff *msg;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2631  	u32 index;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2632  	u32 port;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2633  	u32 sa_min_timeout;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2634  	int ret;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2635  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2636  	ret = __nlmsg_parse(nlh, 0, tb, RDMA_NLDEV_ATTR_MAX - 1, nldev_policy,
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2637  			    NL_VALIDATE_LIBERAL, extack);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2638  	if (ret ||
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2639  	    !tb[RDMA_NLDEV_ATTR_DEV_INDEX] ||
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2640  	    !tb[RDMA_NLDEV_ATTR_PORT_INDEX])
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2641  		return -EINVAL;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2642  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2643  	index = nla_get_u32(tb[RDMA_NLDEV_ATTR_DEV_INDEX]);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2644  	device = ib_device_get_by_index(sock_net(skb->sk), index);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2645  	if (!device)
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2646  		return -EINVAL;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2647  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2648  	port = nla_get_u32(tb[RDMA_NLDEV_ATTR_PORT_INDEX]);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2649  	if (!rdma_is_port_valid(device, port)) {
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2650  		ret = -EINVAL;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2651  		goto err;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2652  	}
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2653  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2654  	if (rdma_cap_ib_sa(device, port)) {
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2655  		ret = ib_sa_min_timeout_get(device, port, &sa_min_timeout);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2656  		if (ret)
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2657  			goto err;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2658  	}
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2659  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2660  	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2661  	if (!msg) {
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2662  		ret = -ENOMEM;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2663  		goto err;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2664  	}
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2665  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2666  	nlh = nlmsg_put(
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2667  		msg, NETLINK_CB(skb).portid, nlh->nlmsg_seq,
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2668  		RDMA_NL_GET_TYPE(RDMA_NL_NLDEV, RDMA_NLDEV_CMD_MGMT_GET), 0, 0);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2669  	if (!nlh ||
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2670  	    fill_nldev_handle(msg, device) ||
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2671  	    nla_put_u32(msg, RDMA_NLDEV_ATTR_PORT_INDEX, port)) {
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2672  		ret = -EMSGSIZE;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2673  		goto err_msg;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2674  	}
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2675  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2676  	if (rdma_cap_ib_sa(device, port)) {
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2677  		ret = nla_put_u32(msg, RDMA_NLDEV_MGMT_ATTR_SA_MIN_TIMEOUT,
757fd3c27069d4 Vlad Dumitrescu 2024-11-14 @2678  				  sa_min_timeout);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2679  		if (ret)
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2680  			goto err_msg;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2681  	}
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2682  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2683  	nlmsg_end(msg, nlh);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2684  	return rdma_nl_unicast(sock_net(skb->sk), msg, NETLINK_CB(skb).portid);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2685  
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2686  err_msg:
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2687  	nlmsg_free(msg);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2688  err:
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2689  	ib_device_put(device);
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2690  	return ret;
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2691  }
757fd3c27069d4 Vlad Dumitrescu 2024-11-14  2692  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
