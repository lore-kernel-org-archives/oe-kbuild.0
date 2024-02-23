Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AACD29B
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Feb 2024 10:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708685308; cv=none; b=jf5XP77JUgTMK5LTdG4+qyXkiZk2D4/42r6lE1WFwGwxNieTIEDXsmhSLq6VsTLM3JK1nLMdPbO8pZedvM9gozejHFti2ySwcFLgovryJMLgqSAGS+XfvD/slg+lPNCvEeArvfwNrwohU606XpHWJk50GOjmInEqNMQ8YftapEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708685308; c=relaxed/simple;
	bh=e8pNYq32LqfQWupsKcvL2dlyEWELvAUr0NPs+9HCB3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Two5rAfkLCRYL+qASgZHTvCsMZiYp90j6xaNrtUAJ8r1JYFbpoo7IB03qj2zqvKKkWwjmmgadaUAUWDTxrjZJHkag65Ryad0pbxg7gDeR0SwU4Ob7BC3uaTjaqRVeSCRbgKQ1Me0h6q8n3OF6X0hzFO6M9Z0QyVSKbegiA4oxL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7u+mYWi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7u+mYWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708685306; x=1740221306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8pNYq32LqfQWupsKcvL2dlyEWELvAUr0NPs+9HCB3Y=;
  b=g7u+mYWirsu66eBWLlRpiva0waKK61+JGIPiQkCK/te3VO0SEYhQrxWW
   TCNEk14M6kuDGInNCGtnykAk/lMPBc3MwQbYidF5goFfro4EDlLwlWs6P
   dj8QgF82478bL3mTtjU91cvdiCgPNIf8/Q+1BO72jwmVJKRhrJVne5SCn
   Q/8BpdvRvj2aqn8LMNjn3vGmcG77PCBoTtjxdD5FZIw2aTtF+TgmbVyIE
   f1IItTsxfziQj4QFjtbdVqOdp1qf1BBTX9xvqH/m24rZDXl2OCa0sVC5D
   XY6wWlY21J5e1Eiks3dYyvH0QzMawjbdjDP4rBH82N/HadRvlTN6Fl1nX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3122541"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3122541"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 02:48:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="29033267"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2024 02:48:24 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdT6L-0007QW-1m;
	Fri, 23 Feb 2024 10:48:21 +0000
Date: Fri, 23 Feb 2024 18:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 1/2] netdev-genl: Add ifname for queue and NAPI
 APIs
Message-ID: <202402231851.2NeORqwi-lkp@intel.com>
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
In-Reply-To: <1708531057-67392-2-git-send-email-jdamato@fastly.com>
References: <1708531057-67392-2-git-send-email-jdamato@fastly.com>
TO: Joe Damato <jdamato@fastly.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Joe Damato <jdamato@fastly.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Jesper Dangaard Brouer <hawk@kernel.org>
CC: Stanislav Fomichev <sdf@google.com>
CC: Amritha Nambiar <amritha.nambiar@intel.com>
CC: Larysa Zaremba <larysa.zaremba@intel.com>
CC: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Tariq Toukan <tariqt@nvidia.com>
CC: Sridhar Samudrala <sridhar.samudrala@intel.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Hi Joe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/netdev-genl-Add-ifname-for-queue-and-NAPI-APIs/20240222-000134
base:   net-next/main
patch link:    https://lore.kernel.org/r/1708531057-67392-2-git-send-email-jdamato%40fastly.com
patch subject: [PATCH net-next 1/2] netdev-genl: Add ifname for queue and NAPI APIs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240222 (https://download.01.org/0day-ci/archive/20240223/202402231851.2NeORqwi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402231851.2NeORqwi-lkp@intel.com/

New smatch warnings:
net/core/netdev-genl.c:388 netdev_nl_queue_get_doit() error: uninitialized symbol 'ifname'.

Old smatch warnings:
net/core/netdev-genl.c:45 netdev_nl_dev_fill() warn: inconsistent indenting

vim +/ifname +388 net/core/netdev-genl.c

6b6171db7fc8f7 Amritha Nambiar 2023-12-01  370  
bc877956272f05 Amritha Nambiar 2023-12-01  371  int netdev_nl_queue_get_doit(struct sk_buff *skb, struct genl_info *info)
bc877956272f05 Amritha Nambiar 2023-12-01  372  {
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  373  	u32 q_id, q_type, ifindex;
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  374  	struct net_device *netdev;
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  375  	struct sk_buff *rsp;
f340b224321fa6 Joe Damato      2024-02-21  376  	char *ifname;
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  377  	int err;
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  378  
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  379  	if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_ID) ||
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  380  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_TYPE) ||
f340b224321fa6 Joe Damato      2024-02-21  381  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_IFINDEX) ||
f340b224321fa6 Joe Damato      2024-02-21  382  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_IFNAME))
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  383  		return -EINVAL;
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  384  
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  385  	q_id = nla_get_u32(info->attrs[NETDEV_A_QUEUE_ID]);
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  386  	q_type = nla_get_u32(info->attrs[NETDEV_A_QUEUE_TYPE]);
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  387  	ifindex = nla_get_u32(info->attrs[NETDEV_A_QUEUE_IFINDEX]);
f340b224321fa6 Joe Damato      2024-02-21 @388  	nla_strscpy(ifname, info->attrs[NETDEV_A_QUEUE_IFNAME], IFNAMSIZ);
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  389  
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  390  	rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  391  	if (!rsp)
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  392  		return -ENOMEM;
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  393  
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  394  	rtnl_lock();
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  395  
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  396  	netdev = __dev_get_by_index(genl_info_net(info), ifindex);
f340b224321fa6 Joe Damato      2024-02-21  397  
f340b224321fa6 Joe Damato      2024-02-21  398  	if (strcmp(netdev->name, ifname)) {
f340b224321fa6 Joe Damato      2024-02-21  399  		err = -ENODEV;
f340b224321fa6 Joe Damato      2024-02-21  400  	} else {
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  401  		if (netdev)
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  402  			err = netdev_nl_queue_fill(rsp, netdev, q_id, q_type, info);
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  403  		else
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  404  			err = -ENODEV;
f340b224321fa6 Joe Damato      2024-02-21  405  	}
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  406  
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  407  	rtnl_unlock();
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  408  
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  409  	if (err)
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  410  		goto err_free_msg;
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  411  
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  412  	return genlmsg_reply(rsp, info);
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  413  
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  414  err_free_msg:
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  415  	nlmsg_free(rsp);
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  416  	return err;
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  417  }
6b6171db7fc8f7 Amritha Nambiar 2023-12-01  418  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
