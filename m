Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06842244692
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 19:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756581052; cv=none; b=HfNXoSof0Bi1yvmZRrm9E9qlkLIItoIx4g+DGamzvXYWP9yR92PoK6PmSRXPpKsAikJ5sBgpsoCBqWbVKZO7tanFx3uixmqAtC40UqmfNhMy8rN3T8x9l/8H4RHRCJs9S0aIUGHHOLK5PxBJtDL/XhsO8t922HuAQwWIdDLYoVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756581052; c=relaxed/simple;
	bh=Iz4DG71NBCrtyWvuJVw1x/mW2faaiBAEtKwWdt3qnKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fN4I8Q73nE6mK7k6+svyzXDUNDn9R9l0IejgSOj8ZUEprdK7GqU5NJ6jc5ZGGgNwmyXQZ/cQfOfVlBL1HfXC4YsDHB2F+9pgyc31ydDvKa1bmEzpsr2sYnCWABNAWJbkohAPxHFMucvXn2TiUDdTT1aJ3iJ5JjBJJ74cdTWNKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGdvVFZc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGdvVFZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756581050; x=1788117050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iz4DG71NBCrtyWvuJVw1x/mW2faaiBAEtKwWdt3qnKg=;
  b=aGdvVFZcUuNxGSS9lVpTrO8DvCphRE6NRDOdmgGnXKO4VPgdQXrxSly4
   3qszuLQhNVF/KXn6IzqSLsKN6G81/PQfrciCSt2MEmzq8hM8jDBSV96N9
   mQO6pdzu1MwNecF9bbbMwbVytgVIN6Ig/9zQinc86lHhYMJwdNi3BB6TV
   R/CGCaVX0RpXme0sHFdX1GuGHNLeHABmhsLR+uyPXxONZZdZ69Nhp4qcK
   H7LoJQ1xj3vMY9p647/rneIH2l1hjBJgy4x797UwwCQ+2bUJXfD+d0Pva
   nKCwwbzkg5mVVKgLnitfs/9b4a+IHFP/5v4Q8Mz6zvPgA6TFJvfmz5wyk
   A==;
X-CSE-ConnectionGUID: FdgmvQHHR9ax2SKLnHpPnQ==
X-CSE-MsgGUID: ftnMv34MRA6qIXOMl//qSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69938553"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69938553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 12:10:49 -0700
X-CSE-ConnectionGUID: YoIisq5MSQ+Y67DKepk8gA==
X-CSE-MsgGUID: jHFFSWGiTvu/LEOtRNqAzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="207784681"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Aug 2025 12:10:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usQyL-000VdX-1V;
	Sat, 30 Aug 2025 19:10:45 +0000
Date: Sun, 31 Aug 2025 03:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v1] net: devmem: NULL check
 netdev_nl_get_dma_dev return value
Message-ID: <202508310205.YQmsa9gY-lkp@intel.com>
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
In-Reply-To: <20250829220003.3310242-1-almasrymina@google.com>
References: <20250829220003.3310242-1-almasrymina@google.com>
TO: Mina Almasry <almasrymina@google.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Mina Almasry <almasrymina@google.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Joe Damato <jdamato@fastly.com>
CC: Stanislav Fomichev <sdf@fomichev.me>

Hi Mina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4f54dff818d7b5b1d84becd5d90bc46e6233c0d7]

url:    https://github.com/intel-lab-lkp/linux/commits/Mina-Almasry/net-devmem-NULL-check-netdev_nl_get_dma_dev-return-value/20250830-060251
base:   4f54dff818d7b5b1d84becd5d90bc46e6233c0d7
patch link:    https://lore.kernel.org/r/20250829220003.3310242-1-almasrymina%40google.com
patch subject: [PATCH net-next v1] net: devmem: NULL check netdev_nl_get_dma_dev return value
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310205.YQmsa9gY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508310205.YQmsa9gY-lkp@intel.com/

New smatch warnings:
net/core/netdev-genl.c:1102 netdev_nl_bind_tx_doit() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
net/core/netdev-genl.c:50 netdev_nl_dev_fill() warn: inconsistent indenting

vim +/PTR_ERR +1102 net/core/netdev-genl.c

170aafe35cb98e Mina Almasry       2024-09-10  1045  
8802087d20c0e1 Stanislav Fomichev 2025-05-08  1046  int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
8802087d20c0e1 Stanislav Fomichev 2025-05-08  1047  {
bd61848900bff5 Mina Almasry       2025-05-08  1048  	struct net_devmem_dmabuf_binding *binding;
bd61848900bff5 Mina Almasry       2025-05-08  1049  	struct netdev_nl_sock *priv;
bd61848900bff5 Mina Almasry       2025-05-08  1050  	struct net_device *netdev;
512c88fb0e884c Dragos Tatulea     2025-08-27  1051  	struct device *dma_dev;
bd61848900bff5 Mina Almasry       2025-05-08  1052  	u32 ifindex, dmabuf_fd;
bd61848900bff5 Mina Almasry       2025-05-08  1053  	struct sk_buff *rsp;
bd61848900bff5 Mina Almasry       2025-05-08  1054  	int err = 0;
bd61848900bff5 Mina Almasry       2025-05-08  1055  	void *hdr;
bd61848900bff5 Mina Almasry       2025-05-08  1056  
bd61848900bff5 Mina Almasry       2025-05-08  1057  	if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_DEV_IFINDEX) ||
bd61848900bff5 Mina Almasry       2025-05-08  1058  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_DMABUF_FD))
bd61848900bff5 Mina Almasry       2025-05-08  1059  		return -EINVAL;
bd61848900bff5 Mina Almasry       2025-05-08  1060  
bd61848900bff5 Mina Almasry       2025-05-08  1061  	ifindex = nla_get_u32(info->attrs[NETDEV_A_DEV_IFINDEX]);
bd61848900bff5 Mina Almasry       2025-05-08  1062  	dmabuf_fd = nla_get_u32(info->attrs[NETDEV_A_DMABUF_FD]);
bd61848900bff5 Mina Almasry       2025-05-08  1063  
bd61848900bff5 Mina Almasry       2025-05-08  1064  	priv = genl_sk_priv_get(&netdev_nl_family, NETLINK_CB(skb).sk);
bd61848900bff5 Mina Almasry       2025-05-08  1065  	if (IS_ERR(priv))
bd61848900bff5 Mina Almasry       2025-05-08  1066  		return PTR_ERR(priv);
bd61848900bff5 Mina Almasry       2025-05-08  1067  
bd61848900bff5 Mina Almasry       2025-05-08  1068  	rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
bd61848900bff5 Mina Almasry       2025-05-08  1069  	if (!rsp)
bd61848900bff5 Mina Almasry       2025-05-08  1070  		return -ENOMEM;
bd61848900bff5 Mina Almasry       2025-05-08  1071  
bd61848900bff5 Mina Almasry       2025-05-08  1072  	hdr = genlmsg_iput(rsp, info);
bd61848900bff5 Mina Almasry       2025-05-08  1073  	if (!hdr) {
bd61848900bff5 Mina Almasry       2025-05-08  1074  		err = -EMSGSIZE;
bd61848900bff5 Mina Almasry       2025-05-08  1075  		goto err_genlmsg_free;
bd61848900bff5 Mina Almasry       2025-05-08  1076  	}
bd61848900bff5 Mina Almasry       2025-05-08  1077  
bd61848900bff5 Mina Almasry       2025-05-08  1078  	mutex_lock(&priv->lock);
bd61848900bff5 Mina Almasry       2025-05-08  1079  
bd61848900bff5 Mina Almasry       2025-05-08  1080  	netdev = netdev_get_by_index_lock(genl_info_net(info), ifindex);
bd61848900bff5 Mina Almasry       2025-05-08  1081  	if (!netdev) {
bd61848900bff5 Mina Almasry       2025-05-08  1082  		err = -ENODEV;
bd61848900bff5 Mina Almasry       2025-05-08  1083  		goto err_unlock_sock;
bd61848900bff5 Mina Almasry       2025-05-08  1084  	}
bd61848900bff5 Mina Almasry       2025-05-08  1085  
bd61848900bff5 Mina Almasry       2025-05-08  1086  	if (!netif_device_present(netdev)) {
bd61848900bff5 Mina Almasry       2025-05-08  1087  		err = -ENODEV;
bd61848900bff5 Mina Almasry       2025-05-08  1088  		goto err_unlock_netdev;
bd61848900bff5 Mina Almasry       2025-05-08  1089  	}
bd61848900bff5 Mina Almasry       2025-05-08  1090  
ae28cb114727dd Mina Almasry       2025-05-08  1091  	if (!netdev->netmem_tx) {
ae28cb114727dd Mina Almasry       2025-05-08  1092  		err = -EOPNOTSUPP;
ae28cb114727dd Mina Almasry       2025-05-08  1093  		NL_SET_ERR_MSG(info->extack,
ae28cb114727dd Mina Almasry       2025-05-08  1094  			       "Driver does not support netmem TX");
ae28cb114727dd Mina Almasry       2025-05-08  1095  		goto err_unlock_netdev;
ae28cb114727dd Mina Almasry       2025-05-08  1096  	}
ae28cb114727dd Mina Almasry       2025-05-08  1097  
512c88fb0e884c Dragos Tatulea     2025-08-27  1098  	dma_dev = netdev_queue_get_dma_dev(netdev, 0);
512c88fb0e884c Dragos Tatulea     2025-08-27  1099  	binding = net_devmem_bind_dmabuf(netdev, dma_dev, DMA_TO_DEVICE,
512c88fb0e884c Dragos Tatulea     2025-08-27  1100  					 dmabuf_fd, priv, info->extack);
991dbef67e2c35 Mina Almasry       2025-08-29  1101  	if (IS_ERR_OR_NULL(binding)) {
bd61848900bff5 Mina Almasry       2025-05-08 @1102  		err = PTR_ERR(binding);
bd61848900bff5 Mina Almasry       2025-05-08  1103  		goto err_unlock_netdev;
bd61848900bff5 Mina Almasry       2025-05-08  1104  	}
bd61848900bff5 Mina Almasry       2025-05-08  1105  
bd61848900bff5 Mina Almasry       2025-05-08  1106  	nla_put_u32(rsp, NETDEV_A_DMABUF_ID, binding->id);
bd61848900bff5 Mina Almasry       2025-05-08  1107  	genlmsg_end(rsp, hdr);
bd61848900bff5 Mina Almasry       2025-05-08  1108  
bd61848900bff5 Mina Almasry       2025-05-08  1109  	netdev_unlock(netdev);
bd61848900bff5 Mina Almasry       2025-05-08  1110  	mutex_unlock(&priv->lock);
bd61848900bff5 Mina Almasry       2025-05-08  1111  
bd61848900bff5 Mina Almasry       2025-05-08  1112  	return genlmsg_reply(rsp, info);
bd61848900bff5 Mina Almasry       2025-05-08  1113  
bd61848900bff5 Mina Almasry       2025-05-08  1114  err_unlock_netdev:
bd61848900bff5 Mina Almasry       2025-05-08  1115  	netdev_unlock(netdev);
bd61848900bff5 Mina Almasry       2025-05-08  1116  err_unlock_sock:
bd61848900bff5 Mina Almasry       2025-05-08  1117  	mutex_unlock(&priv->lock);
bd61848900bff5 Mina Almasry       2025-05-08  1118  err_genlmsg_free:
bd61848900bff5 Mina Almasry       2025-05-08  1119  	nlmsg_free(rsp);
bd61848900bff5 Mina Almasry       2025-05-08  1120  	return err;
8802087d20c0e1 Stanislav Fomichev 2025-05-08  1121  }
8802087d20c0e1 Stanislav Fomichev 2025-05-08  1122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
